Attribute VB_Name = "mdl_1"
Option Explicit


Sub Columns_Autofit()
Attribute Columns_Autofit.VB_ProcData.VB_Invoke_Func = "A\n14"

'Keyboard Shortcut "A"

With Selection
    .Columns.AutoFit
End With

End Sub

Sub Format_Center()
Attribute Format_Center.VB_ProcData.VB_Invoke_Func = "C\n14"

'Keyboard Shortcut "C"

With Selection
    .HorizontalAlignment = xlCenter
End With

End Sub

Sub Paste_Values()
Attribute Paste_Values.VB_ProcData.VB_Invoke_Func = "q\n14"

'Keyboard Shortcut "q"

With Selection
    .PasteSpecial Paste:=xlPasteValues
End With

End Sub

Sub Copy_Paste_Values()
Attribute Copy_Paste_Values.VB_ProcData.VB_Invoke_Func = "Q\n14"

'Keyboard Shortcut "Q"

With Selection
    .Copy
    .PasteSpecial Paste:=xlPasteValues
End With

End Sub

Sub Print_Preview()
Attribute Print_Preview.VB_ProcData.VB_Invoke_Func = "m\n14"

'Keyboard Shortcut "m"

With ActiveSheet
    .PrintPreview
End With

End Sub

Sub Page_Setup_Landscape_Input()

Dim lngRowLast As Long
Dim lngColLast As Long
Dim rngMemory As Range
Dim rngStart As Range
Dim rngHeader As Range
Dim rngPrint As Range
Dim lngRowHeaderStart As Long
Dim lngRowHeaderStop As Long
Dim strDept As String

strDept = "PSG Data Management && BI"

Set rngMemory = ActiveCell
Set rngStart = Application.InputBox(Prompt:="Select Top Left Corner of Print Range", Title:="Print Range Start", _
    Type:=8)
Set rngHeader = Application.InputBox(Prompt:="Select Range Rows of Row Header Section", Title:="Row Header Range", _
    Type:=8)
lngRowHeaderStart = rngHeader.Row

Select Case rngHeader.Rows.Count
    Case Is > 1
        lngRowHeaderStop = rngHeader.Rows.Count + lngRowHeaderStart - 1
    Case Else
        lngRowHeaderStop = 1
End Select

lngRowLast = Cells.Find(what:="*", After:=Cells(1, 1), searchorder:=xlByRows, searchdirection:=xlPrevious).Row
lngColLast = Cells.Find(what:="*", After:=Cells(1, 1), searchorder:=xlByColumns, searchdirection:=xlPrevious).Column
Set rngPrint = Cells(lngRowLast, lngColLast)

With ActiveSheet.PageSetup
        .PrintArea = rngStart.Address(False, False) & ":" & rngPrint.Address(False, False)
        .PrintTitleRows = "$" & lngRowHeaderStart & ":$" & lngRowHeaderStop & ""
        .LeftFooter = strDept
        .CenterFooter = ""
        .RightFooter = "Page &P of &N"
        .LeftMargin = Application.InchesToPoints(0.3)
        .RightMargin = Application.InchesToPoints(0.3)
        .TopMargin = Application.InchesToPoints(0.5)
        .BottomMargin = Application.InchesToPoints(0.75)
        .HeaderMargin = Application.InchesToPoints(0.3)
        .FooterMargin = Application.InchesToPoints(0.3)
        .CenterHorizontally = True
        .Orientation = xlLandscape
        .FirstPageNumber = xlAutomatic
        .Order = xlDownThenOver
        .Zoom = False
        .FitToPagesWide = 1
        .FitToPagesTall = 2000
End With



rngMemory.Select
MsgBox Prompt:="SUCCESS: Page Setup Landscape", Title:="Page Setup Landscape", Buttons:=vbInformation

End Sub

Sub Page_Setup_Portrait_Input()

Dim lngRowLast As Long
Dim lngColLast As Long
Dim rngMemory As Range
Dim rngStart As Range
Dim rngHeader As Range
Dim rngPrint As Range
Dim lngRowHeaderStart As Long
Dim lngRowHeaderStop As Long
Dim strDept As String

strDept = "PSG Data Management && BI"

Set rngMemory = ActiveCell
Set rngStart = Application.InputBox(Prompt:="Select Top Left Corner of Print Range", Title:="Print Range Start", _
    Type:=8)
Set rngHeader = Application.InputBox(Prompt:="Select Range Rows of Row Header Section", Title:="Row Header Range", _
    Type:=8)
lngRowHeaderStart = rngHeader.Row

Select Case rngHeader.Rows.Count
    Case Is > 1
        lngRowHeaderStop = rngHeader.Rows.Count + lngRowHeaderStart - 1
    Case Else
        lngRowHeaderStop = 1
End Select

lngRowLast = Cells.Find(what:="*", After:=Cells(1, 1), searchorder:=xlByRows, searchdirection:=xlPrevious).Row
lngColLast = Cells.Find(what:="*", After:=Cells(1, 1), searchorder:=xlByColumns, searchdirection:=xlPrevious).Column
Set rngPrint = Cells(lngRowLast, lngColLast)

With ActiveSheet.PageSetup
        .PrintArea = rngStart.Address(False, False) & ":" & rngPrint.Address(False, False)
        .PrintTitleRows = "$" & lngRowHeaderStart & ":$" & lngRowHeaderStop & ""
        .LeftFooter = strDept
        .CenterFooter = ""
        .RightFooter = "Page &P of &N"
        .LeftMargin = Application.InchesToPoints(0.3)
        .RightMargin = Application.InchesToPoints(0.3)
        .TopMargin = Application.InchesToPoints(0.5)
        .BottomMargin = Application.InchesToPoints(0.75)
        .HeaderMargin = Application.InchesToPoints(0.3)
        .FooterMargin = Application.InchesToPoints(0.3)
        .CenterHorizontally = True
        .Orientation = xlPortrait
        .FirstPageNumber = xlAutomatic
        .Order = xlDownThenOver
        .Zoom = False
        .FitToPagesWide = 1
        .FitToPagesTall = 2000
End With


rngMemory.Select
MsgBox Prompt:="SUCCESS: Page Setup Portrait", Title:="Page Setup Portrait", Buttons:=vbInformation

End Sub

Sub Page_Setup_Landscape_Fixed()

Dim lngRowLast As Long
Dim lngColLast As Long
Dim rngPrint As Range
Dim strDept As String

strDept = "PSG Data Management && BI"

lngRowLast = Cells.Find(what:="*", After:=Cells(1, 1), searchorder:=xlByRows, searchdirection:=xlPrevious).Row
lngColLast = Cells.Find(what:="*", After:=Cells(1, 1), searchorder:=xlByColumns, searchdirection:=xlPrevious).Column
Set rngPrint = Cells(lngRowLast, lngColLast)

With ActiveSheet.PageSetup
        .PrintArea = Cells(1, 1).Address(False, False) & ":" & rngPrint.Address(False, False)
        .PrintTitleRows = "$1:$1"
        .LeftFooter = strDept
        .CenterFooter = ""
        .RightFooter = "Page &P of &N"
        .LeftMargin = Application.InchesToPoints(0.3)
        .RightMargin = Application.InchesToPoints(0.3)
        .TopMargin = Application.InchesToPoints(0.5)
        .BottomMargin = Application.InchesToPoints(0.75)
        .HeaderMargin = Application.InchesToPoints(0.3)
        .FooterMargin = Application.InchesToPoints(0.3)
        .CenterHorizontally = True
        .Orientation = xlLandscape
        .FirstPageNumber = xlAutomatic
        .Order = xlDownThenOver
        .Zoom = False
        .FitToPagesWide = 1
        .FitToPagesTall = 200
End With

End Sub

Sub Page_Setup_Portriat_Fixed()

Dim lngRowLast As Long
Dim lngColLast As Long
Dim rngPrint As Range
Dim strDept As String

strDept = "PSG Data Management && BI"

lngRowLast = Cells.Find(what:="*", After:=Cells(1, 1), searchorder:=xlByRows, searchdirection:=xlPrevious).Row
lngColLast = Cells.Find(what:="*", After:=Cells(1, 1), searchorder:=xlByColumns, searchdirection:=xlPrevious).Column
Set rngPrint = Cells(lngRowLast, lngColLast)

With ActiveSheet.PageSetup
        .PrintArea = Cells(1, 1).Address(False, False) & ":" & rngPrint.Address(False, False)
        .PrintTitleRows = "$1:$1"
        .LeftFooter = strDept
        .CenterFooter = ""
        .RightFooter = "Page &P of &N"
        .LeftMargin = Application.InchesToPoints(0.3)
        .RightMargin = Application.InchesToPoints(0.3)
        .TopMargin = Application.InchesToPoints(0.5)
        .BottomMargin = Application.InchesToPoints(0.75)
        .HeaderMargin = Application.InchesToPoints(0.3)
        .FooterMargin = Application.InchesToPoints(0.3)
        .CenterHorizontally = True
        .Orientation = xlPortrait
        .FirstPageNumber = xlAutomatic
        .Order = xlDownThenOver
        .Zoom = False
        .FitToPagesWide = 1
        .FitToPagesTall = 200
End With

End Sub

Sub Reference_Style_R1C1()

Application.ReferenceStyle = xlR1C1

End Sub

Sub Reference_Style_A1()

Application.ReferenceStyle = xlA1

End Sub

Sub Format_Number_0_Decimal()
Attribute Format_Number_0_Decimal.VB_ProcData.VB_Invoke_Func = "D\n14"

'Keyboard Shortcut "D"

With Selection
    .NumberFormat = "_(* #,##0_);_(* (#,##0);_(* ""-""??_);_(@_)"
End With

End Sub

Sub Format_Number_2_Decimal()
Attribute Format_Number_2_Decimal.VB_ProcData.VB_Invoke_Func = "d\n14"

'Keyboard Shortcut "d"

With Selection
    .NumberFormat = "_(* #,##0.00_);_(* (#,##0.00);_(* ""-""??_);_(@_)"
End With

End Sub

Sub Paste_Formats()
Attribute Paste_Formats.VB_ProcData.VB_Invoke_Func = "t\n14"

'Keyboard Shortcut "t"

With Selection
    .PasteSpecial xlPasteFormats
End With

End Sub

Sub Unhide_Worksheets()

Dim ws As Worksheet

For Each ws In ActiveWorkbook.Worksheets
    ws.Visible = xlSheetVisible
Next

End Sub

Sub Format_Text()

With Selection
    .NumberFormat = "@"
End With

End Sub

Sub Format_Row_Header_Blue()

With Selection
    .Interior.Color = RGB(24, 60, 92)
    .Font.Color = RGB(255, 255, 255)
    .HorizontalAlignment = xlCenter
    .Borders(xlEdgeLeft).LineStyle = xlContinuous
    .Borders(xlEdgeLeft).ThemeColor = 1
    .Borders(xlEdgeLeft).Weight = xlThin
    .Borders(xlEdgeRight).LineStyle = xlContinuous
    .Borders(xlEdgeRight).ThemeColor = 1
    .Borders(xlEdgeRight).Weight = xlThin
    .Borders(xlEdgeTop).LineStyle = xlContinuous
    .Borders(xlEdgeTop).ThemeColor = 1
    .Borders(xlEdgeTop).Weight = xlThin
    .Borders(xlEdgeBottom).LineStyle = xlContinuous
    .Borders(xlEdgeBottom).ThemeColor = 1
    .Borders(xlEdgeBottom).Weight = xlThin
End With
    
End Sub

Sub Format_Row_Header_Blue_Arg(rngCell As Range)

With rngCell
    .Interior.Color = RGB(24, 60, 92)
    .Font.Color = RGB(255, 255, 255)
    .HorizontalAlignment = xlCenter
    .Borders(xlEdgeLeft).LineStyle = xlContinuous
    .Borders(xlEdgeLeft).ThemeColor = 1
    .Borders(xlEdgeLeft).Weight = xlThin
    .Borders(xlEdgeRight).LineStyle = xlContinuous
    .Borders(xlEdgeRight).ThemeColor = 1
    .Borders(xlEdgeRight).Weight = xlThin
    .Borders(xlEdgeTop).LineStyle = xlContinuous
    .Borders(xlEdgeTop).ThemeColor = 1
    .Borders(xlEdgeTop).Weight = xlThin
    .Borders(xlEdgeBottom).LineStyle = xlContinuous
    .Borders(xlEdgeBottom).ThemeColor = 1
    .Borders(xlEdgeBottom).Weight = xlThin
End With
    
End Sub


Sub Paste_Non_ZLS_Values()

Application.ScreenUpdating = False
Application.DisplayAlerts = False

Dim wsNew As Worksheet
Dim arr1() As Variant
Dim rng1 As Range
Dim lng1 As Long
Dim lngCounter As Long

Set wsNew = Sheets.Add
wsNew.Name = "Paste_01"
ActiveSheet.Cells(1, 1).PasteSpecial Paste:=xlPasteValues
Set rng1 = Selection
arr1 = rng1

Selection.Clear
lng1 = 1

For lngCounter = 1 To UBound(arr1)
    If Len(arr1(lngCounter, 1)) > 0 Then
        Cells(lng1, 1).Value = arr1(lngCounter, 1)
        lng1 = lng1 + 1
    End If
Next

Cells(1, 1).CurrentRegion.Select
Selection.Copy

Application.DisplayAlerts = True
Application.ScreenUpdating = True

End Sub

Sub Calculation_On()

Application.Calculation = xlCalculationAutomatic

End Sub

Sub Calculation_Off()

Application.Calculation = xlCalculationManual

End Sub

Sub Paste_Values_Transpose()

ActiveCell.PasteSpecial Paste:=xlPasteValues, Transpose:=True

End Sub


Sub FormatText4Char()

Dim lngCounter As Long
Dim varTemp As Variant

varTemp = Selection
Selection.ClearContents
Selection.NumberFormat = "@"

For lngCounter = LBound(varTemp) To UBound(varTemp)
    varTemp(lngCounter, 1) = Format(varTemp(lngCounter, 1), "0000")
Next

Selection = varTemp

End Sub

Sub FormatText3Char()

Dim lngCounter As Long
Dim varTemp As Variant

varTemp = Selection
Selection.ClearContents
Selection.NumberFormat = "@"

For lngCounter = LBound(varTemp) To UBound(varTemp)
    varTemp(lngCounter, 1) = Format(varTemp(lngCounter, 1), "000")
Next

Selection = varTemp

End Sub

Sub FormatTextVarChar()

Dim rng1 As Range
Dim rngCell As Range
Dim str1 As String

Set rng1 = Selection

For Each rngCell In rng1
    str1 = rngCell.FormulaR1C1
    rngCell.ClearContents
    rngCell.NumberFormat = "@"
    rngCell.FormulaR1C1 = str1
Next rngCell


End Sub

Sub PrintColor1()

Dim strPrinterDefault As String

strPrinterDefault = Application.ActivePrinter
Application.ActivePrinter = "\\hq001wfps01\PRTCSII4F01 on Ne05:"

ActiveWindow.SelectedSheets.PrintOut Copies:=1, Collate:=True, _
    IgnorePrintAreas:=False
    
Application.ActivePrinter = strPrinterDefault

End Sub

Sub GroupColumns()

Selection.EntireColumn.Group

End Sub

Sub GroupRows()

Selection.EntireColumn.Group

End Sub

Sub UnGroupColumns()

Selection.EntireColumn.Ungroup

End Sub

Sub UnGroupRows()

Selection.EntireColumn.Ungroup

End Sub

Sub GroupLevel1()

ActiveSheet.Outline.ShowLevels RowLevels:=1, ColumnLevels:=1

End Sub

Sub GroupLevel2()

ActiveSheet.Outline.ShowLevels RowLevels:=1, ColumnLevels:=1

End Sub

Sub CopySheetEmailJon()

Dim intSheetCount As Integer
Dim strFilePath As String
Dim strTimeStamp As String
Dim strMailSubject As String
Dim wbTemp As Workbook
Dim wbNew As Workbook
Dim wsTemp As Worksheet
Dim objOutApp As Object
Dim objOutMail As Object

Application.ScreenUpdating = False
Application.DisplayAlerts = False

Set wbTemp = ActiveWorkbook
Set wbNew = Workbooks.Add
intSheetCount = wbNew.Sheets.Count

wbTemp.Activate
ActiveSheet.Copy Before:=wbNew.Sheets(1)
ActiveSheet.Name = "For Your Review"

For Each wsTemp In Worksheets
    If InStr(1, wsTemp.Name, "For Your Review") = 0 Then
        wsTemp.Delete
    End If
Next wsTemp

strFilePath = "\\800MSD015\C$\Users\jwalke64\Downloads\"
strTimeStamp = Format(Now, "YYYY-MM-DD HHMMSS")

wbNew.SaveAs Filename:=strFilePath & "Temp " & strTimeStamp & ".xlsx", _
    FileFormat:=xlOpenXMLWorkbook

wbNew.Close SaveChanges:=False

TrapEmailSubject:
strMailSubject = Application.InputBox(Prompt:="Email Subject?", _
    Title:="Email Subject")

If Len(strMailSubject) = 0 Then
    MsgBox Prompt:="Please populate Email Subject", _
        Buttons:=vbCritical + vbSystemModal, _
        Title:="Email Subject Validation"
    GoTo TrapEmailSubject
End If

Set objOutApp = CreateObject("Outlook.Application")
Set objOutMail = objOutApp.CreateItem(0)

On Error Resume Next

With objOutMail
    .To = "Jon_Watson@chs.net"
    .Subject = strMailSubject
    .Attachments.Add strFilePath & "Temp " & strTimeStamp & ".xlsx"
    .Send
End With

On Error GoTo 0

Set objOutApp = Nothing
Set objOutMail = Nothing

Application.ScreenUpdating = True
Application.DisplayAlerts = True

MsgBox Prompt:="Success: Worksheet is copied and emailed", _
    Buttons:=vbInformation + vbSystemModal, _
    Title:="Copy Sheet and Email Process"

End Sub

Sub Text_Box_Code()

Dim wsCurrent As Worksheet
Dim rngCurrent As Range
Dim shpCode As Shape

Set wsCurrent = ActiveSheet
Set rngCurrent = ActiveCell

Set shpCode = wsCurrent.Shapes.AddTextbox(Orientation:=msoTextOrientationHorizontal, Left:=rngCurrent.Left, Top:=rngCurrent.Top, Width:=100, Height:=100)

With shpCode
    .TextEffect.FontName = "Cambria"
    .TextEffect.FontSize = 10
    .TextEffect.FontBold = msoTrue
    .TextFrame2.WordWrap = msoFalse
    .Fill.PresetTextured msoTexturePurpleMesh
    .TextFrame2.TextRange.Characters.Font.Fill.ForeColor.ObjectThemeColor = msoThemeColorBackground1
    .TextFrame2.AutoSize = msoAutoSizeShapeToFitText
End With

End Sub

Public Sub Format_SQL_for_VBA()

Dim blnTemp1 As Boolean
Dim intCounter1 As Integer
Dim intTemp1 As Integer
Dim strTemp1 As String
Dim dictTemp1 As Dictionary
Dim varTemp1 As Variant
Dim varTemp2 As Variant

MsgBox "Paste SQL into worksheet (leaving it selected)", vbInformation + vbSystemModal, "Instructions"

'Write range to array

If Selection.Rows.Count < 2 Then
    ReDim varTemp1(1 To 1, 1 To 1)
    varTemp1(1, 1) = Selection
Else
    varTemp1 = Selection
End If

If WorksheetFunction.CountA(Selection) = 0 Then
    MsgBox "Process Cancelled: No SQL Provided", vbCritical + vbSystemModal, "Validation"
    Exit Sub
End If

'Write array to dictionary
Set dictTemp1 = New Dictionary

For intCounter1 = LBound(varTemp1) To UBound(varTemp1)
    dictTemp1.Add intCounter1, Chr(34) & varTemp1(intCounter1, 1) & Chr(34) & " & vbCrLf & _"
Next intCounter1

'Adjust first line of every 20 rows of text to add strSQL text
intCounter1 = 1

blnTemp1 = True

Do Until blnTemp1 = False
    
    With dictTemp1
        If .Exists(intCounter1) = True Then
            blnTemp1 = True
            dictTemp1.Item(intCounter1) = "strsql = strsql & vbCrLF & " & dictTemp1.Item(intCounter1)
        Else
            blnTemp1 = False
        End If
    End With
        
    intCounter1 = intCounter1 + 20
Loop

'Adjust last line of every 20 rows of text to remove carriage return
intCounter1 = 20

blnTemp1 = True

Do Until blnTemp1 = False
    
    With dictTemp1
        If .Exists(intCounter1) = True Then
            blnTemp1 = True
            strTemp1 = dictTemp1.Item(intCounter1)
            strTemp1 = Replace(strTemp1, " & vbCrLf & _", "")
            dictTemp1.Item(intCounter1) = strTemp1
        Else
            blnTemp1 = False
        End If
    End With
        
    intCounter1 = intCounter1 + 20
Loop

'Adjust last line of text to remove carriage return
strTemp1 = dictTemp1.Item(UBound(varTemp1))
strTemp1 = Replace(strTemp1, " & vbCrLf & _", "")
dictTemp1.Item(UBound(varTemp1)) = strTemp1

'Write dictionary to array
varTemp1 = dictTemp1.Items

'Write array to range
For intCounter1 = LBound(varTemp1) To UBound(varTemp1)
    Cells(intCounter1 + 1, 1).Value = varTemp1(intCounter1)
Next intCounter1

MsgBox "Success: SQL is formatted for VBA", vbInformation + vbSystemModal, "SQL Data Formatted for VBA"

End Sub

Public Sub Format_VBA_SQL_For_SQL()

Dim intCounter1 As Integer
Dim intCount1 As Integer
Dim strTemp1 As String
Dim varTemp1 As Variant

MsgBox "Paste VBA SQL into worksheet (leaving it selected)", vbInformation + vbSystemModal, "Instructions"

If Selection.Rows.Count < 2 Then
    ReDim varTemp1(1 To 1, 1 To 1)
    varTemp1(1, 1) = Selection
Else
    varTemp1 = Selection
End If

If WorksheetFunction.CountA(Selection) = 0 Then
    MsgBox "Process Cancelled: No VBA SQL Provided", vbCritical + vbSystemModal, "Validation"
    Exit Sub
End If

intCount1 = 0

For intCounter1 = LBound(varTemp1) To UBound(varTemp1)
    If Len(varTemp1(intCounter1, 1)) > 0 Then
        intCount1 = intCount1 + 1
    End If
Next intCounter1

For intCounter1 = LBound(varTemp1) To UBound(varTemp1)
    strTemp1 = varTemp1(intCounter1, 1)
    strTemp1 = Replace(strTemp1, "strsql = strsql & vbCrLf & ", "")
    strTemp1 = Replace(strTemp1, " & vbCrLf & _", "")
    strTemp1 = Replace(strTemp1, Chr(34), "")
    varTemp1(intCounter1, 1) = strTemp1
Next intCounter1

Selection = varTemp1

MsgBox "Success: VBA SQL is formatted for SQL", vbInformation + vbSystemModal, "VBA SQL Data Formatted for SQL"

End Sub

Sub Format4_3()

Dim lngCounter As Long
Dim strTemp As String
Dim varTemp As Variant

If Selection.Rows.Count > 1 Then
    varTemp = Selection
Else
    ReDim varTemp(1 To 1, 1 To 1)
    varTemp(1, 1) = Selection
End If

For lngCounter = LBound(varTemp) To UBound(varTemp)
        strTemp = varTemp(lngCounter, 1)
        
        If InStr(1, strTemp, ".") > 0 Then
            strTemp = Format(Left(strTemp, InStr(1, strTemp, ".") - 1), "0000") & Right(strTemp, 4)
            varTemp(lngCounter, 1) = strTemp
        End If
        
Next lngCounter

Selection.ClearContents
Selection.NumberFormat = "@"
Selection = varTemp

End Sub

Sub CopySheetNewBook()

Dim strWSName As String
Dim wsTemp As Excel.Worksheet
Dim wbXLSource As Excel.Workbook
Dim wbXLNew As Excel.Workbook

Application.ScreenUpdating = False
Application.DisplayAlerts = False
Set wbXLSource = ActiveWorkbook
Set wbXLNew = Workbooks.Add
wbXLSource.Activate
ActiveSheet.Copy Before:=wbXLNew.Sheets(1)
strWSName = ActiveSheet.Name

For Each wsTemp In Worksheets
    If wsTemp.Name <> strWSName Then
        wsTemp.Delete
    End If
Next wsTemp

ActiveSheet.Name = "Sheet1"
Application.DisplayAlerts = True
Application.ScreenUpdating = True

End Sub

Sub ColumnAutoFitFreezeTopRow()

ActiveSheet.UsedRange.Columns.AutoFit
Cells(2, 1).Select
ActiveWindow.FreezePanes = True

End Sub

Sub FormatValuesPivotTable01()

Dim ptTemp As PivotTable
Dim pfTemp As PivotField

For Each ptTemp In ActiveSheet.PivotTables
    With ptTemp
        For Each pfTemp In .PivotFields
            If pfTemp.Calculation = -4157 Then
                MsgBox pfTemp.Name
            End If
        Next pfTemp
    End With
Next ptTemp

End Sub

Sub PasteFileNames()

'Reference Microsoft Scripting Runtime

Dim intCounter1 As Integer
Dim strpath As String
Dim fsoTemp As FileSystemObject
Dim fsoFolder As Folder
Dim fsoFile As File
Dim dictTemp As Dictionary
Dim varTemp As Variant
Dim varKey As Variant

strpath = "G:\Physician Practice Services Data\EDW\BI_Analysis\DIVISION_5_201505\WEEKLY_PRODUCTION_REPORT\"
Set dictTemp = New Dictionary
Set fsoTemp = New FileSystemObject
Set fsoFolder = fsoTemp.GetFolder(strpath)

For Each fsoFile In fsoFolder.Files
    dictTemp.Add fsoFile.Name, 1
Next fsoFile

Set fsoTemp = Nothing

ReDim varTemp(1 To dictTemp.Count, 1 To 1)
intCounter1 = 1

For Each varKey In dictTemp
    varTemp(intCounter1, 1) = varKey
    intCounter1 = intCounter1 + 1
Next varKey

ActiveCell.Resize(UBound(varTemp), 1) = varTemp

MsgBox "Success", vbInformation + vbSystemModal


End Sub


Sub PivotTest()

Dim intCounter1 As Integer
Dim wsTemp As Worksheet
Dim nmTemp As Name
Dim varTemp As Variant

ReDim varTemp(1 To ActiveWorkbook.Sheets.Count)
intCounter1 = 1

For Each wsTemp In ActiveWorkbook.Worksheets
    varTemp(intCounter1) = wsTemp.Name
    intCounter1 = intCounter1 + 1
Next wsTemp

For intCounter1 = LBound(varTemp) To UBound(varTemp)
    Sheets(varTemp(intCounter1)).Activate
    MsgBox ActiveSheet.Names.Count
    
    
    
    
    
    
Next intCounter1



'For Each nmTemp In ActiveWorkbook.Names
'    If Left(nmTemp.Name, 8) = "rngPivot" Then
'        MsgBox nmTemp.Name
'    End If
'Next nmTemp



End Sub

Public Sub TrimSelection()

Dim lngCounter As Long
Dim varTemp As Variant

varTemp = Selection

For lngCounter = LBound(varTemp) To UBound(varTemp)
    varTemp(lngCounter, 1) = Trim(varTemp(lngCounter, 1))
Next lngCounter

Selection.Cells(1, 1).Resize(Selection.Rows.Count, 1) = varTemp

MsgBox "Complete", vbInformation + vbSystemModal, "Trim Selection"

End Sub


Sub spr_conversion()

Dim strpath As String
Dim rngTemp As Range

Application.ScreenUpdating = False
Application.DisplayAlerts = False
Columns(6).Delete
Columns(5).Delete
Columns(4).Delete
Columns(2).Delete
Set rngTemp = Cells(1, 1).CurrentRegion
rngTemp.Columns(3).NumberFormat = "m/d/yyyy"
strpath = "C:\Users\jason.walker\Downloads\"
ActiveWorkbook.SaveAs strpath & "1.txt", xlText
ActiveWorkbook.Close False

Application.DisplayAlerts = True
Application.ScreenUpdating = True
MsgBox "Complete"

End Sub

Sub ConnectSQLServerTemp()

Dim wsCur As Worksheet
Dim wsNew As Worksheet
Dim rngTemp As Range
Dim varTemp As Variant

Application.ScreenUpdating = False
Application.DisplayAlerts = False

With ActiveSheet.ListObjects.Add(SourceType:=0, Source:=Array( _
    "OLEDB;Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=True;Data Source=TNDCSQL02;Use Procedure for Prepare=1;Auto T" _
    , _
    "ranslate=True;Packet Size=4096;Workstation ID=WIN7FULLJWALKER;Use Encryption for Data=False;Tag with column collation when possi" _
    , "ble=False;Initial Catalog=Playground"), Destination:=Range("$A$1")). _
    QueryTable
    .CommandType = xlCmdTable
    .CommandText = Array("""Playground"".""myop\jason.walker"".""jwtemp""")
    .RowNumbers = False
    .FillAdjacentFormulas = False
    .PreserveFormatting = True
    .RefreshOnFileOpen = False
    .BackgroundQuery = True
    .RefreshStyle = xlInsertDeleteCells
    .SavePassword = False
    .SaveData = True
    .AdjustColumnWidth = True
    .RefreshPeriod = 0
    .PreserveColumnInfo = True
    .SourceConnectionFile = _
    "\\myop.local\users\file07\jason.walker\Documents\My Data Sources\TNDCSQL02 Playground jwtemp.odc"
    .ListObject.DisplayName = "Table_TNDCSQL02_Playground_jwtemp"
    .Refresh BackgroundQuery:=False
End With

Set wsCur = ActiveSheet
Set wsNew = Sheets.Add
wsCur.Activate
Set rngTemp = Cells(1, 1).CurrentRegion
varTemp = rngTemp
wsNew.Activate
Cells(1, 1).Resize(rngTemp.Rows.Count, rngTemp.Columns.Count).NumberFormat = rngTemp.NumberFormat
Cells(1, 1).Resize(UBound(varTemp), UBound(varTemp, 2)) = varTemp
wsCur.Delete
Cells(1, 1).CurrentRegion.Columns.AutoFit

Application.ScreenUpdating = True
Application.DisplayAlerts = True

MsgBox "Complete", vbInformation + vbSystemModal

End Sub

Public Sub SQLResultText()

Range(Cells(1, 1), Cells(50000, 100)).NumberFormat = "@"
Cells(2, 1).Select
ActiveWindow.FreezePanes = True
Cells(1, 1).Select
MsgBox "Text Format Complete", vbInformation + vbSystemModal, "Format Columns as Text"

End Sub


Public Sub PasteTDResult()

Dim cellStart As Range
Dim wsNew As Worksheet
Dim wsCur As Worksheet
Dim colCount As Integer
Dim rowCount As Long
Dim rngCell As Range
Dim rng1 As Range
Dim rng2 As Range
Dim rng3 As Range
Dim rngFormatCopy As Range
Dim dataObject As dataObject
Dim a As Integer

Application.ScreenUpdating = False

Set dataObject = New dataObject
dataObject.GetFromClipboard

If dataObject.GetFormat(1) = False Then
    MsgBox "There is nothing copied, process cancelled", vbCritical + vbSystemModal, "Copy Validation"
    Exit Sub
End If

Set cellStart = ActiveCell
Set wsCur = ActiveSheet
Set wsNew = Sheets.Add
wsNew.Paste
Set rng1 = Selection
colCount = Selection.Columns.Count
rowCount = Selection.Rows.Count

rng1.NumberFormat = "@"
wsNew.Paste

Set rng2 = rng1.Offset(rowCount + 2, 0)

a = 1

For Each rngCell In Range(rng1.Cells(2, 1), rng1.Cells(2, colCount))
    If IsDate(rngCell.Value) = True And rngCell.Value <> 0 Then
        rng2.Cells(2, a).NumberFormat = "m/d/yyyy h:mm:ss"
    Else
        rng2.Cells(2, a).NumberFormat = "@"
    End If
    a = a + 1
Next rngCell


If rowCount > 2 Then
    rng2.Offset(1, 0).FillDown
End If

rng2.Select
rng2.Formula = rng1.Formula

Set rng3 = rng2.Offset(0, 1).Resize(rowCount, colCount - 1)
rng3.Columns.AutoFit

For Each rngCell In rng3.Rows(1)
    Call Format_Row_Header_Blue_Arg(rngCell)
Next rngCell

rng3.Copy Destination:=cellStart.Resize(rowCount, colCount - 1)


wsCur.Activate
ActiveCell.CurrentRegion.Columns.AutoFit

Application.DisplayAlerts = False
wsNew.Delete
Application.DisplayAlerts = True

Application.ScreenUpdating = True


End Sub

Sub hotkey_d_unassign()

Application.OnKey "^{d}"


End Sub
