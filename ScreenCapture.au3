#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\MyAutoIt3_Blue.ico
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Comment=Screen capture software
#AutoIt3Wrapper_Res_Description=Screen capture software
#AutoIt3Wrapper_Res_Fileversion=3.1
#AutoIt3Wrapper_Res_ProductName=ScreenCapture_
#AutoIt3Wrapper_Res_ProductVersion=3.1
#AutoIt3Wrapper_Res_CompanyName=anhloc
#AutoIt3Wrapper_Res_LegalCopyright=anhloc
#AutoIt3Wrapper_Res_LegalTradeMarks=technology entertainment
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GUIConstants.au3>
#include <ColorConstants.au3>
#include <ScreenCapture.au3>
$version="3.2"
SoundPlay(@ScriptDir&"\sounds\logo.mp3")
MsgBox(64,"welcome","ScreenCapture, version "& $version & " is running. Find what you want to capture screens and Control+Alt+C")
HotKeySet('!^c', 'catture')
While 1
Sleep(100)
WEnd


Func catture()
SoundPlay(@ScriptDir&"\sounds\inter face.mp3")
$hg=GUICreate('Capture_', 300, 300)
GUISetBkColor($COLOR_BLUE)
$lb_filename=GUICtrlCreateLabel('&file name', 10, 10, 280, 20)
$enter_filename=GUICtrlCreateInput('', 10, 40, 199, 20)
Global $f=@ScriptDir
GUICtrlCreateLabel("Current f&older path",10,60,280,20)
$pact=GUICtrlCreateInput($f,10,60,280,20)

$brow=GUICtrlCreateButton('&browse', 250, 40, 50, 20)
$jpg=GUICtrlCreateCheckbox('&jpg', 10, 80, 280,20)
$png=GUICtrlCreateCheckbox('&png', 10, 200, 280,20)
$cbtn=GUICtrlCreateButton("&capture",10,250,280,30)
$menu=GUICtrlCreateMenu("main")
$menuitem1=GUICtrlCreateMenuItem("About", $menu)
$menuitem2=GUICtrlCreateMenuItem("contact", $menu)
$menuitem3=GUICtrlCreateMenuItem("See source code on github",$menu)
$menuitem4=GUICtrlCreateMenuItem("exit", $menu)

GUISetState(@SW_SHOW, $hg)
While True
$msg=GUIGetMsg()
Switch $msg
Case $GUI_EVENT_CLOSE, $menuitem4
Exit



Case $brow
$f=FileSelectFolder('Select Folder', '')
GUICtrlSetData($pact, $f)

Case $menuitem3

ShellExecute("https://github.com/anhlocvu/ScreenCapture")

	Case $cbtn
$doc=GUICtrlRead($enter_filename)
if $doc="" Then
MsgBox(16,"Error", "must enter the file name")
ContinueLoop
GUISetState(@SW_SHOW, $hg)

EndIf

if GUICtrlRead($jpg)=4 And GUICtrlRead($png)=4 Then

MsgBox(16,"Error", "Choose at least 1 format to capture")
ContinueLoop
GUISetState(@SW_SHOW, $hg)
EndIf




GUISetState(@SW_HIDE, $hg)
if GUICtrlRead($jpg)=1 Then

sleep(500)
SoundPlay(@ScriptDir&"\sounds\capture.mp3")
_ScreenCapture_Capture($f & '\' & $doc & '.jpg')
MsgBox(64, 'hooray!', 'screenshot successful')

EndIf
if GUICtrlRead($png)=1 Then
sleep(500)
_ScreenCapture_Capture($f & '\' & $doc & '.png')
SoundPlay(@ScriptDir&"\sounds\capture.mp3")
MsgBox(64, 'hooray!', 'screenshot successful')

EndIf

GUISetState(@SW_SHOW, $hg)
Case $menuitem1
MsgBox(0, "hello", "This is Screencapture software, this software will allow people to capture their screens if your computer does not have a screenshot function, such as a desktop, [PC]. Me, is anhloc LCBoy, who has made this software, if you want to contact me, find the Contact in Main Menu")


Case $menuitem2

contact()

EndSwitch

WEnd

EndFunc

Func contact()


$contactgui=GUICreate("contact", 300, 300)
GUISetBkColor($COLOR_BLUE)
GUICtrlCreateLabel("Where do you want to contact me", 10, 5, 280, 30)
$facebook=GUICtrlCreateButton("facebook", 10, 80, 280, 20)
$email=GUICtrlCreateButton("email", 10, 120, 280, 20)
$telegram=GUICtrlCreateButton("telegram", 10, 160, 280, 20)
$back=GUICtrlCreateButton("go back", 10, 200, 280, 20)
GUISetState(@SW_SHOW, $contactgui)

while True

$msg=GUIGetMsg()
if $msg=$GUI_EVENT_CLOSE or $msg=$back Then
GUIDelete($contactgui)
ExitLoop

EndIf

if $msg=$facebook Then

ShellExecute("https://www.facebook.com/anhloc2004/")

EndIf

if $msg=$email Then
ClipPut("locvuu2105@gmail.com")
MsgBox(0,"Email has been copied to Clipboard", "locvuu2105@gmail.com")

EndIf

if $msg=$telegram Then

ShellExecute("https://t.me/Loc2004")

EndIf

WEnd

EndFunc