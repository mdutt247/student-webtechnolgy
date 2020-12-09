<DIV class="calendar" ID="CALENDAR" style="visibility: hidden;">
<DIV class="overlayDate" ID="overlayMonth"
     onclick="document.getElementById('selMonth').style.visibility='visible';this.style.display='none';"
></DIV>
<DIV class="overlayDate" ID="overlayYear"
     onclick="document.getElementById('selYear').style.visibility='visible';this.style.display='none';"
></DIV>
<TABLE Border=0 CellPadding=3 CellSpacing=0>
<TR>
    <TD colspan=7 Align=Center>
    <TABLE Width="100%" Border=0 CellPadding=0 CellSpacing=1>
    <TR>
        <TD width="20%" class="hdr" onClick="--theMonth;updateDisplay();">
        <IMG Src="prev_month.gif">
        </TD>
        <TD width="60%" class="hdr">
		<form>
		    <select id="selMonth" onchange="updateFromSel();">
                <option>Jan</option><option>Feb</option><option>Mar</option><option>Apr</option>
		<option>May</option><option>Jun</option><option>Jul</option><option>Aug</option>
		<option>Sep</option><option>Oct</option><option>Nov</option><option>Dec</option>
		</select>
		<br>
		   <select id="selYear" onchange="updateFromSel();">
		<option>2020</option><option>2019</option><option>2018</option><option>2017</option>
		<option>2016</option><option>2015</option><option>2014</option><option>2013</option>
		<option>2012</option><option>2011</option><option>2010</option><option>2009</option>
		<option>2008</option><option>2007</option><option>2006</option><option>2005</option>
		<option>2004</option><option>2003</option><option>2002</option><option>2001</option>
		<option>2000</option><option>1999</option><option>1998</option><option>1997</option>
		<option>1996</option><option>1995</option><option>1994</option><option>1993</option>
		</select>
	</TD>
        <TD width="20%" class="hdr" onClick="++theMonth;updateDisplay();">
        <IMG Src="next_month.gif">
        </TD>
    </TR>
    </TABLE>
    </TD>
</TR>
<TR>
    <TH id="D0">S</TH>
    <TH id="D1">M</TH>
    <TH id="D2">T</TH>
    <TH id="D3">W</TH>
    <TH id="D4">T</TH>
    <TH id="D5">F</TH>
    <TH id="D6">S</TH>
</TR>
<TR>
    <TD onClick="choose(this);" ID="C0"></TD>
    <TD onClick="choose(this);" ID="C1"></TD>
    <TD onClick="choose(this);" ID="C2"></TD>
    <TD onClick="choose(this);" ID="C3"></TD>
    <TD onClick="choose(this);" ID="C4"></TD>
    <TD onClick="choose(this);" ID="C5"></TD>
    <TD onClick="choose(this);" ID="C6"></TD>
</TR>
<TR>
    <TD onClick="choose(this);" ID="C7"></TD>
    <TD onClick="choose(this);" ID="C8"></TD>
    <TD onClick="choose(this);" ID="C9"></TD>
    <TD onClick="choose(this);" ID="C10"></TD>
    <TD onClick="choose(this);" ID="C11"></TD>
    <TD onClick="choose(this);" ID="C12"></TD>
    <TD onClick="choose(this);" ID="C13"></TD>
</TR>
<TR>
    <TD onClick="choose(this);" ID="C14"></TD>
    <TD onClick="choose(this);" ID="C15"></TD>
    <TD onClick="choose(this);" ID="C16"></TD>
    <TD onClick="choose(this);" ID="C17"></TD>
    <TD onClick="choose(this);" ID="C18"></TD>
    <TD onClick="choose(this);" ID="C19"></TD>
    <TD onClick="choose(this);" ID="C20"></TD>
</TR>
<TR>
    <TD onClick="choose(this);" ID="C21"></TD>
    <TD onClick="choose(this);" ID="C22"></TD>
    <TD onClick="choose(this);" ID="C23"></TD>
    <TD onClick="choose(this);" ID="C24"></TD>
    <TD onClick="choose(this);" ID="C25"></TD>
    <TD onClick="choose(this);" ID="C26"></TD>
    <TD onClick="choose(this);" ID="C27"></TD>
</TR>
<TR>
    <TD onClick="choose(this);" ID="C28"></TD>
    <TD onClick="choose(this);" ID="C29"></TD>
    <TD onClick="choose(this);" ID="C30"></TD>
    <TD onClick="choose(this);" ID="C31"></TD>
    <TD onClick="choose(this);" ID="C32"></TD>
    <TD onClick="choose(this);" ID="C33"></TD>
    <TD onClick="choose(this);" ID="C34"></TD>
</TR>
<TR ID="LastRow">
    <TD onClick="choose(this);" ID="C35"></TD>
    <TD onClick="choose(this);" ID="C36"></TD>
    <TD onClick="choose(this);" ID="C37"></TD>
    <TD onClick="choose(this);" ID="C38"></TD>
    <TD onClick="choose(this);" ID="C39"></TD>
    <TD onClick="choose(this);" ID="C40"></TD>
    <TD onClick="choose(this);" ID="C41"></TD>
</TR>
<TR>
    <TD colspan=7 onClick="document.getElementById('CALENDAR').style.visibility='hidden';">
    <HR>close window
    </TD>
</TR>
</TABLE>
</DIV>
