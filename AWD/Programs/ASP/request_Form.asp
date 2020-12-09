<html>
<body>

<form action="request_Form.asp" method="post">
First name: <input type="text" name="fname"><br>
Last name: <input type="text" name="lname"><br>
<input type="submit" value="Submit">
</form>

<%
Response.Write("All values: " & Request.Form)
Response.Write("<br>First Name: " & Request.Form("fname"))
Response.Write("<br>Last Name: " & Request.Form("lname"))
%>

</body>
</html>