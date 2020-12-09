'-----------------------------------------------------------�------ 
Function SpellNumber(ByVal MyNumber, _
                        Optional incRupees As Boolean = True)
'-----------------------------------------------------------�------ 
Dim Crores, Lakhs, Rupees, Paise, Temp
Dim DecimalPlace As Long, Count As Long
Dim myLakhs, myCrores


    ReDim Place(9) As String
    Place(2) = " Thousand ": Place(3) = " Million "
    Place(4) = " Billion ":  Place(5) = " Trillion "


    ' String representation of amount.
    MyNumber = Trim(Str(MyNumber))


    ' Position of decimal place 0 if none.
    DecimalPlace = InStr(MyNumber, ".")


    ' Convert Paise and set MyNumber to Rupees amount.
    If DecimalPlace > 0 Then
        Paise = GetTens(Left(Mid(MyNumber, DecimalPlace + 1) & "00", 2))
        MyNumber = Trim(Left(MyNumber, DecimalPlace - 1))
    End If
    myCrores = MyNumber \ 10000000
    myLakhs = (MyNumber - myCrores * 10000000) \ 100000
    MyNumber = MyNumber - myCrores * 10000000 - myLakhs * 100000


    Count = 1
    Do While myCrores <> ""
        Temp = GetHundreds(Right(myCrores, 3))
        If Temp <> "" Then Crores = Temp & Place(Count) & Crores
        If Len(myCrores) > 3 Then
            myCrores = Left(myCrores, Len(myCrores) - 3)
        Else
            myCrores = ""
        End If
        Count = Count + 1
    Loop


    Count = 1
    Do While myLakhs <> ""
        Temp = GetHundreds(Right(myLakhs, 3))
        If Temp <> "" Then Lakhs = Temp & Place(Count) & Lakhs
        If Len(myLakhs) > 3 Then
            myLakhs = Left(myLakhs, Len(myLakhs) - 3)
        Else
            myLakhs = ""
        End If
        Count = Count + 1
    Loop


    Count = 1
    Do While MyNumber <> ""
        Temp = GetHundreds(Right(MyNumber, 3))
        If Temp <> "" Then Rupees = Temp & Place(Count) & Rupees
        If Len(MyNumber) > 3 Then
            MyNumber = Left(MyNumber, Len(MyNumber) - 3)
        Else
            MyNumber = ""
        End If
        Count = Count + 1
    Loop


    Select Case Crores
        Case "": Crores = ""
        Case "One": Crores = " One Crore "
        Case Else: Crores = Crores & " Crores "
    End Select


    Select Case Lakhs
        Case "": Lakhs = ""
        Case "One": Lakhs = " One Lakh "
        Case Else: Lakhs = Lakhs & " Lakhs "
    End Select


    Select Case Rupees
        Case "": Rupees = "Zero "
        Case "One": Rupees = "One "
        Case Else: Rupees = Rupees
    End Select


    Select Case Paise
        Case "": Paise = " and Paise Zero Only "
        Case "One": Paise = " and Paise One Only "
        Case Else: Paise = " and Paise " & Paise & " Only "
    End Select


    SpellNumber = IIf(incRupees, "Rupees ", "") & Crores & Lakhs & Rupees &
Paise


End Function


'-----------------------------------------------------------�------ 
' Converts a number from 100-999 into text
Function GetHundreds(ByVal MyNumber)
'-----------------------------------------------------------�------ 
Dim Result As String
    If Val(MyNumber) = 0 Then Exit Function
    MyNumber = Right("000" & MyNumber, 3)
    ' Convert the hundreds place.
    If Mid(MyNumber, 1, 1) <> "0" Then
        Result = GetDigit(Mid(MyNumber, 1, 1)) & " Hundred "
    End If
    ' Convert the tens and ones place.
    If Mid(MyNumber, 2, 1) <> "0" Then
        Result = Result & GetTens(Mid(MyNumber, 2))
    Else
        Result = Result & GetDigit(Mid(MyNumber, 3))
    End If
    GetHundreds = Result
End Function


'-----------------------------------------------------------�------ 
' Converts a number from 10 to 99 into text.
Function GetTens(TensText)
'-----------------------------------------------------------�------ 
Dim Result As String
    Result = "" ' Null out the temporary function value.
    If Val(Left(TensText, 1)) = 1 Then ' If value between 10-19...
        Select Case Val(TensText)
            Case 10: Result = "Ten"
            Case 11: Result = "Eleven"
            Case 12: Result = "Twelve"
            Case 13: Result = "Thirteen"
            Case 14: Result = "Fourteen"
            Case 15: Result = "Fifteen"
            Case 16: Result = "Sixteen"
            Case 17: Result = "Seventeen"
            Case 18: Result = "Eighteen"
            Case 19: Result = "Nineteen"
            Case Else
        End Select
    Else ' If value between 20-99...
        Select Case Val(Left(TensText, 1))
            Case 2: Result = "Twenty "
            Case 3: Result = "Thirty "
            Case 4: Result = "Forty "
            Case 5: Result = "Fifty "
            Case 6: Result = "Sixty "
            Case 7: Result = "Seventy "
            Case 8: Result = "Eighty "
            Case 9: Result = "Ninety "
            Case Else
        End Select
        Result = Result & GetDigit _
            (Right(TensText, 1)) ' Retrieve ones place.
    End If
    GetTens = Result
End Function


'-----------------------------------------------------------�------ 
' Converts a number from 1 to 9 into text.
Function GetDigit(Digit)
'-----------------------------------------------------------�------ 
    Select Case Val(Digit)
        Case 1: GetDigit = "One"
        Case 2: GetDigit = "Two"
        Case 3: GetDigit = "Three"
        Case 4: GetDigit = "Four"
        Case 5: GetDigit = "Five"
        Case 6: GetDigit = "Six"
        Case 7: GetDigit = "Seven"
        Case 8: GetDigit = "Eight"
        Case 9: GetDigit = "Nine"
        Case Else: GetDigit = ""
    End Select
End Function

