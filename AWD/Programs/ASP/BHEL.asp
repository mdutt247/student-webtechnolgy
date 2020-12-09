<html>
<body>
<%
ITEMS=Request.Form("ITEMS")
%>

<form action="BHEL.asp" method="post">

<p>Which of these items do you prefer:</p>
	<input type="checkbox" name="ITEMS" value="BHEL">BHEL
<br>
	<input type="checkbox" name="ITEMS" value="PANI PURI">PANI PURI
<br>
	<input type="checkbox" name="ITEMS" value="KACHORI">KACHORI
<br>
	<input type="checkbox" name="ITEMS" value="BATATA WADA">BATATA WADA
<br>

<input type="submit" value="Submit">
&nbsp;
<input type="reset" value="reset">
</form>
<%
if ITEMS<>"" then%>
   <p><input type="textarea" value="<%Response.Write(ITEMS)%>" size="60px"></p>
<%end if%>