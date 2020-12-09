<%
dim con, rs

set con = Server.CreateObject("ADODB.Connection")
con.Provider = "Microsoft.ACE.OLEDB.12.0"
con.Open "d:\bahubalidb.accdb"

set rs = Server.CreateObject("ADODB.Recordset")
rs.Open "Select sname, sdob, sfee from studentTable", con

do until rs.EOF 			'do while not rs.EOF
response.write rs.Fields.Item("sname").value & " " & rs.Fields.Item("sdob").value  & " " &rs.Fields.Item("sfee").value & "<br>"
rs.MoveNext
loop

set con = nothing
set rs = nothing
%>