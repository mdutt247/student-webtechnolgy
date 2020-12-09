<html>
<head><title>Address Book: All Records</title></head>
<%
if Session("user")="" then
response.redirect("login.asp?m=Direct access/Session expired")
end if
%>
<body><center>
<!--#include file="header.inc"-->
<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.Jet.OLEDB.4.0"
conn.open Server.MapPath(".\AddressBook.mdb")
'conn.Open Request.ServerVariables("APPL_PHYSICAL_PATH") & "AddressBook.mdb"
set rs = Server.CreateObject("ADODB.recordset")
rs.Open "SELECT id, name, phone FROM detail", conn
%>  
<h3>Following data is there in database</h3>
<table border="1" width="40%" align="center">
<tr><th>Name</th><th>Phone</th><th>Action</th></tr> 
<% do until rs.EOF %>   
<tr><td><%= rs.Fields.Item("name").Value%></td>
<td><%= rs.Fields.Item("phone").Value%></td>
<td align="center">
<a href="update.asp?id=<%= rs.Fields.Item("id").Value%>&a=Update">Update</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="delete.asp?id=<%= rs.Fields.Item("id").Value%>&a=Delete">Delete</a>
</td><% rs.MoveNext %></tr>
<%
loop
rs.close
conn.close
%> 
</table> 
<!--#include file="footer.inc"-->
</center> 
</body> </html>