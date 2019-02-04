#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\Downloads\Papirus-Team-Papirus-Apps-System-reboot.ico
#AutoIt3Wrapper_Outfile_x64=CleanReboot.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Clean Reboot
#AutoIt3Wrapper_Res_Fileversion=1.0.0.1
#AutoIt3Wrapper_Res_ProductVersion=1.0.0.1
#AutoIt3Wrapper_Res_LegalCopyright=Carm0
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Constants.au3>
#include <MsgBoxConstants.au3>
$answer = MsgBox($MB_OKCANCEL, "Clean Reboot", "Do You really want to reboot your computer")
If $answer = $idok Then
;	MsgBox(0, "", "OK was pressed")
	$command = 'Shutdown.exe /r /t 0'
	_GetDOSOutput($command)
ElseIf $answer = $idcancel Then
	;MsgBox(0, "", "CANCEL was pressed")
	Exit
EndIf

Func _GetDOSOutput($sCommand)
	Local $iPID, $sOutput = ""

	$iPID = Run('"' & @ComSpec & '" /c ' & $sCommand, "", @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
	While 1
		$sOutput &= StdoutRead($iPID, False, False)
		If @error Then
			ExitLoop
		EndIf
		Sleep(10)
	WEnd
	Return $sOutput
EndFunc   ;==>_GetDOSOutput
