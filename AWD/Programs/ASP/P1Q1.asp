<form name="loginfrm" action="P1Q1.asp" method="post">
Login ID: <input type="text" name="txtid"><br>
Password: <input type="password" name="txtpwd"><br>
<input type="submit" name="login" value="Login">
</form>
<%
if request.form("login")="Login" then
dim uid, upwd, did, dpwd

uid=request.form("txtid")
upwd=request.form("txtpwd")

set con = Server.CreateObject("ADODB.Connection")
con.Provider="Microsoft.Jet.OLEDB.4.0"
con.Open "‪‪E:\ASPRoot\P1Q1db.mdb"

set rec = Server.CreateObject("ADODB.Recordset")
rec.Open "Select * from users where loginid='" & uid & "' ", con

did=rec.Fields.Item("loginid")
dpwd=rec.Fields.Item("loginpwd")

if uid=did and upwd=dpwd then
response.redirect("P1Q1w.asp")
else
response.write("Error")
end if

rec.close
con.close
end if
%>