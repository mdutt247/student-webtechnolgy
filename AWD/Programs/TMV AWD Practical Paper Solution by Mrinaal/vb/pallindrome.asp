<%
dim s1,a,b
s1 = Cstr(request.querystring("s"))
a = lcase(s1)
b = strreverse(a)

if a = b then
response.write(s1&" is pallindrome")
else
response.write(s1&" is not pallindrome")
end if

%>