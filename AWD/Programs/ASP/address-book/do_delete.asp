<%
if Session("user")="" then
response.redirect("login.asp?m=Direct access/Session expired")
end if
%>
<center>
<!--#include file="header.inc"-->
<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.Jet.OLEDB.4.0"
conn.open Server.MapPath(".\AddressBook.mdb")
'conn.Open Request.ServerVariables("APPL_PHYSICAL_PATH") & "AddressBook.mdb"
sql="Delete from detail WHERE id=" & Request.Form("txtId")
on error resume next
conn.Execute sql
if err then
response.write("Error! ")
'response.write(err.description)
else
response.write("<br><br>Record no " & Request.Form("txtId") & " " & Request.Form("txtName") & " " & Request.Form("txtNo") &  " deleted successfully!<br>")
end if
conn.close
%>
<!--#include file="footer.inc"-->
</center>