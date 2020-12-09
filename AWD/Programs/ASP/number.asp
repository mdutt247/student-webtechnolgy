<form action="" name="numberofday" method="get">
number:<input type="text" name="number"><br>
<input type="submit" name="result" value="click">
</form>
<%
dim num

num=CInt(request.querystring("number"))
select case num
case "1"
response.write("monday")
case "2"
response.write("Tuesday")
case "3"
response.write("Wednesday")
case "4"
response.write("Thursday")
case "5"
response.write("Friday")
case "6"
response.write("Saturday")
case "7"
response.write("sunday")

end select



%>









