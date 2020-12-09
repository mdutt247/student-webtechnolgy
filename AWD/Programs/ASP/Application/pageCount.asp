<%@ Language=VBScript %>

<HTML>
<HEAD>
<title>Page Counter</title>
</HEAD>
<BODY>

<% 
Response.AddHeader "Refresh","1" 
dim pageCount
Application.Lock
Application("page") = Application("page")+1
pageCount=application("page")
Application.Unlock
%>
This page has been visited <%=pageCount%> times.

</BODY>
</HTML>
