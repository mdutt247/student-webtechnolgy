<form action="" name="table" method="get">
Number:<input type="text" name="number"><br>
<input type="submit" name="result" value="display">
</form>
<%
if request.querystring("result")="display" then

dim n
n=CInt(request.querystring("number"))
for i=1 to 10 
response.write(n&"*"&i&"="&n*i&"<br>")
next

end if
%>