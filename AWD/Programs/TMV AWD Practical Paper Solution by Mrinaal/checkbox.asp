<html>
<body>
<form action="" method="get">
<input type="checkbox" name="gender" value="male" >Male<br>
<input type="checkbox" name="gender" value="female">Female<br>
<input type="checkbox" name="gender" value="trans">Trans<br>
<input type="checkbox" name="gender" value="other">Other<br><br>
<input type="submit">
</form>
<br>
<%
dim g,i,arr,m,f,t,o
m = 0
f = 0
t = 0
o = 0
g = request.querystring("gender")
arr = split(g,",")
for each i in arr
response.write(i&"<br>")
next
for each i in arr
if i = "male" then
m = 1
elseif i = "female" then
f = 1
elseif i = "trans" then
t = 1
elseif i = "other" then
o = 1
end if
response.write(i&"<br>")
next
response.write(m&f&t&o)
%>
</body>
</html>