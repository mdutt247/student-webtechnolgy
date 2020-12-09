<html>
<%

if request.querystring("fname")<>"" then
response.cookies("name")= request.querystring("fname")
response.cookies("name").expires=#April 30, 2018#

response.cookies("color")=request.querystring("cname")
response.cookies("color").expires=#April 30, 2018#
end if

%>
<body bgcolor=<%=request.cookies("color")%>>
<h1>Welcome <%=request.cookies("name")%></h1>
</body>
</html>
