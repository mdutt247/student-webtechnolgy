<html>
<body>
<h2>Sum of two digitsin ASP</h2>
<form action="" method="get">
<input type="text" name="num1" placeholder="Enter number 1"><br><br>
<input type="text" name="num2" placeholder="ENter number 2"><br><br>
<input type="submit" value="add">
</form>

<%
dim x,y,z
x = CInt(request.querystring("num1"))
y = CInt(request.querystring("num2"))

z = x + y
%>
Result : <br>
<input disabled value=<%response.write(z)%>>
</body>
</html>