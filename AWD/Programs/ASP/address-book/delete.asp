<%
if Session("user")="" then
response.redirect("login.asp?m=Direct access/Session expired")
end if
%>
<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.Jet.OLEDB.4.0"
conn.open Server.MapPath(".\AddressBook.mdb")
'conn.Open Request.ServerVariables("APPL_PHYSICAL_PATH") & "AddressBook.mdb"
id=Request.QueryString("id")
action=Request.QueryString("a")
set rs=Server.CreateObject("ADODB.Recordset")
rs.open "SELECT * FROM detail WHERE id=" & id ,conn
%>
<html> <head> <title>Address Book: <%=action%></title>
</head>
<body> <center>
<!--#include file="header.inc"-->
<h3>Address Book: <%=action%> Record</h3>
<form method="post" action="do_<%=action%>.asp">
<table align="center">
<tr> <td>Id:</td> <td><%= rs.Fields.Item("id").Value%></td></tr>
<tr> <td>Name:</td> <td><%= rs.Fields.Item("name").Value%></td></tr>
<tr> <td>Phone:</td> <td><%= rs.Fields.Item("phone").Value%></td></tr>
<input type='hidden' name='txtId' value='<%= rs.Fields.Item("id").Value%>'>
<tr> <td colspan='2'><input type="submit" value="<%=action%> record"> </td></tr>
</table>
</form>
<!--#include file="footer.inc"-->
</center>
</body>
</html>
<%
rs.close
conn.close
%>
