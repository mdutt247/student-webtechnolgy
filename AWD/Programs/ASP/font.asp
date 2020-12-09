<form action="" method="get" name="changefont">
fontsize: <input type="text" name="font"><br>
<input type="submit" name="change" value="Change">
</form>

<%
dim fnt
fnt=CInt(request.querystring("font"))
%>

<body>
<font size=<% response.write(fnt)%>>
Ibsar
</font>


</body>
