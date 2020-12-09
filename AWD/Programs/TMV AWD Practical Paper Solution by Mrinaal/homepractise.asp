<%
set x = Server.CreateObject("ADODB.Connection")
x.Provider = "Microsoft.ACE.OLEDB.12.0"
x.Open Server.Mappath("Practise.accdb")

set y = Server.CreateObject("ADODB.Recordset")
y.open "Select * from Main",x

response.write "<table border='1' cellpadding='15' style='border-collapse:collapse'><tr><th>Names</th><th>Roll no</th><th>DOB</th></tr>"

do until y.EOF
response.write "<tr><td>" & y.Fields.Item("Names").value & "</td><td>" &y.Fields.Item("Roll").value & "</td><td>" &y.Fields.Item("DOB").value & "</td></tr>"
y.movenext
loop

response.write "</table>"

set  x = nothing
set y = nothing
%>