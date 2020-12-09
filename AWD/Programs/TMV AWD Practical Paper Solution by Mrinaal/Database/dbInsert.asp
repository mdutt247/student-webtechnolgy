<%@language="VBScript"%>
<p>
&emsp;<a href="dbinsert.asp">Insert</a>&emsp;
&emsp;<a href="dbshow.asp">Display</a>&emsp;
</p>
<hr>
<form action="" method="post">
<p>Name<input type="text" name="txtName"></p>
<p>DOB<input type="text" name="txtDOB"></p>
<p>Phone No<input type="text" name="txtPhone"></p>
<p>Percentage<input type="text" name="txtPer"></p>
<p><input type="submit" name="btnInsert" value="Insert"></p>

</form>
<%
if request.form("btnInsert") = "Insert" then
Dim con
Set con = Server.CreateObject("ADODB.Connection")
con.Provider = "Microsoft.ACE.OLEDB.12.0"
con.Open "C:\inetpub\wwwroot\host\Database\studb.accdb"

con.execute "Insert into stuTbl (stuName, stuPhone,stuDOB, stuPer) values('" & request.form("txtName") & "' ,'" & request.form("txtPhone") & "', '" & request.form("txtDOB") & "', " & request.form("txtPer") & ")"

set con = nothing

response.write "Data inserted"
end if
%>