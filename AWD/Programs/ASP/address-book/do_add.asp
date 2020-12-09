<%
if Session("user")="" then
response.redirect("login.asp?m=Direct access/Session expired")
end if
%>
<html> <body><center>
<!--#include file="header.inc"-->
 <% 
 'Error- Operation must use an updateable query
 'Check database permissions
' - Please check whether you have given Read-write permission to MS-Access database file.
' - The Database file where it is stored (say in Folder1) is read-only..? 

 set conn=Server.CreateObject("ADODB.Connection")
 conn.Provider="Microsoft.Jet.OLEDB.4.0"
 conn.open Server.MapPath(".\AddressBook.mdb")
 'conn.Open Request.ServerVariables("APPL_PHYSICAL_PATH") & "AddressBook.mdb"
 sql="INSERT INTO detail (name,phone)"
 sql=sql & " VALUES "
 sql=sql & "('" & Request.Form("txtName") & "',"
 sql=sql & " '" & Request.Form("txtNo")   & "')"
 on error resume next
 conn.Execute sql
 if err then
 Response.Write("Error occured! ")
 Response.Write err.description
 else
 response.write "<br>"
 Response.Write Request.Form("txtName")
 Response.Write Request.Form("txtNo")
 Response.Write("<br><h3>Added successfully</h3><br>")
 end if
 conn.close
 %>  
 <!--#include file="footer.inc"-->
 </center>
 </body> </html>