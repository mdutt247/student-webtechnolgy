<html>
<body>

<%
dim x
dim y
x = Request.Form("firstname")
y = Request.Form("lastname")
response.write("Your name is "&x&" "&y&	".")
response.write("<br><br>Thanks for your Feedback!")
%>
</body>
</html>