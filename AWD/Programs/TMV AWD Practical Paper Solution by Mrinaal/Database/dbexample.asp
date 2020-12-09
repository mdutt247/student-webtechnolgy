<%@language="VBScript"%>

<%
Dim con, rec
Set con = Server.CreateObject("ADODB.Connection")
con.Provider = "Microsoft.ACE.OLEDB.12.0"
con.Open "C:\Users\nitis\Documents\MyDB\Database1.accdb"

Set rec = Server.CreateObject("ADODB.Recordset")
'"Select * from stuTbl where stuPer<40"
'"Select * from stuTbl where id between 2 and 4"
'dim txtBox1, txtBox2
'"Select * from stuTbl where id between " & txtBox1 & " and " & txtBox2
'"Select * from stuTbl where id>1 and id<=3"
'"Select * from stuTbl order by stuName desc"
rec.Open "Select * from stuTbl order by stuName asc" , con

while not rec.EOF
response.write rec.Fields.Item("ID").Value & " | " & rec.Fields.Item("stuName").Value & " | " & rec.Fields.Item("stuPhone").Value & " | " & rec.Fields.Item("stuPer").Value & "<br>"
rec.MoveNext
wend

set rec = Nothing
set con = Nothing
%>