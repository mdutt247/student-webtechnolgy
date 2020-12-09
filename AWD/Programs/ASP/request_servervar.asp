<html>
<body>
<b><i>Example of Server Variables-</i></b><br>
<p>
<b>You are browsing this site with:</b>
<%Response.Write(Request.ServerVariables("http_user_agent"))%>
</p>
<p>
<b>Your IP address is:</b>
<%Response.Write(Request.ServerVariables("remote_addr"))%>
</p>
<p>
<b>The DNS lookup of the IP address is:</b>
<%Response.Write(Request.ServerVariables("remote_host"))%>
</p>
<p>
<b>The method used to call the page:</b>
<%Response.Write(Request.ServerVariables("request_method"))%>
</p>
<p>
<b>The server's domain name:</b>
<%Response.Write(Request.ServerVariables("server_name"))%>
</p>
<p>
<b>The server's port:</b>
<%Response.Write(Request.ServerVariables("server_port"))%>
</p>
<p>
<b>The server's software:</b>
<%Response.Write(Request.ServerVariables("server_software"))%>
</p>

<%
dim sServerinst
dim sPhyspath
dim sServerIP

sServerinst = Request.ServerVariables("INSTANCE_ID")
sPhyspath = LCase(Request.ServerVariables("APPL_PHYSICAL_PATH"))
sServerIP = LCase(Request.ServerVariables("LOCAL_ADDR"))      ' Server's IP address

Response.Write "<p> <b>The Server's Instance:</b> " 
Response.Write sServerinst 
Response.Write "</p>"

Response.Write "<p><b>Physical Path:</b>"
Response.Write sPhyspath
Response.Write "</p>"

Response.Write "<p><b>The Server's IP Address:</b>"
Response.Write sServerIP
Response.Write "</p>"


%>
<i><b>Following is example of cookie-</i></b><br>
<%
dim numvisits
response.cookies("NumVisits").Expires=date+365 
numvisits=request.cookies("NumVisits")

if numvisits="" then
   response.cookies("NumVisits")=1
   response.write("Welcome! This is the first time you are visiting this Web page.")
else
   response.cookies("NumVisits")=numvisits+1
   response.write("You have visited this ")
   response.write("Web page " & numvisits)
   if numvisits=1 then
     response.write " time before!"
   else
     response.write " times before!"
   end if
end if
%>

</body>
</html>