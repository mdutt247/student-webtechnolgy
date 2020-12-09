<form action="p1q2.asp" method="post">
Num 1: <input type="text" name="t1"><br>
Num 2: <input type="text" name="t2"><br>
Num 3: <input type="text" name="t3" value=""><br><br>
<input type="submit" name="min" value="Min">&nbsp;&nbsp;
<input type="submit" name="max" value="Max">&nbsp;&nbsp;
<input type="submit" name="div" value="Div">
</form>

<%
dim t1, t2, t3

t1=request.form("t1")
t2=request.form("t2")

if request.form("min")="Min" then

	if t1<t2 then %> 
		<script type="text/javascript">
		document.getElementsByName('t3')[0].value=<%t1%>;
		</script>
	<% else %>
		<script type="text/javascript">
		document.getElementsByName('t3')[0].value=<%t2%>;
		</script><%
	end if
end if
%>