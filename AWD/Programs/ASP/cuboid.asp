<form action="" name="cuboid" method="get">

length:<input type="text" name="length"><br>
breadth:<input type="text" name="breath"><br>
height:<input type="text" name="height"><br>
<input type="submit" name="result" value="calculate">
</form>
<%
dim l,b,h
l=CInt(request.querystring("length"))
b=CInt(request.querystring("breath"))
h=CInt(request.querystring("height"))

response.write(l*b*h)



%>