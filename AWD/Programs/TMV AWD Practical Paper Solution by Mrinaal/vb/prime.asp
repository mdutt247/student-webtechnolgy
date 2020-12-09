<%
dim n,i,flag
flag = 0
n = Cint(request.querystring("n"))


For i=2 to n-1
if n mod i = 0 then
flag = 1
exit for
end if
next




if flag = 0 then
response.write("prime")
else
response.write("not prime")
end if

%>