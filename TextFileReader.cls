VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "TextFileReader"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' TextFileReader.cls モジュール

Private stream As Object
Private linesCollection As collection

Public Sub OpenFile(ByVal path As String)
    Set stream = CreateObject("ADODB.Stream")
    stream.Type = 2 ' テキストモード
    stream.charset = "UTF-8" ' ファイルのエンコーディングに合わせて変更
    
    ' ファイルを開く
    stream.Open
    stream.LoadFromFile path
    
    ' ファイルの内容を読み込む
    Dim fileContent As String
    fileContent = stream.ReadText
    
    ' 各行をCollectionにまとめる
    Set linesCollection = New collection
    Dim linesArray() As String
    linesArray = Split(fileContent, vbCrLf)
    
    Dim i As Integer
    For i = LBound(linesArray) To UBound(linesArray)
        linesCollection.Add linesArray(i)
    Next i
    
    ' ストリームを閉じる
    stream.Close
    Set stream = Nothing
End Sub

Public Function GetLines() As collection
    Set GetLines = linesCollection
End Function

