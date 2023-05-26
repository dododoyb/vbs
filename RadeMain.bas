Attribute VB_Name = "RadeMain"
Dim lines As collection
Dim lines2 As collection
Dim linePoint As collection
Dim linePoint2 As collection
Dim names As collection
Sub readMain()
    Set linePoint = New collection
    Set linePoint2 = New collection
    Set names = New collection
    Set lines2 = New collection
    Dim reader As New TextFileReader
    Dim line As String
    Call reader.OpenFile("C:\Users\jindo\Desktop\test\test.txt")
    Set lines = reader.GetLines
    
    For i = 1 To lines.Count
        line = Trim(lines.Item(i))
        
        ' æ“ª6Œ…‚ðí‚é
        If Len(line) > 6 Then
            line = Right(line, Len(line) - 6)
            Call lines2.Add(line)
        Else
            Call lines2.Add(line)
        End If
        
        
        If InStr(line, "PROCEDURE") > 0 And InStr(line, "DIVISION.") > 0 Then
            Call linePoint.Add(i)
            Call names.Add("HEAD")
        End If
        
        If InStr(line, "SECTION.") > 0 Then
            Call linePoint.Add(i)
            Call names.Add(Trim(Split(line, "SECTION.")(0)))
        End If
    Next i
    
    For i = 1 To linePoint.Count
        row = resetLinePoint(linePoint.Item(i))
        Call linePoint2.Add(row)
    Next i
    
    Dim book As New ExcelBook
    Call book.newBook
    For i = 1 To linePoint2.Count
        If i = 1 Then
            Call book.pasteCollectionValues(lines2, 1, linePoint2.Item(i), names.Item(i))
        ElseIf i = linePoint2.Count Then
            Call book.pasteCollectionValues(lines2, linePoint2.Item(i), lines2.Count, names.Item(i))
        Else
            Call book.pasteCollectionValues(lines2, linePoint2.Item(i), (linePoint2.Item(i + 1) - 1), names.Item(i))
        End If
    Next i
    Call book.closeBook(ThisWorkbook.path & "\fff.xlsx")

    Set reader = Nothing
    Set lines = Nothing
    Set linePoint = Nothing
    MsgBox "end"
    
End Sub

Function resetLinePoint(ByVal rowNum As Integer) As Integer
    rowNum = rowNum - 1
    While Left(lines2.Item(rowNum), 1) = "*"
        rowNum = rowNum - 1
    Wend
    rowNum = rowNum + 1
    resetLinePoint = rowNum
End Function


