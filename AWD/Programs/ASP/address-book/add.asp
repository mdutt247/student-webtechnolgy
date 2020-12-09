<%
if Session("user")="" then
response.redirect("login.asp?m=Direct access/Session expired")
end if
%>
<html><head><title>Address Book: Add Record</title>
<Script src="validation.js" type="text/JavaScript"></Script>
</head>
<body onload='document.f1.txtName.focus()'> <center>
<!--#include file="header.inc"-->
<h3>Address Book: Add Record</h3>
<form action="do_add.asp" name="f1" method="post" onsubmit="return checkform(f1)">
<p>Name: <input type="text" name="txtName" maxlength="50"> </p>
<p>Phone: <input type="text" name="txtNo" maxlength="10"> </p>
<p> <input type="submit" name="subBtn" value="Save"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value="Reset" > </p>
</form>
<!--#include file="footer.inc"-->
</center>
</body>
</html>