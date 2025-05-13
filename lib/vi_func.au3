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
Func chao()
SoundPlay(@ScriptDir&"\sounds\logo.mp3")
MsgBox(0,"Chào mừng","ScreenCapture, phiên bản "& $version & " đang chạy. Tìm những gì bạn muốn chụp màn hình và nhấn Control+Alt+C")
HotKeySet('!^c', 'chup')
While 1
Sleep(100)
WEnd

EndFunc
Func chup()
SoundPlay(@ScriptDir&"\sounds\inter face.mp3")
$hg=GUICreate('Capture_', 300, 300)
GUISetBkColor($COLOR_BLUE)
$lb_filename=GUICtrlCreateLabel('&tên file', 10, 10, 280, 20)
$enter_filename=GUICtrlCreateInput('', 10, 40, 199, 20)
Global $f=@ScriptDir
GUICtrlCreateLabel("đường &dẫn thư mục hiện tại",10,80,280,20)
$pact=GUICtrlCreateInput($f,10,80,280,20)

$brow=GUICtrlCreateButton('du&yệt', 230, 40, 70, 20)
$jpg=GUICtrlCreateCheckbox('&jpg', 150, 100, 100,40)
$png=GUICtrlCreateCheckbox('&png', 150, 120, 100,40)


$cbtn=GUICtrlCreateButton("&chụp", 100, 160, 100,30)
$cancel_btn=GUICtrlCreateButton("hủy bỏ", 100, 200, 100, 30)
$menu=GUICtrlCreateMenu("Trợ giúp và hỗ trợ")
$menuitem1=GUICtrlCreateMenuItem("dới thiệu", $menu)
$submenu=GUICtrlCreateMenu("liên hệ với tôi", $menu)
$submenuitem1=GUICtrlCreateMenuItem("face book", $submenu)
$submenuitem2=GUICtrlCreateMenuItem("email", $submenu)
$submenuitem3=GUICtrlCreateMenuItem("telegram", $submenu)
$menuitem3=GUICtrlCreateMenuItem("xem mã nguồn trên github",$menu)

$menuitem5 = GuiCtrlCreateMenuItem("hướng dẫn", $menu)
$menuitem6=GUICtrlCreateMenuItem("người đóng &góp",$menu)
$menuitem4=GUICtrlCreateMenuItem("th&oát", $menu)
$langmenu=GUICtrlCreateMenu("ngôn ngữ")
$langitem=GUICtrlCreateMenuItem("english",$langmenu)
$langitem2=GUICtrlCreateMenuItem("tiếng việt", $langmenu)

GUISetState(@SW_SHOW, $hg)
While True
$msg=GUIGetMsg()
Switch $msg
Case $GUI_EVENT_CLOSE, $menuitem4, $cancel_btn
SoundPlay("sounds/exit.mp3", 1)
Exit
Case $langitem
MsgBox(64,"cảnh báo:","phần mềm sẽ đóng lại để áp dụng cài đặt ngôn ngữ")
$f=FileOpen("data/langselect.sct",2)
FileWrite($f,"1")
Exit
Case $langitem2
MsgBox(64,"cảnh báo:","phần mềm sẽ đóng lại để áp dụng cài đặt ngôn ngữ")
$f=FileOpen("data/langselect.sct",2)
FileWrite($f,"2")
Exit

	Case $menuitem6
donggop()

		Case $menuitem5
huongdan()
Case $brow
SoundPlay(@ScriptDir&"\sounds\enter.mp3")
$f=FileSelectFolder('chọn thư mục', @ScriptDir)
GUICtrlSetData($pact, $f)

Case $menuitem3

ShellExecute("https://github.com/anhlocvu/ScreenCapture")

	Case $cbtn
SoundPlay(@ScriptDir&"\sounds\enter.mp3")
$doc=GUICtrlRead($enter_filename)
if $doc="" Then
MsgBox(16,"Lỗi","Phải nhập tên file")
ContinueLoop
GUISetState(@SW_SHOW, $hg)

EndIf

if GUICtrlRead($jpg)=4 And GUICtrlRead($png)=4 Then

MsgBox(16,"Lỗi","Vui lòng chọn ít nhất 1 định dạng để chụp")

ContinueLoop
GUISetState(@SW_SHOW, $hg)
EndIf




GUISetState(@SW_HIDE, $hg)
if GUICtrlRead($jpg)=1 Then

sleep(500)
SoundPlay("sounds/capture.mp3")
_ScreenCapture_Capture($f & '\' & $doc & '.jpg')
MsgBox(64, 'hoan hô', 'Chụp ảnh màn hình thành công')


EndIf
if GUICtrlRead($png)=1 Then
sleep(500)
_ScreenCapture_Capture($f & '\' & $doc & '.png')
SoundPlay("sounds/capture.mp3")
MsgBox(64, 'hoan hô!', 'Chụp ảnh màn hình thành công')


EndIf

GUISetState(@SW_SHOW, $hg)
Case $menuitem1
MsgBox(64, "Xin chào", "Đây là phần mềm chụp màn hình, phần mềm này sẽ cho phép người dùng chụp màn hình nếu máy tính của bạn không có chức năng chụp ảnh màn hình, ví dụ như máy tính để bàn [PC]. Tôi là anhloc LCBoy, người đã tạo ra phần mềm này, nếu bạn muốn liên hệ với tôi, hãy tìm mục Liên hệ trong menu Trợ giúp và hỗ trợ")


	Case $submenuitem1
SoundPlay(@ScriptDir&"\sounds\enter.mp3")
ShellExecute("https://www.facebook.com/anhloc2004/")
Case $submenuitem2
ClipPut("locvuu2105@gmail.com")
SoundPlay(@ScriptDir&"\sounds\enter.mp3")
MsgBox(64,"email đã được xao chép vào bộ nhớ tạm", "locvuu2105@gmail.com")
	Case $submenuitem3
SoundPlay(@ScriptDir&"\sounds\enter.mp3")
ShellExecute("https://t.me/Loc2004")



EndSwitch

WEnd

EndFunc

Func huongdan()
SoundPlay(@ScriptDir&"\sounds\enter.mp3")
$readmeGui = GuiCreate("hướng dẫn", 600, 600)
GUISetBkColor($COLOR_BLUE)
$fileReadme = FileRead("dock/README vi.txt")
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
Func donggop()
SoundPlay(@ScriptDir&"\sounds\enter.mp3")
$cg=GUICreate("contribute", 600, 600)
GUISetBkColor($COLOR_BLUE)
GUICtrlCreateLabel("Cảm ơn những người đã nỗ lực đóng góp cho phần mềm screen capture.", 10, 100, 580, 20)
$list=GUICtrlCreateListView("list", 20, 100, 540, 580)
GUICtrlCreateListViewItem("võ đình hưng", $list)
GUICtrlCreateListViewItem("Võ đình hoàng", $list)
GUICtrlCreateListViewItem("Nguyễn Ninh Hoàng", $list)
$back_btn=GUICtrlCreateButton("&quay lại", 5, 10, 100, 60)
GUISetState(@SW_SHOW, $cg)


while 1


Switch GUIGetMsg()
	Case $GUI_EVENT_CLOSE, $back_btn
GUIDelete($cg)
ExitLoop




EndSwitch

WEnd

EndFunc