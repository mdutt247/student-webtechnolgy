<%@language="VBScript"%>

<%
dim dbName, dbPass
dbName = "Madhav"
dbPass = "Sadhav"
if(request.Form("loginButton")="Login") then
	if(dbName = request.Form("txtName") and dbPass = request.Form("txtPassword")) then
		Session("userName") = request.Form("txtName")
		response.redirect("welcome.asp")
	else
		response.redirect("error.html")
	end if
else
	response.redirect("login.html")
end if
%>