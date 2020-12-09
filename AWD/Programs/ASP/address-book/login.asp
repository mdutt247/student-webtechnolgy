<html><head><title>Address Book: Login</title></head>
<body>
<center>
<h3>Provide login details:</h3>
<font color='red'><%=Request.QueryString("m")%></font>
<form action='login.asp' method='post'>
<p>User ID:<input type='text' name='txtId'></p>
<p>Password:<input type='password' name='txtPwd'>
<br>
<p> <input type="submit" name="subBtn" value="Login"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value="Reset" > </p>
</form>

<%
'Error: ADODB.Connection error '800a0e7a' Provider cannot be found. It may not be properly installed.

'Check the site's Application Pool in IIS / Application Pools / YourPoolHere / Advanced Settings :
'1 Advanced / Enable 32-Bit Applications: True
'2 Managed Pipeline Mode : Classic

if request.form("subBtn")="Login" then

 set conn=Server.CreateObject("ADODB.Connection")
 conn.Provider="Microsoft.Jet.OLEDB.4.0"
 conn.open Server.MapPath(".\AddressBook.mdb")
 'conn.Open Request.ServerVariables("APPL_PHYSICAL_PATH") & "\address-book\AddressBook.mdb"
 set rs = Server.CreateObject("ADODB.recordset")
 rs.Open "SELECT id,uName,pWord FROM userTable WHERE uName = '" & trim(request.form("txtId")) & "' AND pWord = '" & trim(request.form("txtPwd")) & "'", conn
 response.write err.description
 if rs.EoF then
  response.redirect("login.asp?m=Invalid ID/Password")
 else
  Session.Timeout=5
  Session("user")=request.form("txtId")
  response.redirect("view.asp")
 end if
end if
%>
<!--#include file="footer.inc"-->
</center>
</body>
</html>