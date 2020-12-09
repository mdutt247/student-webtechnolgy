
<html>
<head>
</head>
<body>


<center><h3>Calculator</h3></center>
<%
if request.querystring("btnCalc") = "Submit" then

	'if request.querystring(num1) = 2 then
		response.write ("fill num1")
		'response.end
	'end if
dim num1, num2

num1=CInt(request.querystring("num1"))
num2=CInt(request.querystring("num2"))

opr=request.querystring("opr")

Select Case opr

case "+" 
response.write("<b><center>Output: "&num1& " " &opr & " " &num2&" = "&num1+num2&"</center></b>")
Case "*" 
response.write("<b><center>Output: "&num1& " " &opr & " " &num2&" = "&num1*num2&"</center></b>")
Case "-" 
response.write("<b><center>Output: "&num1& " " &opr & " " &num2&" = "&num1-num2&"</center></b>")
Case "/" 
response.write("<b><center>Output: "&num1& " " &opr & " " &num2&" = "&num1/num2&"</center></b>")
End Select

end if
 %>

<form name=calc method=get action=calc.asp>
Number 1: <input type=text name=num1><br>
Operator: <select name=opr><option>Select Operator</option><option>*</option><option>+</option><option>-</option><option>/</option></select><br>
Number 2: <input type=text name=num2><br>

<input type="submit" name="btnCalc" value"Submit">



</body>
</html>