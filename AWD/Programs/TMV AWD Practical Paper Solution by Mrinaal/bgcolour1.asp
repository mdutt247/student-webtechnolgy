<form action="" method="get" name="changecolour">
Color: <input type="text" name="color"><br>
<input type="submit" name="change" value="Change">
</form>

<%
dim color
color=request.querystring("color")
%>

<body bgcolor=<%=color%>>
</body>