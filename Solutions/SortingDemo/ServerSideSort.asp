<HTML>
<HEAD>
<TITLE>Server-Side Table Sorting Demo</TITLE>
</HEAD>

<BODY bgColor="lightgrey">
<%
' This page demonstrates one way to sort a page by a column 
' selected by the user.
'
' See below for how we create hyperlinks that, in turn, invoke
' a form submission that provides us with a "SortBy" argument.
' (On the initial invocation of the page, no "SortBy" is given,
' so we provide a default, of course!)
'
ordering = "" & Request("SortBy") ' the & ensures this is a string!
sortMsg  = "" & Request("SortMsg") 

prefixes = Array( "<TH Width='20%'>","<TH Width='60%'>","<TH Width='22%'>" )
suffixes = Array( "","","" )

If ordering = "" Then 
    ordering = "SKU"
    sortMsg = "SKU"
    sortColumn = 0
Else
    sortColumn = CInt( Request("SortColumn") )
End If

priorOrder = "" & Request("PriorSortBy") ' what did we sort by last time?

If ordering = priorOrder Then
    ' if same field, then reverse the sort...
    ordering = ordering & " DESC" 
    ' and then say no prior sort, so that a third
    ' click on the column will go back to ascending!
    priorOrder = ""
    ' and this is just for the header message:
    sortMsg = "<i>in reverse</i> by " & sortMsg
    ' $$$ and pick the right image
    prefixes(sortColumn) = "<TH bgColor='yellow'><IMG Src='UpArrow.gif'>"
Else
    ' set the priorOrder to the current one so that
    ' another click on the column will do a reverse sort
    priorOrder = ordering 
    ' and this is just for the header message:
    sortMsg = "by " & sortMsg
    ' $$$ and pick the right image
    prefixes(sortColumn) = "<TH bgColor='yellow'><IMG Src='DownArrow.gif'>"
End If

' Now connect to the DB and request the data, in the 
' chosen ordering!
'
' The table in the database has these field:
' SKU      			-- numeric
' productName     	-- text
' price        		-- numeric
'
SQL = "SELECT SKU, productName, price " _
      & " FROM Products ORDER BY " & ordering

' uncomment next line for debugging
' Response.Write "<P>SQL is: " & SQL & "<HR>" & vbNewLine

'create and open the connection to the database
dbq = Server.MapPath("ProductDB.mdb")
' uncomment next line for debugging purposes!
' Response.Write "dbq is [" & dbq & "]<P>" & vbNewLine

Set Conn = Server.CreateObject("ADODB.Connection")
' we use a DSN-less connection...
Conn.Open "DRIVER=Microsoft Access Driver (*.mdb);" _
            & "DBQ=" & dbq

' and we get our recordset!
Set RS = Conn.Execute( SQL )
If RS.EOF Then
    Response.Write "System error: No data from query '" & SQL & "'"
    Response.End
End If

' Now finally ready to create the HTML output...
' 
' first the 100% hidden form, then the JS function to
' invoke that form, and finally the table display:
'
%>

<FORM Name="HiddenForm" Method="Post">
<INPUT Type=Hidden Name="SortBy">
<INPUT Type=Hidden Name="SortMsg">
<INPUT Type=Hidden Name="SortColumn">
<INPUT Type=Hidden Name="PriorSortBy" Value="<% = priorOrder %>">
</FORM>

<SCRIPT Language="JavaScript">
function goSort( fldName, headerText, columnNum )
{
    theForm = document.HiddenForm;
    theForm.SortBy.value = fldName;
    theForm.SortMsg.value = headerText;
    theForm.SortColumn.value = columnNum;
    theForm.submit( );
}
</SCRIPT>

<CENTER>
<H3>List of All Products sorted <% = sortMsg %></H3>
<P>
<FONT Size='-1'>
<I>Click on a column title to sort by that column; click again to reverse the sort.</I>
</FONT>
<TABLE Width='100%' Border=1 CellPadding=3 bgColor=lightgreen>
<TR>
	
    <% = prefixes(0) %><A HREF="javascript:goSort('SKU','SKU',0);">SKU</A>
    </TH>
	
    <% = prefixes(1) %><A HREF="javascript:goSort('productName','Product Name',1);">Product Name</A>
    </TH>
	
	<% = prefixes(2) %><A HREF="javascript:goSort('price','Price',2);">Price</A>
	</TH>
</TR>

<%
Do Until RS.EOF 
    Response.Write _
    "<TR>" & _
    "    <TD Align='CENTER'>" & RS("SKU") & "</TD>" & _
    "    <TD>" & RS("productName") & "</TD>" & _
    "    <TD Align='CENTER'>" & RS("price") & "</TD>" & _
    "</TR>" & vbNewLine
    
    RS.MoveNext
Loop
%>

</TABLE>

</BODY>




