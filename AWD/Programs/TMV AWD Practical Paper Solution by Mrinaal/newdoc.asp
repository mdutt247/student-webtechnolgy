<%
response.write "<center>"
set x = Server.CreateObject("ADODB.Connection")
x.Provider = "Microsoft.ACE.OLEDB.12.0"
x.Open Server.Mappath("yash.accdb")

set y = Server.CreateObject("ADODB.Recordset")
y.open "Select * from friends",x

response.write "<table border='1'><tr><th>Names</th><th>DOB</th></tr>"

do until y.EOF
response.write "<tr><td>" &y.Fields.Item("Fname").value& "</td><td>" &y.Fields.Item("DOB").value&	"</td></tr>"
y.movenext
loop

response.write "</table></center>="

set x = nothing
set y = nothing
%>


