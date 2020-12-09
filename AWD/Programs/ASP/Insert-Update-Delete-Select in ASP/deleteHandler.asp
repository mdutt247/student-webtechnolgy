<% @ language=VBScript %>
 
<%
set con = Server.CreateObject("ADODB.Connection")
con.Provider = "Microsoft.ACE.OLEDB.12.0"
con.Open "D:\myDB.accdb"

query = "Delete from stuTable where ID = " & request.form("txtId")
on error resume next
con.Execute query
if err then
	response.write err.Description
end if

con.close
response.redirect "show.asp"
%>
 