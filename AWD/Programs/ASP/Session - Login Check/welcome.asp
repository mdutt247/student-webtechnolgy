<%@language="VBScript"%>
<html>
<body>
<%
if Session("userName") = "" then
	response.write("Direct access not allowed<br>")
	response.write("<a href='login.html'>Click here to go to login page</a>")
else
	response.write "<h1>Welcome </h1> <h3>" & Session("userName") & "</h3>"
end if
%>
</body>
</html>