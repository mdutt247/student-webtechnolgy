<%
dim n,d,sum,i
response.write("Armstrong from 1-500 are:<br>")
for n=1 to 500
	sum = 0
	for i=1 to Len(n) 
		d = Cint(Mid(n,i,1))
		sum = sum + d^3
	next
	
	if sum = n then
	response.write(n&"<br>")
	end if
next
%>