<%
dim n,sum,d
sum = 0
n = request.querystring("n")    'taking value from querystring

while n <> 0
d = n mod 10
sum = sum +d
n = n\10                       'using \ for integer division
wend
response.write("Sum of digits of : "&request.querystring("n")&" is = "&sum)
%>