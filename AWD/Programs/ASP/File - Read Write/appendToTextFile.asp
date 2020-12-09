<%
'FileSystemObject.OpenTextFile(fname,mode,create,format)

'==fname Required
'The name of the file to open
 
'==mode Optional 
'How to open the file
'1=ForReading - Open a file for reading. You cannot write to this file. 
'2=ForWriting - Open a file for writing. 
'8=ForAppending - Open a file and write to the end of the file.

'==create Optional
'Sets whether a new file can be created if the filename does not exist. 
'True indicates that a new file can be created, and False indicates that a new file will not be created. 
'False is default

'==format Optional
'The format of the file
'0=TristateFalse - Open the file as ASCII. This is default.
'-1=TristateTrue - Open the file as Unicode.
'-2=TristateUseDefault - Open the file using the system default.

'program to write data to file
dim fs,f
set fs=Server.CreateObject("Scripting.FileSystemObject")
set f=fs.OpenTextFile(Server.MapPath("testAppend.txt"),8,true)
f.WriteLine("This text will be added to the end of file")
f.Close
set f=Nothing
set fs=Nothing
%>