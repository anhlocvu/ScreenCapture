Func language()
$lang_form=GUICreate("Choose a language", 300, 300)
GUICtrlCreateLabel("Choose a language for this software",10,10,280,20)
$combo=GUICtrlCreateCombo("", 10, 20, 280, 20)
GUICtrlSetData($combo, "english|tiếng_việt","english")
$ok_button=GUICtrlCreateButton("ok",10, 60, 280, 20)
GUISetState()
while 1
$msg=GUIGetMsg()
Switch $msg

	Case $GUI_EVENT_CLOSE
Exit
	Case $ok_button
$select=GUICtrlRead($combo)
$f=FileOpen("data/langselect.sct",2)
if $Select="english" Then
GUIDelete($lang_form)
FileWrite($f, "1")
welcome()
EndIf
If $select="tiếng_việt" Then
GUIDelete($lang_form)
FileWrite($f, "2")
chao()

EndIf

EndSwitch

WEnd
EndFunc