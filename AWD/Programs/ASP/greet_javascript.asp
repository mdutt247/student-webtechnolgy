<%@ Language=JavaScript %>
<HTML>
<HEAD>

</HEAD>
<BODY>
<%
var d=new Date()
var h=d.getHours()
Response.Write("<p>")
Response.Write(d+"(Indian Time)")
Response.Write("</p>")
if (h<12)
{
Response.write("Good morning")
}
else
{
Response.write("Good day")
}
%>
</BODY>
</HTML>
