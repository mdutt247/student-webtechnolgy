<html>
<%
Session("username")="Mrinaal Paliwal"
Session("age")=21
%>

Welcome <%Response.Write(Session("username")&" <br>Your Age is: "&Session("age"))%>
</html>