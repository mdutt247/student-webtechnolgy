<%
'READ FIRST: 	
' u will get error on createobject line if u r using IIS>6. to solve this download adrot.dll from www.dlldll.com
' next open cmd prompt as administrator
' in cmd prompt type "c:\windows\system32\regsvr32 path\of\downloaded\dll\adrot.dll" without double quotes
' give read & execute permission to anonymous user on path\of\downloaded\dll folder
' run the code .. it works

' Refresh the file to change the banner
%>

<% 
url=Request.QueryString("url") 
If url<>"" then Response.Redirect(url) 
%>  
 
<html> 
<body> 
<% 
set adrotator=Server.CreateObject("MSWC.AdRotator") 
' Border of image 
adrotator.Border="0" 
'Image is a hiperlink or not 
adrotator.Clickable=true 
' Specify target 
adrotator.TargetFrame="target=_new" 
' The link in included 
response.write(adrotator.GetAdvertisement("/MylistOfAds.txt")) 
%> 
</body> 
</html>