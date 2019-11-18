if WScript.Arguments.Count < 3 Then
    WScript.Echo "Error! Please specify the source path and the destination. Usage: XlsToCsv SourcePath.xls Destination.csv"
    Wscript.Quit
End If
Dim oExcel
Set oExcel = CreateObject("Excel.Application")
Dim oBook
Set oBook = oExcel.Workbooks.Open(Wscript.Arguments.Item(0))
oBook.Sheets(WScript.Arguments.Item(2)).Select
oBook.SaveAs WScript.Arguments.Item(1), 6
oBook.Close False
oExcel.Quit