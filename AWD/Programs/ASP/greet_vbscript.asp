<%@ Language=VBScript %>
<HTML>
<HEAD>

</HEAD>
<BODY>
<%
dim h
h=hour(now())
Response.Write ("<P>" & now())
Response.Write ("(Indian Time)</p>")
if h<12 then
Response.Write("Good morning")
else
Response.Write("Good Day")
end if
%>
</BODY>
</HTML>
