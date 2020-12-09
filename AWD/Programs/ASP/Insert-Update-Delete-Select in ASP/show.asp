<% @ language=VBScript %>

<%
set con = Server.CreateObject("ADODB.Connection")
con.Provider = "Microsoft.ACE.OLEDB.12.0"
con.Open "D:\myDB.accdb"

set rs = Server.CreateObject("ADODB.RecordSet") 
rs.Open "Select * from stuTable", con
%>
<table border="1">
<tr> <th>ID</th><th>Name</th><th>Course</th><th>Phone</th><th>Action to be performed</th></tr>

<%
do until rs.EOF
%>
<tr><td><%=rs.Fields.Item("ID").Value%></td><td><%=rs.Fields.Item("Name").Value%></td><td><%=rs.Fields.Item("Course").Value%></td><td><%=rs.Fields.Item("Phone").Value%></td><td> <a href="handler.asp?cmd=upd&id=<%=rs.Fields.Item("ID").Value%>">Update</a>  &emsp;|&emsp;<a href="handler.asp?cmd=del&id=<%=rs.Fields.Item("ID").Value%>">Delete</a> </td></tr>
<%
	rs.MoveNext	
loop
%>
</table>
<%
set rs = Nothing 'rs.close
set con = Nothing 'con.close
%>
<br />
<br />

<a href="insert.asp">Add record</a>

