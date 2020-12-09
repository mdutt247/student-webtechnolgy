<%
dim i, sum
sum=0

for i=1 to 15 step 2
response.write(i*i*i&"<br>")
sum=sum+(i*i*i)
next

response.write("Sum: "&sum)




%>