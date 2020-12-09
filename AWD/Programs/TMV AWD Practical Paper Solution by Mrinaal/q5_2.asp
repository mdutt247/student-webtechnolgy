<html>
<body>
<h1>Tables of 1 - 10</h1>
<%
dim n
for n=1 to 10
response.write("Table of "&n&" is :<br>")
for i=1 to 10 
response.write(n&" X "&i&" = "&n*i&"<br>")
next
response.write("<br><br>")
next
%>
</body>
</html>