<%

dim num1, num2

num1=CInt(request.querystring("num1"))
num2=CInt(request.querystring("num2"))

Select Case request.querystring("opr")

case "+" 
response.write(num1+num2)
Case "*" 
response.write(num1*num2)
Case "-" 
response.write(num1-num2)
Case "/" 
response.write(num1/num2)
End Select

 %>