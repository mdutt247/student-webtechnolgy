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
<p>ID: <%=rec.Fields.Item("ID").Value%></p>
<p>Name: <%=rec.Fields.Item("stuName").Value%></p>
<p>DOB: <%=rec.Fields.Item("stuDOB").Value%></p>
<p>Phone No: <%=rec.Fields.Item("stuPhone").Value%></p>
<p>Percentage: <%=rec.Fields.Item("stuPer").Value%></p>
<p><input type="submit" name="btnDelete" value="Delete"></p>

</form>
<%
if request.form("btnDelete") = "Delete" then

con.execute "delete from stutbl where id = " & request.querystring("qid")

set rec = nothing
set con = nothing
response.redirect "dbShow.asp"
end if
%>