<html>
<body>

<form action="request_QueryString.asp" method="get">
First name: <input type="text" name="fname"><br>
Last name: <input type="text" name="lname"><br>
<input type="submit" value="Submit">
</form>

<%
Response.Write("All values: " & Request.QueryString)
Response.Write("<br>First Name: " & Request.QueryString("fname"))
Response.Write("<br>Last Name: " & Request.QueryString("lname"))
%>

</body>
</html>