<form action="" name="calculator" method="get">
Num1:<input type="text" name="num1"><br>
Operator:<select name=operator><br>
<option>+</option>
<option>-</option>
<option>*</option>
<option>/</option>
</select><br>
Num2:<input type="text" name="num2"><br>
<input type="submit"name="result">
</form>
<%
dim n1,n2,ope
n1=CInt(request.querystring("num1"))
n2=CInt(request.querystring("num2"))
ope=request.querystring("operator")

select case ope
case"+"
response.write(n1+n2)

case"-"
response.write(n1-n2)

case"*"
response.write(n1*n2)

case"/"
response.write(n1/n2)
end select

%>