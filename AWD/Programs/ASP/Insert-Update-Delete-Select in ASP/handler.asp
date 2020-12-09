<% @ language=VBScript %>
<%
set con = Server.CreateObject("ADODB.Connection")
con.Provider = "Microsoft.ACE.OLEDB.12.0"
con.Open "D:\myDB.accdb"

set rs = Server.CreateObject("ADODB.RecordSet")
query =  "Select * from stuTable where ID=" & Request.QueryString("id")
rs.Open query, con
%>

<% 
'to facilitate update operation
if Request.QueryString("cmd")="upd" then 
%>
<form method="post" action="updateHandler.asp">
<p>ID:<%=rs.Fields.Item("ID").Value%></p>
<p>Name:<input type="text" name="txtName" value="<%=rs.Fields.Item("Name").Value%>"></p>
<p>Phone:<input type="text" name="txtPhone" value="<%=rs.Fields.Item("Phone").Value%>"></p>
<p>Course:<input type="text" name="txtCourse" value="<%=rs.Fields.Item("Course").Value%>"></p>
<input type="hidden" name="txtId" value="<%=rs.Fields.Item("ID").Value%>">
<input type="submit" value="Update" name="btnUpdate">
</form>
<% end if %>

<% 
'to facilitate delete operation
if Request.QueryString("cmd")="del" then 
%>
<form method="post" action="deleteHandler.asp">
<p>ID:<%=rs.Fields.Item("ID").Value%></p>
<p>Name:<%=rs.Fields.Item("Name").Value%></p>
<p>Phone:<%=rs.Fields.Item("Phone").Value%></p>
<p>Course:<%=rs.Fields.Item("Course").Value%></p>
<input type="hidden" name="txtId" value="<%=rs.Fields.Item("ID").Value%>">
<input type="submit" value="Delete" name="btnDelete">
</form>
<% end if %>

<%
rs.close
con.close
%>