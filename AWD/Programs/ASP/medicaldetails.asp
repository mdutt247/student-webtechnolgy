
<form action="Medicaldetails.asp" method="post">
Starting price:<input type="text" name="SP"><br>
Ending price:<input type="text" name="EP"><br>
<input type="submit" name="submit" value="Display">
</form>

<%
dim pstart, pend
pstart=CInt(request.form("SP"))
pend=CInt(request.form("EP"))

set con=server.CreateObject("ADODB.Connection")
con.Provider="Microsoft.Jet.OLEDB.4.0"
con.open "D:\ASPRoot\medical.mdb"
set rec=server.CreateObject("ADODB.Recordset")
rec.open "select * from product where PPrice>="&pstart&" and PPrice<="&pend&"",con
%>
<table border=1>
<tr>
<td>PProduct No</td>
<td>PName</td>
<td>PPrice</td>
<td>PMfgdate</td>
<td>Expirydate</td>
</tr>
	<%
	do until rec.eof
	%>
<tr>
<td><%response.write(rec.Fields.item("PProductNo"))%></td>
<td><%response.write(rec.Fields.item("PName"))%></td>
<td><%response.write(rec.Fields.item("PPrice"))%></td>
<td><%response.write(rec.Fields.item("PMfgdate"))%></td>
<td><%response.write(rec.Fields.item("PExpirydate"))%></td>
</tr>
<%
rec.MoveNext()
loop
rec.close
con.close
%>