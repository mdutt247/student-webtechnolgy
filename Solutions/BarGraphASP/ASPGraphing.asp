<HTML>
<HEAD>
<TITLE>Bar Graphing in ASP Made Easy</TITLE>
</HEAD>

<BODY>

<%
'
' Constants used for scaling flags:
'
CONST SCALE_AUTO = -1
CONST SCALE_SAME = 1
CONST SCALE_EACH = 0
'
' Constants that control the graph's appearance
'
CONST BAR_HEIGHT = 10  ' but if values displayed, may be larger
CONST BAR_WIDTH  = 400 ' max width, of course
'
' Default set of color values
'
BAR_COLORS  = Array( "red", "blue", "green", "black", "pink", "orange", "lightgreen", "yellow" )


' Constant strings grouped here for convenience.
' Change at will, but change with caution!
'
TAB        = "    "
TAB2       = TAB & TAB
OUTER_HEAD = "<TABLE Border=3 CellPadding=2 CellSpacing=0>" & vbNewLine
OUTER_TAIL = "</TABLE>" & vbNewLine
TITLE_PRE  = TAB & "<TD Width=100><FONT size=2>"
TITLE_POST = "</FONT></TD>" & vbNewLine
GROUP_PRE  = TAB & "<TD><TABLE Border=0 CellPadding=0 CellSpacing=0>" & vbNewLine
GROUP_POST = TAB & "</TABLE></TD>" & vbNewLine
CELL_PRE   = TAB2 & "<TR><TD>" & vbNewLine _
			 & TAB2 & TAB & "<TABLE CellSpacing=0>" & vbNewLine _
			 & TAB2 & TAB & "<TR><TD bgcolor="""
CELL_MID1  = """ width="
CELL_MID2  = " height=" & BAR_HEIGHT & "></TD>"
CELL_POST  = "</TR>" & vbNewLine _
			 & TAB2 & TAB & "</TABLE>" & vbNewLine _
			 & TAB2 & "</TD></TR>" & vbNewLine
VALUE_PRE  = "<TD><FONT size=1>"
VALUE_POST = "</FONT></TD>"

'
' Assumptions:
'   A record set is passed as the primary argument.
'

Sub GraphRSAll( RS, titleFld, dataFlds, maxWidth, maxRows, colors, scaleFlag, showValue )
	'
	' First of all, were we given a record set or an array?
	Dim data
	If Not isArray( RS ) Then
		data = RS.getRows
	Else
		data = RS
	End If

	' data is now array form, in any case...
	' 
	' set some values used repeatedly
	Dim dataFldCnt
	dataFldCnt = UBound( dataFlds )
	'
	Dim rowcnt, colcnt
	rowcnt = -1
	colcnt = -1
	On Error Resume Next ' be sure no errors trying to get the bounds
	colCnt = UBound( Data, 1 )
	rowCnt = UBound( Data, 2 ) 
	On Error GoTo 0
	If rowcnt < 0 OR colcnt < dataFldCnt OR dataFldCnt > UBound(colors) Then
		Response.Write "<P><B>Wrong number of rows or columns in given data!<B>"
		Response.End
	End If
	' 
	' limit displayed rows to user requested max
	If rowCnt > maxRows Then rowCnt = maxRows 
	'
	' Find maximal values for each column *and* overall max
	'
	Dim colMaxes( ), allMax
	ReDim colMaxes( dataFldCnt )
	allMax = 0
	' Simply loop through each data column...
	For df = 0 To dataFldCnt
		Dim dmax
		dmax = 0
		' get column number from array of column numbers
		col = dataFlds(df)
		' and then loop through each row for that column...
		For row = 0 To rowCnt
			' recording the maximal value
			dcr = data( col, row )
			If dcr < 0 Then
				Response.Write "<P>Sorry!  We can't graph negative numbers yet.<p>"
				Response.End
			End If
			If dcr > dmax Then dmax = dcr
		Next
		' and record this max for this column
		colMaxes( df ) = dmax
		' and alter overall max if needed
		If dmax > allMax Then allMax = dmax
	Next
	'
	' For auto-scale, we have to get smarter
	'
	If scaleFlag = SCALE_AUTO Then
		' arbitrarily, we decide that if any single column max
		' is less than 20% of the overall max, then we will use
		' individual scales for each field:
		scaleFlag = SCALE_SAME ' assume this works
		For df = 0 To dataFldCnt
			If colMaxes(df) < ( allMax / 5 ) Then scaleFlag = SCALE_EACH
		Next
	End If
	' Now if user asked for all data to be graphed on
	' the same scale (or auto scale decided that was desirable), 
	' then change all column maxes to be the same as overall max
	If scaleFlag = SCALE_SAME Then
		For df = 0 To dataFldCnt : colMaxes(df) = allMax : Next
	End If

	'
	' **** Ready to do the plotting ****
	'
	Response.Write OUTER_HEAD
	' One row at a time...
	For row = 0 To rowCnt
		Response.Write "<TR>" & vbNewLine
		If titleFld >= 0 Then
			Response.Write TITLE_PRE & Data(titleFld,row) & TITLE_POST
		End If
		Response.Write GROUP_PRE
		For df = 0 To dataFldCnt
			dmax = CDbl( colMaxes( df ) )
			col = dataFlds(df)
			colVal = CDbl( Data(col,row) )
			width = Int( ( colVal / dmax ) * maxWidth )
			Response.Write CELL_PRE & colors(df) & CELL_MID1 & width & CELL_MID2
			If showValue = True Then Response.Write VALUE_PRE & colval & VALUE_POST
			Response.Write CELL_POST 
		Next
		Response.Write GROUP_POST
		Response.Write "</TR>"
	Next
	Response.Write OUTER_TAIL
End Sub

'
' For the simplest possible coding, you can simply 
' call GraphRS with a RecordSet object as the only
' argument and it will choose defaults for you that
' should work for many types of records.
'
Sub GraphRS( RS )
	' Convert the record set to an array to make some 
	' of the traversals and counts faster and easier:
	Dim data
	data = RS.GetRows
	
	Dim rowcount, colcount
	rowcount = UBound( data, 2 )
	colcount = UBound( data, 1 )
'Response.Write "rc=" & rowcount & ", cc=" & colcount & "<P>" & vbNewLine
	' Now try to locate the numeric and non-numeric fields
	Dim numFlds( ) ' to hold column numbers of numeric flds
	ReDim numFlds( colcount ) ' max possible numeric fields
	numFCnt = -1 ' how many numeric fields?
	'
	' We search the fields of the first record looking for
	' the first non-numeric field *and* all numeric fields
	'
	titleFldNum = -1 ' assume no title field
	For fldNum = 0 To colcount
		num = 9123812.1123 ' silly big value
		On Error Resume Next ' protect against error from CDbl
		num = CDbl( data( fldNum, 0 ) ) ' see if this fld is numeric
'Response.Write "fldNum data=" & num & "<br>"
		On Error GoTo 0
		If ( num = 9123812.1123 ) Then
			' num unaltered, so assume field is non-numeric
			' ...and accept first non-numeric field as the title
			If titleFldNum < 0 Then titleFldNum = fldNum
		Else
			' num was altered via CDbl, so field is numeric
			numFCnt = numFCnt + 1 ' count this field
			numFlds( numFCnt ) = fldNum ' and save its number
		End If
	Next
	ReDim Preserve numFlds( numFCnt ) ' dimension must be exact
	'
	' And then call for the actual graph...
	' 
	' titleFldNum -- Do show title, if a string field found.
	' numFlds     -- show all numeric fields
	' BAR_WIDTH   -- Use default for bar width
	' rowcount    -- Show all rows.
	' BAR_COLORS  -- Use defaults colors of bars.
	' SCALE_AUTO  -- Since we don't know any better, let it auto scale.
	' True        -- Do show values with the bars.
	'
	GraphRSAll data, titleFldNum, numFlds, BAR_WIDTH, rowcount, BAR_COLORS, SCALE_AUTO, True 
End Sub		

' *************************************************************************
' *************************************************************************
'
' End of the graphing subroutines
'
' *************************************************************************
' *************************************************************************
%>

<CENTER><H3>Demo of Bar Graphs via ASP</H3></CENTER>
<%
	' create a connection to a database...
	' 
	' in this simple demo, we use a "text file"
	' database in ".csv" form, so that no "real"
	' database needs to be created and transferred:
	'
	curdir = Server.MapPath(".")
										
	cmd = "FileDSN=" & Server.MapPath("CSVFile.dsn")
	cmd = cmd & ";DefaultDir=" & curdir
	cmd = cmd & ";DBQ=" & curdir & ";"

	Set conn = Server.CreateObject("ADODB.Connection")
	conn.Open cmd
%>
<HR Size=6>
<CENTER>A completely automatic graph of the data</CENTER>
<%
	'
	' First, do a complete "auto graph"
	Set myRS = conn.Execute("SELECT * FROM VendorSales.csv")
	GraphRS myRS
%>
<HR Size=6>
<CENTER>Shows vendor name, 1998 sales, 1999 sales<br>
        We used a custom "SELECT" command but still automatic graphing</CENTER>
<%
	' Another auto graph, but this time with controlled columns:
	Set myRS2 = conn.Execute("SELECT Vendor,Sales1998,Sales1999 FROM VendorSales.csv")
	GraphRS myRS2
%>
<HR Size=6>
<CENTER>Shows name and 1997, 1998, 1999 sales<br>
        But this time using a bar width of 500, no value labels,<br>
		and with a separate "scale" for each year.</CENTER>
<%
	' Graph from original data, but controlling info 
	' explicitly in the call to GraphRSAll
	dataFields = Array( 2, 3, 4 )
	titleField = 1
	barSize = 500
	'
	' note the SQL is same as first example:
	Set myRS = conn.Execute("SELECT * FROM VendorSales.csv")
	'
	' 999 for number of rows really means show all rows
	' "False" means do not show values on the bars
	GraphRSAll myRS, titleField, dataFields, barSize, 999, BAR_COLORS, SCALE_EACH, False 
%>
(Effectively, this means it shows each vendor's sales for a given year as a
percentage of the top producer for that year.)<br>

</BODY></HTML>
