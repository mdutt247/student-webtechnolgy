<%@ Language=VBScript %>
<HTML>
<HEAD>
</HEAD>
<BODY>

<p>VBScripts' function <b>MonthName</b>is used to get a month:</p>
<%
response.Write(MonthName(1))
response.Write("<br>")
response.Write(MonthName(2))
%>
<p>Abbreviated name of a month:</p>
<%
response.Write(MonthName(1,true))
Response.Write("<br>")
response.Write(MonthName(2,true))
%>
<p>Current month:</p>
<%response.Write(MonthName(month(date)))
response.Write("<br>")
response.Write(MonthName(month(date),true))
%>

</BODY>
</HTML>
