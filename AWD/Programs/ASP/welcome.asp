<%
response.write("welcome<br>")
dim u,p
u=request.form("loginid")
p=request.form("password")
response.write("<b><center>"&"User ID: "&u&"<br>"&"Password: "&p&"</center></b>")
%>