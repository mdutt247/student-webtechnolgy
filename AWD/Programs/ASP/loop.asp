<form action="" name="person" method="get">
person:<input type="text" name="person"><br>
number:<input type="text" name="number"><br>
<input type="submit" name="result"value="display">
</form>
<%
dim p,n,i
p=request.querystring("person")
n=CInt(request.querystring("number"))

for i=1 to n

response.write(p&"<br>")

next

%>
