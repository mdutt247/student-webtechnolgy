<%@language="VBScript"%>
<p>
&emsp;<a href="dbinsert.asp">Insert</a>&emsp;
&emsp;<a href="dbshow.asp">Display</a>&emsp;
</p>
<hr>
<%

Dim con, rec
Set con = Server.CreateObject("ADODB.Connection")
con.Provider = "Microsoft.ACE.OLEDB.12.0"
con.Open "C:\inetpub\wwwroot\host\Database\studb.accdb"

Set rec = Server.CreateObject("ADODB.Recordset")

rec.Open "Select * from stuTbl order by id" , con

while not rec.EOF
response.write rec.Fields.Item("ID").Value & " | " & rec.Fields.Item("stuName").Value & " | " & rec.Fields.Item("stuPhone").Value & " | " & rec.Fields.Item("stuPer").Value & " | <a href='dbUpdateStart.asp?qid=" & rec.Fields.Item("ID").Value & "'>Update</a>" & " | <a href='dbDeleteStart.asp?qid=" & rec.Fields.Item("ID").Value & "'>Delete</a><br>"
rec.MoveNext
wend

set rec = Nothing
set con = Nothing
%>