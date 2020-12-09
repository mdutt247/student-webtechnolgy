<% Option Explicit %>
<HTML>
<head>
<title>The WhizBang Zip Code Locator and Mapper</title>
<style>
body, td { font-family: arial, helvetica, sans-serif; font-size: small; }
</style>
<!-- include the google JavaScript map api -->
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAABScBZYYiUnbFQ0dc3fIpmxRlkOHaQTkWtouAMgETqeahg2OrjxRzRZtP0j4XaflwoOnj8V_4NnUcoQ"
      type="text/javascript"></script>

</head>
<body onLoad="initMap()" onUnLoad="GUnload()">
<center>
<h2>Find all zip codes with an area around a "home" zip code</h2>
<%

CONST DODEBUG = False ' change to true to see debug output

' ASP code to get nearby zip codes and latitudes and longitudes
'
' we display up to 9 of the closest zip codes
'
Dim lats(9), longs(9), zips(9)
Dim conn, RS, SQL
Dim ZOOM

Dim oops : oops = ""
Dim radius : radius = 15 ' default radius is 15 miles...change as desired
On Error Resume Next
    ' if form field isn't a valid integer, then radius will be unchanged at 15
    radius  = CINT( Trim( Request("radius") ) )
On Error GoTo 0
If radius > 250 Then radius = 250 ' a reason maximum...and even it is too large except in Alaska

' so what is home zip code?
Dim homeZip : homeZip = Trim( Request("zipcode") )
If Len(homeZip) = 5 AND IsNumeric(homeZip) Then

    ' create and open the connection to the database 
    Set conn = Server.CreateObject("ADODB.Connection") 
    conn.Open = "Provider=Microsoft.Jet.OLEDB.4.0;" _
            & "Data Source=" & Server.MapPath("zipcodes.mdb") & ";"
    ' first, find that zip in the DB:
    SQL = "SELECT * FROM ZipCodes WHERE zipcode = '" & homeZip & "'"
    If DODEBUG Then Response.Write SQL & "<HR>"

    Set RS = conn.Execute( SQL )
    If RS.EOF Then
        oops = "Sorry, no match on zip code " & homeZip
    Else

        ' ZOOM factor depends on radius chosen
        ' There's probably a smarter algorithm, but given how long the "trip" to
        ' google for the map is going to take, this is surely adequate:
        ' 
        ZOOM = 12
        If radius > 4 Then ZOOM = 11
        If radius > 8 Then ZOOM = 10
        If radius > 15 Then ZOOM = 9
        If radius > 29 Then ZOOM = 8
        If radius > 59 Then ZOOM = 7
        If radius > 115 Then ZOOM = 6
        If radius > 175 Then ZOOM = 5
 
        Dim rAdjust : rAdjust = radius + 1 ' add 1 mile for safety
        
        ' the values for home we got from first query:
        Dim homeLat, homeLong, homeCity, homeState

        homeLat = RS("latitudeMiles") ' in miles
        homeLong = RS("longitude") ' in degrees
        homeCity = RS("city")
        homeState = RS("state")

        ' and then the numbers used to center the map:
        Dim centerLat, centerLong, longMPD, longAdjust
        Dim minLat, maxLat, minLong, maxLong

        centerLat = RS("latitude") ' in degrees
        centerLong = homeLong

        longMPD = RS("longitudeMPD") ' miles per degree longitude at the home latitude
        longAdjust = rAdjust / longMPD
        RS.Close ' done with the "home" record
        
        minLat = homeLat - rAdjust
        maxLat = homeLat + rAdjust

        minLong = homeLong - longAdjust
        maxLong = homeLong + longAdjust

        ' Long explanation of the query:
        '
        ' First, the inner SELECT is used to get a list of *candidate* zip codes.
        ' The minLat/minLong and maxLat/maxLong essentiall create a rectangle with sides
        ' that are twice the chosen radius.  And so we *ONLY* select records from the 
        ' main table that fit in that rectangle.  This *ENORMOUSLY* helps the performance!
        ' If we depended solely on calculating the radius and limiting to records within
        ' that radius, we'd be doing a lot more math.  Also, if you wanted, you could
        ' add indexes to the latitudeMiles and longitude fields and likely get even better
        ' peformance because of the two BETWEENs, whereas the indexes would be used if you
        ' directly based the selection on radius.  Notice that the values returned from the
        ' inner SELECT include the *square* of the distance between the home zip and the
        ' candidate zip.  
        '
        ' So once that inner SELECT has gotten the list of candidate zips, we further
        ' filter them, in the outer SELECT by only accepting "dist" values (remember, that is
        ' the square of the radius!) that are within the right range (that is, less than the 
        ' square of the "adjusted" radius).  Again, this should be an improvement help, 
        ' avoiding the need to do a square root, untll...
        ' Finally, the SELECT returns the actual radius, along with the other important 
        ' fields from the zipcode table.  You could choose to only get specific fields instead
        ' of using "Z.*", but we are only wasting a few bytes and very very little time, 
        ' so I got lazy.
        '
        ' One more thing to explain:  In order to get a reasonable accuracy to the radius, 
        ' we need to base our distance on the correct miles per degree.  In tha case of
        ' the latitude, we can simply use a constant number of miles-per-degree, and that
        ' is reflect in the fact that the "latitudeMiles" field in the DB is indeed
        ' completely pre-calculated.  But for longitude, the miles-per-degree varies with the
        ' latitude, so instead of completely precalculating the miles, we instead pre-calculate
        ' the "longitudeMPD" (Miles Per Degree) value and store *that* in the DB.  Then we
        ' turn around an use it here.
        ' 
        ' So *nominally* our radius calculation is
        '      SQR ( ( x0 - x1 ) ^ 2 + ( y0 - y1 ) ^ 2 )
        ' (the Pythagorean theorem) but in order to get miles correctly for y, we multiply
        ' the difference in degrees longitude by the miles-per-degree value for the "home"
        ' longitude (and then square that result).  This produces an accuracy to within a
        ' tenth of a mile or two, which is much more accurate than the actual data.
        '
        ' SO:  Here it is, in all its gory!  (Yes, that is spelled correctly.)
        SQL = "SELECT SQR(Z.dist) AS radius, Z.* " _
            & " FROM (" _
            &      " SELECT ((latitudeMiles-" & homeLat & ")^2 + (" & longMPD & "*(longitude-" & homeLong & "))^2) AS dist, * " _
            &      " FROM ZipCodes " _
            &      " WHERE latitudeMiles BETWEEN " & minLat & " AND " & maxLat _
            &      " AND longitude BETWEEN " & minLong & " AND " & maxLong _
            &      " ) AS Z " _
            & " WHERE Z.dist < " & rAdjust^2 _
            & " ORDER BY 1, Z.zipcode "
        If DODEBUG Then Response.Write SQL & "<HR>"
        SET RS = conn.Execute(SQL)
        ' and now we are ready to produce the HTML results and invoke the Google map
        ' to display our best 9 matches:
%>
<TABLE border=0>
<tr>
    <td valign=top>
    <TABLE Border=1 CellPadding=5>
    <TR>
        <th>Map<br/>ID</th>
        <TH>Zip</TH>
        <TH>City</TH>
        <TH>State</TH>
        <TH>Distance<br/>(miles)</TH>
    </TR>
    <TR>
        <td bgcolor="red">&nbsp;</td>
        <td><%=homeZip%></td>
        <td><%=homeCity%></td>
        <td><%=homeState%></td>
        <td>Center</td>
    </TR>
<%
        Dim zip, city, c, state, latMiles, longDeg, latDeg, distance, id
        ' zipnum is just used to keep track of how many data points we
        ' have created for use in the Google map display
        Dim zipnum : zipnum = 0

        ' although the map will only show 9 zip codes, we will output *ALL* of them in the table
        Do Until RS.EOF
            ' get the data from one record
            zip = RS("zipcode")
            ' this code is used to "Proper Case" the name of the city...it's all upper case in the DB
            city = Split( LCASE(RS("city")), " " )
            For c = 0 To UBound(city)
                city(c) = UCASE(LEFT(city(c),1)) & Mid(city(c),2)
            Next
            city = Join(city," ")
            ' more data...
            state = RS("state")
            latMiles = RS("latitudeMiles")
            longDeg  = RS("longitude")
            latDeg   = RS("latitude")
            distance = RS("radius") ' SQR( (latMiles-homeLat)^2 + (longMPD * (longDeg-homeLong))^2 )
            ' home zipcode is already shown (see above)
            If zip <> homeZip Then ' AND Round(distance) <= radius Then
                ' remember: we display the best 9 matches in the map
                If zipnum < 9 Then
                    ' so this just remembers up to 9 locations:
                    zipnum = zipnum + 1
                    zips(zipnum)  = city & " " & zip
                    lats(zipnum)  = latDeg
                    longs(zipnum) = longDeg
                    id = zipnum ' this corresponds to the numbered "flags" on the map
                Else
                    ' non-mapped zips don't have a "flag number"
                    id = ""
                End If
                ' dump the data for one zip code into the table:
%>
        <TR>
            <td><%=id%></td>
            <td><%=zip%></td>
            <td><%=city%></td>
            <td><%=state%></td>
            <td><%=Round(distance,1)%></td>
        </TR>
<%
            End If
            ' get another
            RS.MoveNext
        Loop ' until we are done
    End If
    RS.Close 
    conn.Close
%>
        </table>
    </td>
    <td width=50>&nbsp;</td>
    <td valign=top>
        <table>
        <tr>
            <td style="border: solid black 2px;" valign=top>
            <div id="GoogleMap" style="width: 500px; height: 600px; display: none;"></div>
            </td>
        </tr>
        </table>
    </td>
</tr>
</table>
<%
Else
    oops = "Enter a zip code and radius to search"
End If
If oops <> "" Then Response.Write "<h2>" & oops & "</h2><p><hr>" & vbNewLine
%>
<FORM>
enter starting zip code: <Input name="zipcode" value="<%=homeZip%>" ID="Text1">
<br/>
enter search radius in miles: <input name="radius" value="<%=radius%>" ID="Text2">
<p>
<input type=submit value="Find matching zip codes in that range" ID="Submit1" NAME="Submit1">
</form>

<script type="text/javascript">
<% If oops <> "" Then %>
    // can't initialize the map if we had an error or no data,
    // so to avoid JS error we supply a dummy initMap function:
    function initMap() { return; }
<% Else %>
// try to create the google map!
var mapOkay = false;
// this code is all taken pretty much straight from the Google sample code...
function initMap() 
{
    if ( !GBrowserIsCompatible()) 
    {
        alert("Sorry!  Your ancient browser doesn't support Google Maps!");
        return;
    }
    var mapdiv = document.getElementById("GoogleMap");
    // the DIV for the map was turned off until we validated the browser...so show it
    mapdiv.style.display = "block";
    // the map utilizes its assigne DIV:
    var map = new GMap2(mapdiv);
    // we center it on the home zip code and give it our rule-of-thumb zoom factor:
    map.setCenter(new GLatLng(<%=centerLat%>,<%=centerLong%>), <%=ZOOM%>);
    // this adds the zoom and pan controls...
    map.addControl(new GLargeMapControl()); 
    // and this allows the user to choose satellite and hybrid views:
    map.addControl(new GMapTypeControl());

    // Create a marker for the home zip code...uses Google's default marker
    var marker0 = new GMarker(new GLatLng(<%=centerLat%>, <%=centerLong%>));         
    // Show info about this marker when it is clicked
    GEvent.addListener(marker0, "click", 
        function() { marker0.openInfoWindowHtml("<br/>Zipcode: <%=homeCity & " " & homeZip%>"); } 
        );
    // and add this marker:
    map.addOverlay(marker0);
    // and if we got this far, the map is okay
    mapOkay = true;
<%
    ' now we generate as many points as needed
    Dim anum, latitude, longitude, zipcode
    // recall that we saved the marker info as we were creating the TABLE above:
    For anum = 1 To zipnum
        latitude  = lats(anum)
        longitude = longs(anum)
        zipcode = zips(anum)
%>
        // for our markers, we use custom icons that were derived from a simplified standard Google marker
        var icon = new GIcon();
        // we have image files named marker1.gif, marker2.gif, ..., marker9.gif
        icon.image = "marker<%=anum%>.gif"
        icon.iconSize = new GSize(22, 35);  /// (w,h)
        icon.iconAnchor = new GPoint(11, 36); // (w,h) -- anchor right below tip of image
        icon.infoWindowAnchor = new GPoint(11, 15);
        // Create a marker ...
        var marker<%=anum%> = new GMarker(new GLatLng(<%=latitude%>, <%=longitude%>), icon);         
        // Show info about this marker when it is clicked...for now, just the zipcode!
        GEvent.addListener( marker<%=anum%>, "click", 
                 function() { marker<%=anum%>.openInfoWindowHtml("<br/>Zipcode: <%=zipcode%>"); } 
                 );
        // and add this marker to the map:
        map.addOverlay(marker<%=anum%>);
<%
    Next
%>
} // end of the initialize map function! 
<% End If %>
</script>
</center>
</body>
</html>

