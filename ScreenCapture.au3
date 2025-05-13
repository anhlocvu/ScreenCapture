#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\MyAutoIt3_Blue.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Comment=Screen capture software
#AutoIt3Wrapper_Res_Description=Screen capture software
#AutoIt3Wrapper_Res_Fileversion=3.3
#AutoIt3Wrapper_Res_ProductName=ScreenCapture_
#AutoIt3Wrapper_Res_ProductVersion=3.3
#AutoIt3Wrapper_Res_CompanyName=anhloc
#AutoIt3Wrapper_Res_LegalCopyright=anhloc
#AutoIt3Wrapper_Res_LegalTradeMarks=technology entertainment
#AutoIt3Wrapper_Res_Language=1066
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
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
#include "lib\en_func.au3"
#include "lib\vi_func.au3"
#include "lib\lang.au3"
$version="3.3"
If Not FileExists("data") Then
DirCreate("data")

EndIf
If Not FileExists("data/langselect.sct") Then
language()

EndIf
$sl=FileRead("data/langselect.sct")
if $sl="1" Then
welcome()
ElseIf $sl="2" Then
chao()
Else
language()

EndIf