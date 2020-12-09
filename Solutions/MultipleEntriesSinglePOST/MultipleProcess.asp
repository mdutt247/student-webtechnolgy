<HTML>

<HEAD>
<TITLE>Show results of multiple posting</TITLE>
</HEAD>

<BODY>

<CENTER>

<TABLE Border=3 CellPadding=5>
<TR>
    <TH>Name</TH>
    <TH>Badge Number</TH>
    <TH>EMail</TH>
    <TH>Phone#</TH>
</TR>
<%
' DELIM matches delimiter used in JavaScript
' on previous page!
DELIM = "$" & Chr(8) & "$"
'
allNames  = Split(Request.Form("allNames"), DELIM)
allNums   = Split(Request.Form("allNums"), DELIM)
allEMails = Split(Request.Form("allEMails"), DELIM)
allPhones = Split(Request.Form("allPhones"), DELIM)

' We ignore the 0 element of each array, which
' should be simply "*"...see other page.
'
For which = 1 To UBound( allNames )
%>
<TR>
    <TD><% = allNames(which) %></TD>
    <TD><% = allNums(which) %></TD>
    <TD><% = allEMails(which) %></TD>
    <TD><% = allPhones(which) %></TD>
</TR>
<%
Next 
%>
</TABLE>


</CENTER>

</BODY>
</HTML>
