<center>

<b><h2>Welcome</h2></b>

<%

set con = Server.CreateObject("ADODB.Connection")
con.Provider="Microsoft.Jet.OLEDB.4.0"
con.Open "D:\ASPRoot\Student.mdb"
set rec = Server.CreateObject("ADODB.Recordset")
rec.Open "Select * from Student_Details order by ID", con

do until rec.EOF
response.write(rec.Fields.Item("ID") & " | " & rec.Fields.Item("S_Name") & " | " & rec.Fields.Item("S_Phone") & " | "  & rec.Fields.Item("S_Address") & "<br>")
rec.MoveNext()
loop

rec.close
con.close
%>

</center>