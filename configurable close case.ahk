#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetCoordinates(num)
{
MouseGetPos, xpos, ypos
IniWrite, %xpos%, settings.ini, Coordinaten, %num%a
IniWrite, %xpos%, settings.ini, Coordinaten, %num%b
return
}

#IfWinActive ahk_exe clarify.exe  ;  hotkeys werken enkel in clarify



^!+c::
MsgBox Voor de configuratie klik je na OK close case aan hierna klik je op de dropdown bij problem type en uiteidelijk de dropdown by solved by
KeyWait, LButton, D
SetCoordinates(1)
KeyWait, LButton, D
SetCoordinates(2)
KeyWait, LButton, D
SetCoordinates(3)
return


; muis 2 (forward) of pijltje links voor case t&i
xButton2::
Left::
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

; muis 1 (back) of pijltje rechts voor case idtv
XButton1::
Right::
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

; muiswiel en pijltj omhoog(of omlaag) voor case admin(billing)
MButton::
Up::
Down::
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
