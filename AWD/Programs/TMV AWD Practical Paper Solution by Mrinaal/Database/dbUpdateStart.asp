<%@language="VBScript"%>
<p>
&emsp;<a href="dbinsert.asp">Insert</a>&emsp;
&emsp;<a href="dbshow.asp">Display </a>&emsp;
</p>
<hr>
<%

Dim con, rec
Set con = Server.CreateObject("ADODB.Connection")
con.Provider = "Microsoft.ACE.OLEDB.12.0"
con.Open "C:\inetpub\wwwroot\host\Database\studb.accdb"

Set rec = Server.CreateObject("ADODB.Recordset")

rec.Open "Select * from stuTbl where id = " & request.querystring("qid"), con
%>
<form action="" method="post">
<p>ID<input type="text" disabled name="txtID" value="<%=rec.Fields.Item("ID").Value%>"></p>
<p>Name<input type="text" name="txtName" value="<%=rec.Fields.Item("stuName").Value%>"></p>
<p>DOB<input type="text" name="txtDOB" value="<%=rec.Fields.Item("stuDOB").Value%>"></p>
<p>Phone No<input type="text" name="txtPhone" value="<%=rec.Fields.Item("stuPhone").Value%>"></p>
<p>Percentage<input type="text" name="txtPer" value="<%=rec.Fields.Item("stuPer").Value%>"></p>
<p><input type="submit" name="btnUpdate" value="Update"></p>

</form>
<%
if request.form("btnUpdate") = "Update" then

con.execute "Update stuTbl set stuName='" & request.form("txtName") & "' , stuDOB='" & request.form("txtDOB") & "', stuPhone='" & request.form("txtPhone") & "', stuPer=" & request.form("txtPer") & " where id = " & request.querystring("qid")

set rec = nothing
set con = nothing
response.redirect "dbShow.asp"
end if
%>