<%
'program to write data to file
dim fs,tfile
set fs=Server.CreateObject("Scripting.FileSystemObject")
set tfile=fs.CreateTextFile("d:\file.txt")
tfile.WriteLine("Date: " & Date & " Time: " & Time)
tfile.close
set tfile=nothing
set fs=nothing

%>