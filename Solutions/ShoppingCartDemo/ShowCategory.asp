<HTML><body>
<center>
<h3>Category:<br /><%=Request("cname")%></h3>
<FORM>
<TABLE Border=1 CellPadding=3>
<TR>
    <TH>Buy?</TH>
    <TH>SKU</TH>
    <TH>Product</TH>
    <TH>Price<br/>Each</TH>
</TR>
<%
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;" _
        & "Data Source=" & Server.MapPath("ShoppingCartDemo.mdb") & ";" 
Set RS = conn.Execute("SELECT * FROM Products WHERE CategoryID=" & Request("cnum") _
                    & " ORDER BY ProductName")
Do Until RS.EOF
    sku    = RS("SKU")
    scname = RS("ProductName")
    price  = RS("Price")
%>
<TR>
    <TD>
        <INPUT Type=Button Name="<%=sku & "::" & scname & "::" & price%>" Value="Buy Now" onClick="addToCart(this);">
    </TD>
    <TD><%=sku%></TD>
    <TD><%=scname%></TD>
    <TD><%=FormatCurrency(price)%></TD>
</TR>
<%
    RS.MoveNext
Loop
RS.Close
%>
</TABLE>
</FORM>

<SCRIPT Language="JavaScript">
function addToCart( btn )
{
    var info  = btn.name.split( "::" );
    var sku   = info[0];
    var name  = info[1];
    var price = info[2];

    parent.document.getElementById("CART").src = 
        "showCart.asp?do=add&sku=" + sku + "&pname=" + escape(name) + "&price=" + price + "&qty=1";
}
</SCRIPT>
</center></body></HTML>
