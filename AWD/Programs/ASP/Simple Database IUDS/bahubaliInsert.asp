<form method="post" action="">

<p>Name:<input type="text" name="txtName"></p>
<p>DOB:<input type="text" name="txtDOB"></p>
<p>Fee:<input type="text" name="txtFee"></p>

<input type="submit" value="Insert" name="btnInsert">
</form>

<%
if request.form("btnInsert")="Insert" then

 dim name, dob, fee
 name = request.form("txtName")
 dob = request.form("txtDOB")
 fee = request.form("txtFee")
 
	set con = Server.CreateObject("ADODB.Connection")
	con.Provider = "Microsoft.ACE.OLEDB.12.0"
	con.Open "d:\bahubalidb.accdb"
	
	sql = "Insert into studentTable(sname, sdob, sfee) values('" & name & "', '" & dob & "'," & fee & ")"
	
	con.Execute sql
	
	response.write "Data inserted"
	set con = nothing 
end if
	%>
