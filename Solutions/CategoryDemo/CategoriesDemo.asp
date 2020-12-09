<HTML>
<HEAD>
<TITLE>Category and Subcategory Drop Down Lists Demonstration</TITLE>

<SCRIPT Language="JavaScript">
// this function is called by the second drop down list "onChange" handler
function goNextPage(sel)
{
	// don't process this if no valid selection...
	if ( sel.selectedIndex == 0 ) return;
	// okay...go on to next page!
	sel.form.action = "showSelectedCategories.asp";
	sel.form.submit();
        sel.form.action = "";
}
</SCRIPT>

</HEAD>

<%
' create and open the connection to the database
Set catConn = Server.CreateObject("ADODB.Connection")
catConn.Open = "Provider=Microsoft.Jet.OLEDB.4.0;" _
            & "Data Source=" & Server.MapPath("CategoryDemo.mdb") & ";"

' we always need the list of categories, so get it now
Set catRS = catConn.Execute("SELECT CategoryNumber, CategoryName " _
                            & " FROM Categories ORDER BY CategoryName")
' convert the record set to an array
catRows = catRS.getRows

' and clean up
catRS.Close
Set catRS = nothing

' did user choose a category from the drop down list the
' last time on this page?
catChosen = Request.Form("CategorySelect")
showSubcat = False
If (("X" & catChosen) <> "X") AND (catChosen <> "NONE") Then
    ' yes, he/she did
    ' make sure that chosen category type matches DB field type for query
    catChosen = CInt(catChosen)
    ' and say we *will* show subcategories
    showSubcat = True
    ' so get the list of subcategories for given category
    Set subRS = catConn.Execute("SELECT SubcategoryNumber, SubcategoryName " _
                            & " FROM Subcategories" _
                            & " WHERE CategoryNumber=" & catChosen _
                            & " ORDER BY SubcategoryName")
    ' and, again, convert the record set to an array
    subRows = subRS.getRows
    subRS.Close
    Set subRS = nothing
End If

' clean up all the DB related stuff as soon as possible
catConn.Close
Set catConn = nothing

' and now make the HTML display of the form:
%>

<CENTER>
<H2>Category and Subcategory Drop Down Lists Demonstration<P>
(Creation of the subcategory list done in ASP code)</H2>
</CENTER>
<P>
Please fill in all fields:<P>

<FORM Name="DemoForm" Action="CategoriesDemo.asp" Method=Post>
Your name: <INPUT Name="UserName" Size=50 
                  Value="<%= Request.Form("UserName") %>" >
<BR>
EMail address: <INPUT Name="UserEMail" Size=50 
                      Value="<%= Request.Form("UserEMail") %>" >
<P>
I prefer to receive notices via (check all that apply):<br>
    <INPUT Type=Checkbox Name="ViaEMail" 
           Value="CHECKED" <%= Request.Form("ViaEMail") %>
    > EMail     
    <INPUT Type=Checkbox Name="ViaNewsletter" 
           Value="CHECKED" <%= Request.Form("ViaNewsletter") %>
    > Newsletter     
    <INPUT Type=Checkbox Name="ViaSnailMail" 
           Value="CHECKED" <%= Request.Form("ViaSnailMail") %>
    > Postal Mail     
    <INPUT Type=Checkbox Name="ViaESP" 
           Value="CHECKED" <%= Request.Form("ViaESP") %>
    > Mental Telepathy

<HR><P>
What kind of products are you interested in?<P>
First select a category and then, when the list of subcategories
appears, select a subcategory:<P>

<SELECT Name="CategorySelect" MULTIPLE size=10           
        onChange="document.DemoForm.submit();">
    <OPTION Value="NONE">-- choose a category below--
<% For cnum = 0 To UBound(catRows,2) %>
    <OPTION Value="<%= catRows(0,cnum) %>"
            <% If catRows(0,cnum) = catChosen Then %>
            SELECTED
            <% End If %>
            ><%= catRows(1,cnum) %>
<% Next %>
</SELECT>

           

<SELECT Name="SubcategorySelect" MULTIPLE Size=10
		onChange="goNextPage(this);" >
<% If showSubcat = False Then %>
    <OPTION Value="0">-- no subcategories yet --
<% Else %>
    <OPTION Value="0">-- choose a subcategory below--
    <% For cnum = 0 To UBound(subRows,2) %>
        <OPTION Value="<%= subRows(0,cnum) %>"><%= subRows(1,cnum) %>
    <% Next %>
<% End If %>
</SELECT>
</FORM>
<hr>
<p>
</BODY>
</HTML>