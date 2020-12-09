<html>

<head>
       <title>Change text size in ASP</title>
</head>


<body>
        <h1>Changing text size in ASP</h1><br>
		
        <form action="" method="get">
              <input type="text" name="size" placeholder="Enter a font size"><br><br>
              <input type="submit" value="change">
        </form>
		
		<%
		dim x
		x = CInt(request.querystring("size"))
		%>
		
		<p><font size=<% response.write(x) %> >Answer...</font></p>
		
</body>


</html>