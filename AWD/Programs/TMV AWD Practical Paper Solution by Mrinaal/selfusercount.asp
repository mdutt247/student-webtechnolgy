<%
dim c
response.cookies("user").expires=date+2
c=request.cookies("user")
if c="" then
response.cookies("user")=1
response.write("Welcome user")
else
response.cookies("user")=c+1
response.write("you entered "&c)
  if c=1 then
  response.write("time before")
  else
  response.write("times before")
  end if
end if
%>