<!-- #include file="ShoppingCartClass.asp" -->
<HTML>
<body>
<center>
<h2>Items in your Shopping Cart</h2>
<%
' first of all, create an instance of the shopping cart:
SET CART = New ShoppingCart

' then get all the possible request parameters:
action = LCase( Trim( Request("do") ) )
sku    = Trim( Request("sku") )
pname  = Trim( Request("pname") )
price  = Trim( Request("price") )
qty    = Trim( Request("qty") )

If FALSE Then Response.Write "DEBUG: action=" & action & ", sku=" & sku & ", pname=" & pname _
               & ", price=" & price & ", qty=" & qty & "<HR>" & vbNewLine

Select Case action
    Case "show"
        ' do nothing...just display current cart

    Case "add"
        CART.addItem sku, pname, price, qty

    Case "delete"
        CART.removeItem sku
        
    Case "change"
        CART.changeQuantity sku, qty
        
    Case Else
        Response.Write "Not supported yet<HR>"

End Select

If CART.itemCount < 1 Then
    Response.Write "<h2 style=""color: red;"">No items in cart</h2>"
    Response.End
End If
%>
<TABLE border=1 cellpadding=2>
<TR>
    <th>Remove<br />from<br />Cart</th>
    <TH>SKU</TH>
    <TH>Product</TH>
    <TH>Price</TH>
    <TH>Quantity</TH>
    <TH>Cost</TH>
</TR>
<%
Total = 0
qsel = "<SELECT Name=qty onChange=""this.form.DO.value='change';this.form.submit();"">" _
      & vbNewLine & "<OPTION>0<OPTION>1<OPTION>2<OPTION>3<OPTION>4<OPTION>5" _
      & "<OPTION>6<OPTION>7<OPTION>8<OPTION>9" _ 
      & "<OPTION>10<OPTION>11<OPTION>12<OPTION>13<OPTION>14<OPTION>15" _
      & "<OPTION>16<OPTION>17<OPTION>18<OPTION>19<OPTION>20</SELECT>" & vbNewLine
For itemNum = 1 To CART.itemCount
    sku   = CART.productID( itemNum )
    price = CART.productPrice( itemNum )
    qty   = CART.productQuantity( itemNum )
    cost  = price * qty 
    Total = Total + cost
    If qty > 20 Then 
        showQty = Replace(qsel,"</SEL","<OPTION SELECTED>" & qty & "</SEL")
    Else
        showQty = Replace(qsel,"<OPTION>" & qty & "<", "<OPTION SELECTED>" & qty & "<")
    End If
%>
<FORM>
<input type=hidden name="DO" value="delete" />
<input type=hidden name="sku" value="<%=sku%>" />
<TR>
    <td><input type=submit value="Remove" /></td>
    <TD><%=sku%></TD>
    <TD><%=CART.productName( itemNum )%></TD>
    <TD><%=FormatCurrency(price)%></TD>
    <TD><%=showQty%></TD>
    <TD><%=FormatCurrency(cost)%></TD>
</TR>
</FORM>
<%
Next
%>
<TR height=30 valign=bottom>
    <TD align=right colspan=5><B>Total Order: </B></TD>
    <TD><B><%=FormatCurrency(Total)%></B></TD>
</TR>
</TABLE>
<p> </p>
<hr />
Not implemented yet:  Saving the cart contents to a database.
</center>
</body>
</HTML>

