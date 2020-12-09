<%
dim n,i,flag,txt
txt = "Prime b/w 1-100 are:<br>"
for n=2 to 100
	flag = 0
	For i=2 to n-1
		if n mod i = 0 then
			flag = 1
			exit for
		end if
	next
	if flag = 0 then
		txt = txt &n& "<br>"
	end if
next
response.write(txt)
	
%>