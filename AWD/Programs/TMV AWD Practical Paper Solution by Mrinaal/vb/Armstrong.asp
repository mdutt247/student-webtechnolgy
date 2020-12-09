<%
dim n,sum,i,d
sum = 0
n = Cint(request.querystring("n"))

for i=1 to len(n)
	d = Cint(Mid(n,i,1))
	sum = sum + d^3
next

if sum=n then
response.write(n&" is armstrong")
else
response.write(n&" is not armstrong")
end if

%>
