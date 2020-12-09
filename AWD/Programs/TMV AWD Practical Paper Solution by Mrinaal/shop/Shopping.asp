<html>
<body>
<form action="reciept.asp" method="get">
<select name="product">
<option value="Adidas">Adidas</option>
<option value="Nike">Nike</option>
<option value="Puma">Puma</option>
<option value="Reebok">Reebok</option>
</select>&emsp;
<input type="number" name="quantity" placeholder="quantity">&emsp;
<input type="submit">
</form>
<%
dim m
m = request.querystring("message")
%>

<br><br><p style="color:White;background-color:mediumseagreen"><%=m%></p>
</body>
</html>