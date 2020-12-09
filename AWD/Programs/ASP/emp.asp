<%
set con = Server.CreateObject("ADODB.Connection")
con.Provider = "Microsoft.Jet.OLEDB.4.0"
con.Open "D:\ASPRoot\Emp.mdb"
set rec = Server.CreateObject("ADODB.Recordset")
rec.Open "Select * from employee order by Emp_Name, Emp_Dept", con

do until rec.EOF
response.write(rec.Fields.Item("Emp_No")) &  " / " &(rec.Fields.Item("Emp_Name")) &  " / " &(rec.Fields.Item("Emp_Dept")) &  " / " &(rec.Fields.Item("Emp_Salary")&"<br>")
'response.write(rec.Fields.Item("ID") & " | " & rec.Fields.Item("Emp_Name") & " | " & "<br>")
rec.MoveNext()
loop

rec.close
con.close

%>