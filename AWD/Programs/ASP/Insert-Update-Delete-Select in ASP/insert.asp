<% @ language=VBScript %>

<form method="post" action="insert.asp">

<p>Name:<input type="text" name="txtName"></p>
<p>Phone:<input type="text" name="txtPhone"></p>
<p>Course:<input type="text" name="txtCourse"></p>

<input type="submit" value="Insert" name="btnInsert">
</form>
<%
if request.form("btnInsert")="Insert" then

	set con = Server.CreateObject("ADODB.Connection")
	con.Provider = "Microsoft.ACE.OLEDB.12.0"
	con.Open "D:\myDB.accdb"

	query = "Insert Into stuTable(Name, Phone, Course) values('" & request.form("txtName") & "', '" & request.form("txtPhone") & "', '" & request.form("txtCourse") & "')"
	on error resume next
	con.Execute query
	if err then
		response.write "Error!!<br \>"
		response.write err.Description
	else
		response.write "Record inserted successfully!! <a href = 'show.asp'>View</a>"
	end if

	con.close
end if
%>