<HTML>
<HEAD>
<TITLE>Showing the Category and Subcategory Values Selected</TITLE>
</HEAD>

<BODY>
Hi, <%= Request.Form("UserName") %>!<br>
I see that your EMail address is "<%= Request.Form("UserEMail") %>" <br>
and that you prefer to receive notices via 
<UL>
<%
via = Array("EMail", "Newsletter", "SnailMail", "ESP")
For v = 0 To UBound(via)
	If Request.Form("Via" & via(v)) <> "" Then
		Response.Write "<LI>" & via(v) & vbNewLine
	End If
Next
%>
</UL>


On the prior page, you selected category <% = Request("CategorySelect") %>
<br>
and you selected subcategory <% = Request("SubCategorySelect") %>


</BODY>
</HTML>