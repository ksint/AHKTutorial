;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Kyaw Sint's AutoHotkey
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Hotkeys for AutoHotkey
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
^F11::Suspend
^F12::Reload

capfntoggle = 0
^F10::capfntoggle:=!capfntoggle

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
dataset_name := "d1"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Add tray menu to change dataset name
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Menu, Tray, Add  ; Creates a separator line.
Menu, Tray, Add, Change dataset, ChangeDataset
Return

ChangeDataset:
  InputBox dataset_name, Dataset name, Enter the dataset name, , , , , , , , %dataset_name%
Return

!F11::InputBox dataset_name, Dataset name, Enter the dataset name, , , , , , , , %dataset_name%

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Remap Print Screen to Menu key for Thinkpad keyboards
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PrintScreen::Send {AppsKey}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Search Box Drive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
!F12::^+!b

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Mac-like hotkeys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;!LButton::MButton

!z::Send ^z
!x::Send ^x
!c::Send ^c
!v::Send ^v

#IfWinNotActive, ahk_exe Zoom.exe
!a::Send ^a
#IfWinNotActive

!s::Send ^s

!f::Send ^f
!+f::Send ^+f
!h::Send ^h
!+z::Send ^y

!t::Send ^t
!+t::Send ^+t
!l::Send ^l
!w::Send ^w

!n::Send ^n
; !q::Send !{f4}
!r::Send ^{f5}
!m::Send {LWin Down}{Down}{LWin Up}
!`::Send {Alt Down}{Shift Down}{Tab}{Shift Up}

!b::Send ^b
!i::Send ^i
!u::Send ^u
!\::Send ^\

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SAS hotkeys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!7::
	sasruler = 
(
*******************************************************************************;
)
	SendInput, %sasruler%{Enter}
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!8::
	sasheading = 
(
*******************************************************************************;
title ;
*******************************************************************************;
)
	SendInput, %sasheading%{Up}{End}{Left}
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!9:: SendInput, {Down}{End}{Enter}
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:*:frf::
	tosend =
(
proc freq data=%dataset_name%;
tables ;
run;
)
	SendInput, %tosend%{Up}{End}{Left}
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:*:f2f::
	tosend =
(
proc freq data=%dataset_name%;
tables  / nocol norow nopercent chisq;
run;
)
	SendInput, %tosend%{Up}{End}{Left 27}
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:*:mef::
	tosend =
(
proc means data=%dataset_name% n mean stddev stderr median p25 p75 min max maxdec=3;
var ;
run;
)
	SendInput, %tosend%{Up}{End}{Left}
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


:*:sortf::
	tosend =
(
proc sort data=%dataset_name%;
by ;
run;
)
	SendInput, %tosend%{Up}{End}{Left}
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


:*:univf::
	tosend =
(
proc univariate data=%dataset_name%;
var ;
run;
)
	SendInput, %tosend%{Up}{End}{Left}
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:*:contf::
	tosend =
(
proc contents data=%dataset_name% order=varnum; run;
)
	SendInput, %tosend%{Left 19}
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:*:logitf::
	tosend =
(
proc logistic data=%dataset_name% descending;
class / param=ref;
model = ;
run;
)
	SendInput, %tosend%{Up}{End}{Left}
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:*:vboxf::
	tosend =
(
proc sort data=%dataset_name%; by Group; run;
proc boxplot data=%dataset_name%;
plot Var*Group;
title "helllo";
inset min mean max stddev / header='Overall Statistics' pos=tm;
insetGroup min max / header='Extremes by Group';
run;
)
	SendInput, %tosend%{Up}{End}{Left}
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:*:hboxf::
	tosend =
(
proc sort data=%dataset_name%; by Group; run;
proc boxplot data=Times;
plot Var*Group / boxstyle=schematic horizontal;
run;
)
	SendInput, %tosend%{Up}{End}{Left}
Return
