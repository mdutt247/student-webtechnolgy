<html>
<body>
<%
fruits=Request.Form("fruits")
%>

<form action="request_form_checkboxes.asp" method="post">
<p>Which of these fruits do you prefer:</p>
<input type="checkbox" name="fruits" value="Apples"
<%if instr(fruits,"Apple") then Response.Write("checked")%>>
Apple
<br>
<input type="checkbox" name="fruits" value="Oranges"
<%if instr(fruits,"Oranges") then Response.Write("checked")%>>
Orange
<br>
<input type="checkbox" name="fruits" value="Bananas"
<%if instr(fruits,"Banana") then Response.Write("checked")%>>
Banana
<br>
<input type="submit" value="Submit">
</form>
<%
if fruits<>"" then%>
   <p>You like: <%Response.Write(fruits)%></p>
<%end if
%>

</body>
</html>
