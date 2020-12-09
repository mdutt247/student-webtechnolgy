<% @ language=VBScript %>
<%
set con = Server.CreateObject("ADODB.Connection")
con.Provider = "Microsoft.ACE.OLEDB.12.0"
con.Open "D:\myDB.accdb"

query = "Update stuTable set name = '" & request.form("txtName") & "', phone = '" & request.form("txtPhone") & "', course = '" & request.form("txtCourse") & "' where id = " & request.form("txtId")
on error resume next
con.Execute query

if err then
	response.write err.Description
end if

con.close
response.redirect "show.asp"

%>