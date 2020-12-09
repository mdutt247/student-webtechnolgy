<html>
<body>
<h1>Taking 4 values in an Array</h1>
<form action="" method="get">
<input type="text" name="1" placeholder="enter name 1"><br><br>
<input type="text" name="2" placeholder="enter name 2"><br><br>
<input type="text" name="3" placeholder="enter name 3"><br><br>
<input type="text" name="4" placeholder="enter name 4"><br><br>
<input type="submit" value="Click me">
</form>
<h4>Result will appear below:</h4><br>
<%
a=Array(request.querystring("1"),request.querystring("2"),request.querystring("3"),request.querystring("4"))

for each i in a
    response.write(i&"<br />")
next

%>

</body>
</html>