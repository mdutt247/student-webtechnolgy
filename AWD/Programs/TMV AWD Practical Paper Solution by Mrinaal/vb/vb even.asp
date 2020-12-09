<%
dim x
x = request.querystring("n")
if x <> "" then
if x mod 2 = 0 then
response.write "Even"
else
response.write "odd"
end if
else
response.write "Give number as a query! i.e.--> Write: <b>?n=5</b>"
end if
%>