<center>
<form name="search" action="2dbread.asp" method="post">
<b>
Starting Price: <input type="text" name="start"><br>
Ending Price: <input type="text" name="end"><br>
<input type="submit" name="fetch" value="Display">
</b>
</form>
</center>
<%
dim pstart, pend
pstart=CInt(request.form("start"))
pend=CInt(request.form("end"))

set CON = server.createobject("ADODB.Connection")
CON.Provider = "Microsoft.Jet.OLEDB.4.0"
CON.open "E:\ASPRoot\product.mdb"
set REC = server.createobject("ADODB.Recordset")
REC.open "Select * from product where P_Price>"&pstart&"AND P_Price<"&pend&"", con
%>
<center>	
<table border=1>
<tr>
<td><b>Product No:</b></td>
<td><b>Product Name:</b></td>
<td><b>Product Price:</b></td>
<td><b>Product Mfg. Date:</b></td>
<td><b>Product Exp. Date:</b></td>
</tr>
<%
do until REC.EOF
%>
<tr>
<td><%response.write(REC.Fields.Item("P_No"))%></td>
<td><%response.write(REC.Fields.Item("P_Name"))%></td>
<td><%response.write(REC.Fields.Item("P_Price"))%></td>
<td><%response.write(REC.Fields.Item("P_Mfgdate"))%></td>
<td><%response.write(REC.Fields.Item("P_Expirydate"))%></td>
</tr>
<%
REC.MoveNext()
loop

REC.close
CON.close
%>
</table>
</center>