#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

SetCoordinates(num)
{
	MouseGetPos, xpos, ypos
	IniWrite, %xpos%, settings.ini, Coordinaten, %num%a
	IniWrite, %ypos%, settings.ini, Coordinaten, %num%b
	return
}

SetClicks(byref 1a, byref 1b, byref 2a, byref 2b, byref 3a, byref 3b)
{
	
	IniRead, 1a, settings.ini, Coordinaten, 1a
	IniRead, 2a, settings.ini, Coordinaten, 2a
	IniRead, 3a, settings.ini, Coordinaten, 3a
	IniRead, 1b, settings.ini, Coordinaten, 1b
	IniRead, 2b, settings.ini, Coordinaten, 2b
	IniRead, 3b, settings.ini, Coordinaten, 3b
	return
}



#IfWinActive ahk_exe clarify.exe  ;  hotkeys werken enkel in clarify



^!+c::
;MsgBox Voor de configuratie klik je na OK close case aan hierna klik je op de dropdown bij problem type en uiteidelijk de dropdown by solved by
Gui, Add, Text,, Er word nu een configuratie aangemaakt
Gui, Add, Text,, Na op OK te klikken voer je volgende stappen uit:
Gui, Add, Text,, 1.Klik op de knop Close Case
Gui, Add, Text,, 2.Klik in het dropdown menu achter Problem Type
Gui, Add, Text,, 3.Klik in het dropdown menu achter Solved By
Gui, Add, Button,gClose,OK
WinGetPos, X, Y, W, H, A  ; "A" to get the active window's pos.
Gui, Show, x%X% y%Y% w%W% h%H%
return


; muis 2 (forward) of F2 voor case t&i
xButton2::
F2::
SetClicks(Click1a, Click1b, Click2a, Click2b, Click3a, Click3b)
Click, %Click1a% %Click1b%
Click, %Click2a% %Click2b%
Send, {Home}
Send, {tab}
Send, t
Send, {tab}
Send, j
Click, %Click3a% %Click3b%
Send, {End}
Send, {Enter}
return

; muis 1 (back) of F3 voor case idtv
XButton1::
F3::
SetClicks(Click1a, Click1b, Click2a, Click2b, Click3a, Click3b)
Click, %Click1a% %Click1b%
Click, %Click2a% %Click2b%
Send, {Home}
Send, {tab}
Send, i
Send, {tab}
Send, j
Click, %Click3a% %Click3b%
Send, {End}
Send, {Enter}
return

; muiswiel en F voor case admin(billing)
MButton::
F4::
SetClicks(Click1a, Click1b, Click2a, Click2b, Click3a, Click3b)
Click, %Click1a% %Click1b%
Click, %Click2a% %Click2b%
Send, {Home}
Send, {tab}
Send, a
Send, {tab}
Send, j
Click, %Click3a% %Click3b%
Send, {End}
Send, {Enter}
return
return

; case id naar klembord
F7::
Send, ^+y
Send, {tab}
Send, {tab}
Send, ^c
Send, {tab}
Send, {tab}
Send, {tab}
Send, {Enter}
return

Close:
{
Gui, Destroy
KeyWait, LButton, D
SetCoordinates(1)
KeyWait, LButton
KeyWait, LButton, D
SetCoordinates(2)
KeyWait, LButton
KeyWait, LButton, D
SetCoordinates(3)
MsgBox ,,,De instellingen zijn bewaard.,3
return
}