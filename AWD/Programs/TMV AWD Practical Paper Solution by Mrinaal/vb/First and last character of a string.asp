<%
dim n
n = request.querystring("s")
response.write("First character of <u>"&n&"</u> is : <b>"&left(n,1)&"</b><br>Last character of  <u>"&n&"</u> is : <b>"&Right(n,1)&"</b>")
%>