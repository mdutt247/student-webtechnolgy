<%
set x = Server.CreateObject("Scripting.FileSystemObject")
set y = x.OpenTextFile(Server.Mappath("textfile.txt"),1)

do until y.AtEndOfStream
Response.Write(y.ReadLine)
Response.Write("<br>")
loop
set y = nothing
set x = nothing
%>	