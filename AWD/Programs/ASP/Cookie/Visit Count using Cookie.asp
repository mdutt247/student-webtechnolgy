<%@ Language=VBScript %>


<%
dim numvisits
response.cookies("NumVisits").Expires=date+ 2 'expire date of cookie
numvisits=request.cookies("NumVisits") 'retrieving cookie data

if numvisits="" then
   response.cookies("NumVisits")=1 'create a cookie
   response.write("Welcome! This is the first time you are visiting this Web page.")
else
   response.cookies("NumVisits")=numvisits+1
   response.write "You have visited this Web page  " & numvisits
   if numvisits=1 then
     response.write " time before!"
   else
     response.write " times before!"
   end if
end if
%>
    

                                                                            