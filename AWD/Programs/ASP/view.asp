<%

set con = Server.CreateObject("ADODB.Connection")
con.Provider="Microsoft.Jet.OLEDB.4.0"
con.Open "D:\ASPRoot\emp.mdb"

set rec = Server.CreateObject("ADODB.Recordset")
rec.Open "Select * from employee_detail order by name" , con

do until rec.EOF
response.write(rec.Fields.Item("id") & " | " & rec.Fields.Item("name") & " | " & rec.Fields.Item("dept") & " | "  & rec.Fields.Item("salary") & "<br>")
rec.MoveNext()
loop
%>