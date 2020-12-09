<form action="" name="concatestring" method="get">
s1:<input type="text" name="s1">
s2:<input type="text" name="s2">
catenate:<input type="submit" name="catenate" value="catenate">

</form>
<%
dim str1, str2

str1=request.querystring("s1")
str2=request.querystring("s2")

response.write(str1&str2)

%>