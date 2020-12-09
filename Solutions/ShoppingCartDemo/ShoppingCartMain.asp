<HTML>
<HEAD>
<TITLE>Shopping cart demo</TITLE>
<STYLE>
    TD { font-size: large; font-weight: bold; }
    TD.hold { border: solid black 2px; }
    IFRAME { border-style: none; }
    INPUT { width: 150px; }
</STYLE>
<SCRIPT Language=JavaScript>
function showCategory( btn )
{
    var cnum = btn.name;
    var cname = btn.value;
    document.getElementById("CHOOSE").src = "showCategory.asp?cnum=" + cnum + "&cname=" + escape(cname);
}
</SCRIPT>
</HEAD>
<BODY>
<CENTER>
<TABLE Border=0 CellSpacing=15 width="100%">
<TR>
    <TD colspan=3 align=center>
         Shopping cart demo
    </TD>
</TR>
<TR height="650">
    <TD width="15%" align=center valign=top>
    Choose Any<br/>Category
    
    <FORM>
<%
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;" _
        & "Data Source=" & Server.MapPath("ShoppingCartDemo.mdb") & ";" 
Set RS = conn.Execute("SELECT CategoryID, CategoryName FROM Categories ORDER BY CategoryName")
Do Until RS.EOF
    cnum  = RS("CategoryID")
    cname = RS("CategoryName")
%>
    <INPUT Type=Button Name="<%=cnum%>" Value="<%=cname%>" onClick="showCategory(this);"><BR/>
<%
    RS.MoveNext
Loop
RS.Close
%>
    </FORM>
    
    <TD class="hold" width="35%">
        <IFRAME height="100%" width="100%" ID="CHOOSE"></IFRAME>
    </TD>
    <TD class="hold" width="50%">
        <IFRAME height="100%" width="100%" ID="CART" SRC="showCart.asp?do=show"></IFRAME>
    </TD>
</TR>
</TABLE>
</CENTER>
</BODY>
</HTML>
