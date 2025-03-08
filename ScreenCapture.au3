#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\MyAutoIt3_Blue.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Comment=Screen capture software
#AutoIt3Wrapper_Res_Description=Screen capture software
#AutoIt3Wrapper_Res_Fileversion=3.2.0.0
#AutoIt3Wrapper_Res_ProductName=ScreenCapture_
#AutoIt3Wrapper_Res_ProductVersion=3.2
#AutoIt3Wrapper_Res_CompanyName=anhloc
#AutoIt3Wrapper_Res_LegalCopyright=anhloc
#AutoIt3Wrapper_Res_LegalTradeMarks=technology entertainment
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GuiConstants.au3>
#include <ColorConstants.au3>
#include <ScreenCapture.au3>
$version="3.2"
SoundPlay(@ScriptDir&"\sounds\logo.mp3")
MsgBox(0,"welcome","ScreenCapture, version "& $version & " is running. Find what you want to capture screens and Control+Alt+C")
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
GUICtrlCreateLabel("Current f&older path",10,80,280,20)
$pact=GUICtrlCreateInput($f,10,80,280,20)

$brow=GUICtrlCreateButton('&browse', 230, 40, 70, 20)
$jpg=GUICtrlCreateCheckbox('&jpg', 150, 100, 100,40)
$png=GUICtrlCreateCheckbox('&png', 150, 120, 100,40)


$cbtn=GUICtrlCreateButton("&capture", 100, 160, 100,30)
$cancel_btn=GUICtrlCreateButton("cancel", 100, 200, 100, 30)
$menu=GUICtrlCreateMenu("help and support")
$menuitem1=GUICtrlCreateMenuItem("About", $menu)
$submenu=GUICtrlCreateMenu("contact me", $menu)
$submenuitem1=GUICtrlCreateMenuItem("face book", $submenu)
$submenuitem2=GUICtrlCreateMenuItem("email", $submenu)
$submenuitem3=GUICtrlCreateMenuItem("telegram", $submenu)
$menuitem3=GUICtrlCreateMenuItem("See source code on github",$menu)

$menuitem5 = GuiCtrlCreateMenuItem("ReadMe", $menu)
$menuitem6=GUICtrlCreateMenuItem("c&ontribute",$menu)
$menuitem4=GUICtrlCreateMenuItem("e&xit", $menu)
GUISetState(@SW_SHOW, $hg)
While True
$msg=GUIGetMsg()
Switch $msg
Case $GUI_EVENT_CLOSE, $menuitem4, $cancel_btn
SoundPlay("sounds/exit.mp3", 1)
Exit

	Case $menuitem6
contribute()

		Case $menuitem5
ReadMe()
Case $brow
SoundPlay(@ScriptDir&"\sounds\enter.mp3")
$f=FileSelectFolder('Select Folder', @ScriptDir)
GUICtrlSetData($pact, $f)

Case $menuitem3

ShellExecute("https://github.com/anhlocvu/ScreenCapture")

	Case $cbtn
SoundPlay(@ScriptDir&"\sounds\enter.mp3")
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
SoundPlay("sounds/capture.mp3")
_ScreenCapture_Capture($f & '\' & $doc & '.jpg')
MsgBox(64, 'hooray!', 'screenshot successful')

EndIf
if GUICtrlRead($png)=1 Then
sleep(500)
_ScreenCapture_Capture($f & '\' & $doc & '.png')
SoundPlay("sounds/capture.mp3")
MsgBox(64, 'hooray!', 'screenshot successful')

EndIf

GUISetState(@SW_SHOW, $hg)
Case $menuitem1
MsgBox(64, "hello", "This is Screencapture software, this software will allow people to capture their screens if your computer does not have a screenshot function, such as a desktop, [PC]. Me, is anhloc LCBoy, who has made this software, if you want to contact me, find the Contact in help and support Menu")

	Case $submenuitem1
SoundPlay(@ScriptDir&"\sounds\enter.mp3")
ShellExecute("https://www.facebook.com/anhloc2004/")
Case $submenuitem2
ClipPut("locvuu2105@gmail.com")
SoundPlay(@ScriptDir&"\sounds\enter.mp3")
MsgBox(64,"Email has been copied to Clipboard", "locvuu2105@gmail.com")
	Case $submenuitem3
SoundPlay(@ScriptDir&"\sounds\enter.mp3")
ShellExecute("https://t.me/Loc2004")



EndSwitch

WEnd

EndFunc

Func ReadMe()
SoundPlay(@ScriptDir&"\sounds\enter.mp3")
$readmeGui = GuiCreate("ReadMe", 600, 600)
GUISetBkColor($COLOR_BLUE)
$fileReadme = FileRead("README.txt")
    $readmebox = GUICtrlCreateEdit("", 120, 120, 380, 250, BitOR($ES_AUTOVSCROLL, $ES_READONLY, $WS_VSCROLL))
GuiCtrlSetData($readmebox, $fileReadme)
GuiSetState(@SW_SHOW, $readmeGui)
While True
Switch GuiGetMSG()
Case $GUI_EVENT_CLOSE
GuiDelete($readmeGui)
ExitLoop
endSwitch
wEnd
endFunc
Func contribute()
SoundPlay(@ScriptDir&"\sounds\enter.mp3")
$cg=GUICreate("contribute", 600, 600)
GUISetBkColor($COLOR_BLUE)
GUICtrlCreateLabel("Thank you for these people for taking a lot of effort to contribute to Screen Capture", 10, 100, 580, 20)
$list=GUICtrlCreateListView("list", 20, 100, 540, 580)
GUICtrlCreateListViewItem("võ đình hưng", $list)
GUICtrlCreateListViewItem("Võ đình hoàng", $list)
GUICtrlCreateListViewItem("Nguyễn Ninh Hoàng", $list)
$back_btn=GUICtrlCreateButton("go &back", 5, 10, 100, 60)
GUISetState(@SW_SHOW, $cg)


while 1


Switch GUIGetMsg()
	Case $GUI_EVENT_CLOSE, $back_btn
GUIDelete($cg)
ExitLoop




EndSwitch

WEnd

EndFunc