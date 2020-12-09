<%
Dim n, d, sum
sum = 0
d = 0
n = Request.QueryString("n")  //Taking value from querystring
If IsNumeric(n) Then
    For i = 1 To Len(n)
        d = CInt(Mid(n,i,1))
        Response.Write("<br />" & d)
        sum = sum + d
    Next
    Response.Write("<br />Sum of digits of " & n & " is : " & sum)
End If
%>