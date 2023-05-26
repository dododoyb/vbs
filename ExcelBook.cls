VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ExcelBook"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'*************************************************************************
'*    Dim book As New ExcelBook
'*    Call book.newBook(ThisWorkbook.path & "\aaaa.xlsx")
'*    Call book.closeBook
'*************************************************************************
Private excelApp As Object
Private book As Object

Sub newBook()
    Set excelApp = CreateObject("Excel.Application")
    Set book = excelApp.Workbooks.Add
    
End Sub

Sub pasteCollectionValues(ByVal lines2 As collection, startIdx As Integer, endIdx As Integer, sheetName As String)
    Set shit = book.Sheets.Add(After:=book.Sheets(book.Sheets.Count))
    shit.Name = sheetName
    
    Dim i As Integer
    Dim rowIndex As Integer
    rowIndex = 1
    For i = startIdx To endIdx
        shit.Cells(rowIndex, 1).Value = lines2(i)
        rowIndex = rowIndex + 1
    Next i
End Sub

Sub closeBook(ByVal filePath As String)
book.SaveAs filePath
    book.Close
    excelApp.Quit
    Set book = Nothing
    Set excelApp = Nothing
End Sub


