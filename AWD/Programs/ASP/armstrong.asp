<%
dim i

dim num, m
num=243

' for i=0 to 5 step 1
' m=num mod 10
' num=num-m
' response.write(num&"<br>")
' next

m=num mod 10
num=num-m
response.write(num&"<br>")
response.write(m&"<br>")


%>