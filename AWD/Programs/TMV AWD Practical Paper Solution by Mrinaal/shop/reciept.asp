<%
dim p,q
p = request.querystring("product")
q = request.querystring("quantity")
response.write("You have selected : <b>"&q&" "&p&" shoe/s.</b>")
response.write("<br><br><a href='shopping.asp?message=Thank you for shopping'><<--Go Back</a>")
%>