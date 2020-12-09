<html>
<body>

<form action="request_totalbytes.asp" method="post">
Please type something:
<input type="text" name="txt"><br><br>
<input type="submit" value="Submit">
</form>

<%
If Request.Form("txt")<>"" Then
   Response.Write("You submitted: ")
   Response.Write(Request.Form)
   Response.Write("<br><br>")
   Response.Write("Total bytes: ")
   Response.Write(Request.Totalbytes)
End If
%>

</body>
</html>