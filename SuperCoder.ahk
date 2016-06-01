; 1. 初始化操作
; 1.1 显示语言信息
Capslock & 0::
#NoEnv
SendMode Input
CustomColor = EEAA99
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow +E0x20
Gui, Color, %CustomColor%
Gui, Font, s28
Gui, Add, Text, vMyText1 cLime,　　　　　　
WinSet, TransColor, %CustomColor% 150
Gosub, LockOn
SetTimer, LockOn, 300
Gui, Show
hwnd := WinExist()
return

LockOn:
input_num := GetInputNum()
If input_num <> 67699721
GuiControl,, MyText1, ZH-CN
Else GuiControl,, MyText1, EN-US
Sleep 500
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1.2 脚本相关的热键
; 1.2.1 reload              
RControl & r:: Reload
; 1.2.2 edit
RControl & e:: 
Run, C:\Program Files\Sublime Text 3x64\sublime_text.exe C:\Users\JiaMingSheng\Documents\SuperCoder0402.ahk
return
; 1.2.3 suspend
RControl & s:: Suspend
; 1.2.4 help
RControl & h:: Run C:\Program Files\AutoHotkey\AutoHotkey_CN.chm
; 1.2.5 window spy
RControl & w:: Run C:\Program Files\AutoHotkey\AU3_Spy.exe
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1.3 初始化 Capslock 键
;     单击 Capslock 键模拟 Esc 键 (中英文状态下都有效)
;     双击 Capslock 键打开 AppsKey 键
$Capslock::
SetCapsLockState, AlwaysOff
if caps_presses > 0 
{
    caps_presses += 1
    return
}
caps_presses = 1
SetTimer, KeyCaps, 250
return

KeyCaps:
SetTimer, KeyCaps, Off
if caps_presses = 1
{
	input_num := GetInputNum()
	if (input_num <> 67699721) 
    {
        Send, #{Space}{Esc}
    }
    else
    {
        Send, {Esc}
    }
}
else if caps_presses = 2
{
	Send, {AppsKey}
}
caps_presses = 0  
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1.4 初始化 Tab 键
;     单击键入 Tab 键
;     双击模拟 Windows + Tab 键
$Tab::
if tab_presses > 0
{
    tab_presses += 1
    return
}
tab_presses = 1
SetTimer, KeyTab, 250
return
KeyTab:
SetTimer, KeyTab, Off
if tab_presses = 1
{
    Send, {Tab}
}
else if tab_presses = 2
{
	Send, #{Tab}
}
else if tab_presses = 3
{
    ;
}
tab_presses = 0
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1.5 初始化其它键
; 1.5.1 初始化 Space 键
$Space:: Send, {Space}
; 1.5.2 初始化 LAlt 实现中英文切换 
$LAlt:: Send, #{Space}
; 1.5.3 初始化 ' 键
$':: Send, {'}
; 1.5.4 初始化 LShift 键为 BackSpace 键
$LShift::
Run, C:\candy\Candy.exe
return
; 1.5.5 初始化 ESC 键为 Windows 键
Esc:: LWin
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1.6 预定义函数
; 1.6.1 返回当前的语言
GetInputNum()
{
	SetCapsLockState, AlwaysOff
	return DllCall("GetKeyboardLayout","UINT",DllCall("GetWindowThreadProcessId","UINT",WinActive("A"),"UINTP",0),UInt)
}
; 1.6.2 若当前语言是中文, 则将其转化为英文
TransformLanguage()
{
	input_num := GetInputNum()
    if (input_num <> 67699721) 
    {        
        Send, #{Space} 
    }
}
; 1.6.3 Function to run a program or activate an already running instance
RunOrActivateProgram(Program, WorkingDir="", WindowSize="") 	
{ 
    SplitPath Program, ExeFile 
    Process, Exist, %ExeFile% 
    PID = %ErrorLevel% 
    if (PID = 0) 
    { 
    	Run, %Program%, %WorkingDir%, %WindowSize% 
    }
    else
    { 
    	WinActivate, ahk_pid %PID% 
    } 
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 2. "Space + 字母 (单击)" 模拟输入符号和数字
Space & `:: Send, {~}       ; ~
Space & q:: Send, 7       	; 5
Space & w:: Send, {`#}      ; well (井号键)
Space & e:: Send, {=}       ; equal
Space & r:: Send, 2 		; 2
Space & t:: Send, 3         ; 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Space & a:: Send, {&}       ; and
Space & s:: Send, 6       	; 6
Space & d:: Send, {$}       ; $
Space & f:: Send, 4         ; 4
Space & g:: Send, 9         ; 9
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Space & z:: Send, 0         ; Zero
Space & x::                 ; 单击输入 x (乘号); 双击输入 ^ (乘方)
if space_x_presses > 0 
{
	space_x_presses += 1
	return
}
space_x_presses = 1
SetTimer, KeySpaceX, 250
return

KeySpaceX:
SetTimer, KeySpaceX, Off
if space_x_presses = 1 
{
	Send, {*}
} 
else if space_x_presses = 2 
{
	Send, {^}
} 
else if space_x_presses = 3
{
	;
}
space_x_presses = 0
return

Space & c:: Send, @         ; @
Space & v:: Send, 5         ; 5
Space & b:: Send, 8     	; 8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Space & y:: Send, 1         ; yi
Space & u:: Send, {_}       ; underline
Space & i:: Send, {\}       ; i 象形 \
Space & o:: Send, {|}       ; or
Space & p:: Send, {+}       ; plus
/*
Space & [::                 ; 单击输入"["; 三击输入"]"
if space_bracket_presses > 0 
{
	space_bracket_presses += 1
	return
}
space_bracket_presses = 1
SetTimer, KeySpaceBracket, 400
return

KeySpaceBracket:
SetTimer, KeySpaceBracket, Off
if space_bracket_presses = 1 
{
	Send, {[}
} 
else if space_bracket_presses = 2 
{
	;
} 
else if space_bracket_presses = 3
{
	Send, {]}
}
space_bracket_presses = 0
return
*/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Space & h:: Send, {-}       ; hyphen
Space & j::    				; 单击输入 "("; 三击输入 ")"
if space_j_presses > 0 
{
	space_j_presses += 1
	return
}
space_j_presses = 1
SetTimer, KeySpaceJ, 400
return

KeySpaceJ:
SetTimer, KeySpaceJ, Off
if space_j_presses = 1 
{
	Send, {(}
} 
else if space_j_presses = 2 
{
	Send, {)}
} 
else if space_j_presses = 3
{
	
	;
}
space_j_presses = 0
return

Space & k:: 				; 单击输入 "{"; 三击输入 "}"
if space_k_presses > 0 
{
	space_k_presses += 1
	return
}
space_k_presses = 1
SetTimer, KeySpaceK, 400
return

KeySpaceK:
SetTimer, KeySpaceK, Off
if space_k_presses = 1 
{
	Send, {{}
} 
else if space_k_presses = 2 
{
	Send, {}}
} 
else if space_k_presses = 3
{
	
}
space_k_presses = 0
return

Space & l::					; 单击输入 "["; 三击输入 "]"
if space_l_presses > 0 
{
	space_l_presses += 1
	return
}
space_l_presses = 1
SetTimer, KeySpaceL, 400
return

KeySpaceL:
SetTimer, KeySpaceL, Off
if space_l_presses = 1 
{
	Send, {[}
} 
else if space_l_presses = 2 
{
	Send, {]}
} 
else if space_l_presses > 2
{
	
}
space_l_presses = 0
return

Space & `;:: Send, {:}      ; :
Space & ':: Send, {"}       ; "
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Space & n:: Send, {!}       ; not
Space & m:: Send, {`%}      ; mod
Space & ,:: Send, {<}       ; <
Space & .:: Send, {>}       ; >
Space & /:: Send, {?}       ; ?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/*
Space & Enter::				
if space_enter_presses > 0 
{
	space_enter_presses += 1
	return
}
space_enter_presses = 1
SetTimer, KeySpaceEnter, 250
return

KeySpaceEnter:
SetTimer, KeySpaceEnter, Off
if space_enter_presses = 1 
{
	
} 
else if space_enter_presses = 2 
{
	
} 
else if space_enter_presses > 2
{
	
}
space_enter_presses = 0
return
*/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 3. "LAlt + 字母 (单击)" 模拟功能键
; 3.1 模拟 F1 ~ F12
/*
; 单击输入 F1; 双击输入 Alt + F1; 三击输入 Ctrl + F1
MButton & y::
if mbutton_y_presses > 0 
{
	mbutton_y_presses += 1
	return
}
mbutton_y_presses = 1
SetTimer, KeyMButtonY, 300
return

KeyMButtonY:
SetTimer, KeyMButtonY, Off
if mbutton_y_presses = 1 
{
	Send, {F1}
} 
else if mbutton_y_presses = 2 
{
	Send, !{F1}
} 
else if mbutton_y_presses = 3
{
	Send, ^{F1}
}
mbutton_y_presses = 0
return

; 单击输入 F2; 双击输入 Alt + F2; 三击输入 Ctrl + F2
MButton & r::
if mbutton_r_presses > 0 
{
	mbutton_r_presses += 1
	return
}
mbutton_r_presses = 1
SetTimer, KeyMButtonR, 300
return

KeyMButtonR:
SetTimer, KeyMButtonR, Off
if mbutton_r_presses = 1 
{
	Send, {F2}
} 
else if mbutton_r_presses = 2 
{
	Send, !{F2}
} 
else if mbutton_r_presses = 3
{
	Send, ^{F2}
}
mbutton_r_presses = 0
return

; 单击输入 F3; 双击输入 Alt + F3; 三击输入 Ctrl + F3
MButton & t::
if mbutton_t_presses > 0 
{
	mbutton_t_presses += 1
	return
}
mbutton_t_presses = 1
SetTimer, KeyMButtonT, 300
return

KeyMButtonT:
SetTimer, KeyMButtonT, Off
if mbutton_t_presses = 1 
{
	Send, {F3}
} 
else if mbutton_t_presses = 2 
{
	Send, !{F3}
} 
else if mbutton_t_presses = 3
{
	Send, ^{F3}
}
mbutton_t_presses = 0
return
*/

/*
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 3.2 模拟 Alt + F1 ~ F12
LAlt & a::
is_lalt_a := 1
ToolTip, 
(LTrim Join
	y ---> Alt + F1`n
	r ---> Alt + F2`n
	t ---> Alt + F3`n
	f ---> Alt + F4`n
	v ---> Alt + F5`n
	s ---> Alt + F6`n
	q ---> Alt + F7`n
	b ---> Alt + F8`n
	g ---> Alt + F9`n
	z ---> Alt + F10`n
	h ---> Alt + F11`n
	j ---> Alt + F12
)
SetTimer, RemoveLAltAToolTip, 5000
return

RemoveLAltAToolTip:
SetTimer, RemoveLAltAToolTip, Off
is_lalt_a := 0
ToolTip
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 3.3 模拟 CTrl + F1 ~ F12
LAlt & c::
is_lalt_c := 1
ToolTip, 
(LTrim Join
	y ---> Ctrl + F1`n
	r ---> Ctrl + F2`n
	t ---> Ctrl + F3`n
	f ---> Ctrl + F4`n
	v ---> Ctrl + F5`n
	s ---> Ctrl + F6`n
	q ---> Ctrl + F7`n
	b ---> Ctrl + F8`n
	g ---> Ctrl + F9`n
	z ---> Ctrl + F10`n
	h ---> Ctrl + F11`n
	j ---> Ctrl + F12
)
SetTimer, RemoveLAltCToolTip, 5000
return

RemoveLAltCToolTip:
SetTimer, RemoveLAltCToolTip, Off
is_lalt_c := 0
ToolTip
return
*/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 3.4 模拟 Alt + 方向键
LAlt & h:: Send, !{Left}
LAlt & l:: Send, !{Right}
LAlt & j:: Send, !{Down}
LAlt & k:: Send, !{Up}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 3.5 模拟 Shift + 方向键
LAlt & i:: Send, +{Home}
LAlt & o:: Send, +{End}
LAlt & u:: Send, +{Pgup}
LAlt & p:: Send, +{PgDn}
LAlt & m:: Send, +{Left}
LAlt & /:: Send, +{Right}
LAlt & ,:: Send, +{Down}
LAlt & .:: Send, +{Up}
LAlt & n::     				; 选择整句
Send, {Home}
Send, +{End}
return
; 3.6 兼容 potplayer 全局快捷键 (需要在 potplayer 里设置)
~LAlt & Space:: Send, ^!+{Space}  ; 暂停
~Shift & Space:: Send, ^+{Space}  ; 后退
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 4. "Tab + 字母 (双击或三击)" 模拟 Windows + 字母键 或 打开应用程序
; 4.1 "Tab + q, w, e, r, t" 模拟 Windows + 字母键 或 打开应用程序
; 4.1.1 单击模拟 "Windows + Ctrl + 7" (打开桌面，并切换到固定到任务栏的位于该数字所表示位置的应用的最后一个活动窗口)
;       双击模拟 "Windows + Alt + 7" (固定到任务栏的位于该数字所表示位置的应用的跳转列表)
;       三击模拟 "Windows + Ctrl + Shift + 7" (打开桌面，并以管理员身份打开位于任务栏上给定位置的应用的新实例)
Tab & q::
if tab_q_presses > 0 
{
	tab_q_presses += 1
	return
}
tab_q_presses = 1
SetTimer, KeyTabQ, 400
return

KeyTabQ:
SetTimer, KeyTabQ, Off
if tab_q_presses = 1 
{
	Send, #^7
} 
else if tab_q_presses = 2 
{
	Send, #!7
} 
else if tab_q_presses = 3
{
	Send, #^+7
}
tab_q_presses = 0
return
; 4.1.2 设置 Windows 系统内置的按键
Tab & w::
is_tab_w := 1
ToolTip, 
(LTrim Join
	q ---> 打开 cortana`n
	t ---> 打开任务管理器`n
	s ---> 打开系统信息`n
	b ---> 将焦点定位到通知区域`n
	p ---> 打开投影
)
SetTimer, RemoveTabWToolTip, 5000
return

RemoveTabWToolTip:
SetTimer, RemoveTabWToolTip, Off
is_tab_w := 0
ToolTip
return
; 4.1.3 单击打开资源管理器
Tab & e::
TransformLanguage()
if tab_e_presses > 0 
{
	tab_e_presses += 1
	return
}
tab_e_presses = 1
SetTimer, KeyTabE, 250
return

KeyTabE:
SetTimer, KeyTabE, Off
if tab_e_presses = 1 
{
	Send, #e
} 
else if tab_e_presses = 2 
{
} 
else if tab_e_presses = 3
{
	;
}
tab_e_presses = 0
return
; 4.1.4 单击模拟 "Windows + Ctrl + 2" (打开桌面，并切换到固定到任务栏的位于该数字所表示位置的应用的最后一个活动窗口)
;       双击模拟 "Windows + Alt + 2" (固定到任务栏的位于该数字所表示位置的应用的跳转列表)
;       三击模拟 "Windows + Ctrl + Shift + 2" (打开桌面，并以管理员身份打开位于任务栏上给定位置的应用的新实例)
Tab & r::
TransformLanguage()
if tab_r_presses > 0 
{
	tab_r_presses += 1
	return
}
tab_r_presses = 1
SetTimer, KeyTabR, 400
return

KeyTabR:
SetTimer, KeyTabR, Off
if tab_r_presses = 1 
{
	Send, #^2
} 
else if tab_r_presses = 2 
{
	Send, #!2
} 
else if tab_r_presses = 3
{
	Send, #^+2
}
tab_r_presses = 0
return
; 4.1.5 单击模拟 "Windows + Ctrl + 3" (打开桌面，并切换到固定到任务栏的位于该数字所表示位置的应用的最后一个活动窗口)
;       双击模拟 "Windows + Alt + 3" (固定到任务栏的位于该数字所表示位置的应用的跳转列表)
;       三击模拟 "Windows + Ctrl + Shift + 3" (打开桌面，并以管理员身份打开位于任务栏上给定位置的应用的新实例)
Tab & t::
TransformLanguage()
if tab_t_presses > 0 
{
	tab_t_presses += 1
	return
}
tab_t_presses = 1
SetTimer, KeyTabT, 400
return

KeyTabT:
SetTimer, KeyTabT, Off
if tab_t_presses = 1 
{
	Send, #^3
} 
else if tab_t_presses = 2 
{
	Send, #!3
} 
else if tab_t_presses = 3
{
	Send, #^+3
}
tab_t_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 4.2 "Tab + a, s, d, f, g" 模拟 Windows + 字母键 或 打开应用程序
; 4.2.1 单击打开操作中心
Tab & a::
TransformLanguage()
if tab_a_presses > 0 
{
	tab_a_presses += 1
	return
}
tab_a_presses = 1
SetTimer, KeyTabA, 250
return

KeyTabA:
SetTimer, KeyTabA, Off
if tab_a_presses = 1 
{
	Send, #a
} 
else if tab_a_presses = 2 
{
	;
} 
else if tab_a_presses = 3
{
	;
}
tab_a_presses = 0
return
; 4.2.2 单击模拟 "Windows + Ctrl + 6" (打开桌面，并切换到固定到任务栏的位于该数字所表示位置的应用的最后一个活动窗口)
;       双击模拟 "Windows + Alt + 6" (固定到任务栏的位于该数字所表示位置的应用的跳转列表)
;       三击模拟 "Windows + Ctrl + Shift + 6" (打开桌面，并以管理员身份打开位于任务栏上给定位置的应用的新实例)
Tab & s::
TransformLanguage()
if tab_s_presses > 0 
{
	tab_s_presses += 1
	return
}
tab_s_presses = 1
SetTimer, KeyTabS, 400
return

KeyTabS:
SetTimer, KeyTabS, Off
if tab_s_presses = 1 
{
	Send, #^6
} 
else if tab_s_presses = 2 
{
	Send, #!6
} 
else if tab_s_presses = 3
{
	Send, #^+6
}
tab_s_presses = 0
return
; 4.2.3 单击显示桌面
Tab & d::
TransformLanguage()
if tab_d_presses > 0 
{
	tab_d_presses += 1
	return
}
tab_d_presses = 1
SetTimer, KeyTabD, 250
return

KeyTabD:
SetTimer, KeyTabD, Off
if tab_d_presses = 1 
{
	Send, #d
} 
else if tab_d_presses = 2 
{
	Run C:\Users\JiaMingSheng\Downloads
	WinMaximize, A
} 
else if tab_d_presses = 3
{
	;
}
tab_d_presses = 0
return
; 4.2.4 单击模拟 "Windows + Ctrl + 4" (打开桌面，并切换到固定到任务栏的位于该数字所表示位置的应用的最后一个活动窗口)
;       双击模拟 "Windows + Alt + 4" (固定到任务栏的位于该数字所表示位置的应用的跳转列表)
;       三击模拟 "Windows + Ctrl + Shift + 4" (打开桌面，并以管理员身份打开位于任务栏上给定位置的应用的新实例)
Tab & f::
if tab_f_presses > 0 
{
	tab_f_presses += 1
	return
}
tab_f_presses = 1
SetTimer, KeyTabF, 400
return

KeyTabF:
SetTimer, KeyTabF, Off
if tab_f_presses = 1 
{
	Send, #^4
} 
else if tab_f_presses = 2 
{
	Send, #!4
} 
else if tab_f_presses = 3
{
	Send, #^+4
}
tab_f_presses = 0
return
; 4.2.5 单击模拟 "Windows + Ctrl + 9" (打开桌面，并切换到固定到任务栏的位于该数字所表示位置的应用的最后一个活动窗口)
;       双击模拟 "Windows + Alt + 9" (固定到任务栏的位于该数字所表示位置的应用的跳转列表)
;       三击模拟 "Windows + Ctrl + Shift + 9" (打开桌面，并以管理员身份打开位于任务栏上给定位置的应用的新实例)
Tab & g::
if tab_g_presses > 0 
{
	tab_g_presses += 1
	return
}
tab_g_presses = 1
SetTimer, KeyTabG, 250
return

KeyTabG:
SetTimer, KeyTabG, Off
if tab_g_presses = 1 
{
	Send, #^9
}
else if tab_g_presses = 2 
{
	Send, #!9
} 
else if tab_g_presses = 3
{
	Send, #^+9
}
tab_g_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 4.3 "Tab + z, x, c, v, b" 模拟 Windows + 字母键 或 打开应用程序
; 4.3.1 单击模拟 "Windows + Ctrl + 0" (打开桌面，并切换到固定到任务栏的位于该数字所表示位置的应用的最后一个活动窗口)
;       双击模拟 "Windows + Alt + 0" (固定到任务栏的位于该数字所表示位置的应用的跳转列表)
;       三击模拟 "Windows + Ctrl + Shift + 0" (打开桌面，并以管理员身份打开位于任务栏上给定位置的应用的新实例)
Tab & z::
if tab_z_presses > 0 
{
	tab_z_presses += 1
	return
}
tab_z_presses = 1
SetTimer, KeyTabZ, 400
return

KeyTabZ:
SetTimer, KeyTabZ, Off
if tab_z_presses = 1 
{
	Send, #^0
} 
else if tab_z_presses = 2 
{
	Send, #!0
} 
else if tab_z_presses = 3
{
	Send, #^+0
}
tab_z_presses = 0
return
; 4.3.2 单击打开 “快速链接” 菜单
Tab & x::
TransformLanguage()
if tab_x_presses > 0 
{
	tab_x_presses += 1
	return
}
tab_x_presses = 1
SetTimer, KeyTabX, 250
return

KeyTabX:
SetTimer, KeyTabX, Off
if tab_x_presses = 1 
{
	Send, #x
} 
else if tab_x_presses = 2 
{
	
} 
else if tab_x_presses = 3
{
	;
}
tab_x_presses = 0
return
; 4.3.3 单击打开 CMD; 双击打开 Chrome; 三击打开控制面板
Tab & c::
TransformLanguage()
if tab_c_presses > 0 
{
	tab_c_presses += 1
	return
}
tab_c_presses = 1
SetTimer, KeyTabC, 450
return

KeyTabC:
SetTimer, KeyTabC, Off
if tab_c_presses = 1 
{
	Run Cmd
} 
else if tab_c_presses = 2 
{
	DetectHiddenWindows, On
	SetTitleMatchMode, 2
	WinGet, winid, ID, Google Chrome
	;MsgBox,%winid%
	SetTitleMatchMode, 1
	If (winid) 
	{
		WinWait, ahk_id %winid%
		WinShow
		WinActivate
		ControlFocus, EditComponent2, A
		ControlSetText, EditComponent2,, A
	}
	else
	{
		RunOrActivateProgram("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --enable-benchmarking")
	}
	DetectHiddenWindows, Off
} 
else if tab_c_presses = 3
{
	Run Control
}
tab_c_presses = 0
return
; 4.3.4 单击模拟 "Windows + Ctrl + 5" (打开桌面，并切换到固定到任务栏的位于该数字所表示位置的应用的最后一个活动窗口)
;       双击模拟 "Windows + Alt + 5" (固定到任务栏的位于该数字所表示位置的应用的跳转列表)
;       三击模拟 "Windows + Ctrl + Shift + 5" (打开桌面，并以管理员身份打开位于任务栏上给定位置的应用的新实例)
Tab & v::
if tab_v_presses > 0 
{
	tab_v_presses += 1
	return
}
tab_v_presses = 1
SetTimer, KeyTabV, 400
return

KeyTabV:
SetTimer, KeyTabV, Off
if tab_v_presses = 1 
{
	Send, #^5
} 
else if tab_v_presses = 2 
{
	Send, #!5
} 
else if tab_v_presses = 3
{
	Send, #^+5
}
tab_v_presses = 0
return
; 4.3.5 单击模拟 "Windows + Ctrl + 8" (打开桌面，并切换到固定到任务栏的位于该数字所表示位置的应用的最后一个活动窗口)
;       双击模拟 "Windows + Alt + 8" (固定到任务栏的位于该数字所表示位置的应用的跳转列表)
;       三击模拟 "Windows + Ctrl + Shift + 8" (打开桌面，并以管理员身份打开位于任务栏上给定位置的应用的新实例)
Tab & b::
TransformLanguage()
if tab_b_presses > 0 
{
	tab_b_presses += 1
	return
}
tab_b_presses = 1
SetTimer, KeyTabB, 400
return

KeyTabB:
SetTimer, KeyTabB, Off
if tab_b_presses = 1 
{
	Send, #^8
} 
else if tab_b_presses = 2 
{
	Send, #^8
} 
else if tab_b_presses = 3
{
	Send, #^+8
}
tab_b_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 4.4 "Tab + y, u, i, o, p" 模拟 Windows + 字母键 或 打开应用程序
; 4.4.1 单击模拟 "Windows + Ctrl + 1" (打开桌面，并切换到固定到任务栏的位于该数字所表示位置的应用的最后一个活动窗口)
;       双击模拟 "Windows + Alt + 1" (固定到任务栏的位于该数字所表示位置的应用的跳转列表)
;       三击模拟 "Windows + Ctrl + Shift + 1" (打开桌面，并以管理员身份打开位于任务栏上给定位置的应用的新实例)
Tab & y::
if tab_y_presses > 0 
{
	tab_y_presses += 1
	return
}
tab_y_presses = 1
SetTimer, KeyTabY, 400
return

KeyTabY:
SetTimer, KeyTabY, Off
if tab_y_presses = 1 
{
	Send, #^1
} 
else if tab_y_presses = 2 
{
	Send, #!1
} 
else if tab_y_presses = 3
{
	Send, #^+1
}
tab_y_presses = 0
return
; 4.4.2
Tab & u::
if tab_u_presses > 0 
{
	tab_u_presses += 1
	return
}
tab_u_presses = 1
SetTimer, KeyTabU, 250
return

KeyTabU:
SetTimer, KeyTabU, Off
if tab_u_presses = 1 
{
	
} 
else if tab_u_presses = 2 
{
	;
} 
else if tab_u_presses = 3
{
	;
}
tab_u_presses = 0
return
; 4.4.3 单击打开 “设置”; 双击模拟 Windows + Home 键
Tab & i::
if tab_i_presses > 0 
{
	tab_i_presses += 1
	return
}
tab_i_presses = 1
SetTimer, KeyTabI, 250
return

KeyTabI:
SetTimer, KeyTabI, Off
if tab_i_presses = 1 
{
	Send, #i
} 
else if tab_i_presses = 2 
{
	Send, #{Home}
} 
else if tab_i_presses = 3
{
	;
}
tab_i_presses = 0
return
; 4.4.4 打开文件或文件夹
Tab & o::
is_tab_o := 1
ToolTip, 
(LTrim Join
	d ---> 打开 downloads 文件夹
	s ---> 打开 source 文件夹
	r ---> 打开 reference 文件夹
	d ---> 打开 dtd 文件夹
	w ---> 打开 workspace 文件夹
)
SetTimer, RemoveTabOToolTip, 5000
return

RemoveTabOToolTip:
SetTimer, RemoveTabOToolTip, Off
is_tab_o := 0
ToolTip
return
; 4.4.5 单击用管理员模式启动 PowerShell, 双击打开投影
Tab & p::
TransformLanguage()
if tab_p_presses > 0 
{
	tab_p_presses += 1
	return
}
tab_p_presses = 1
SetTimer, KeyTabP, 250
return

KeyTabP:
SetTimer, KeyTabP, Off
if tab_p_presses = 1 
{
	Send, #xa
} 
else if tab_p_presses = 2 
{
	Send, #p
} 
else if tab_p_presses = 3
{
	;
}
tab_p_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 4.5 "Tab + h, j, k, l, semicolon, quote" 模拟 Windows + 字母键 或 打开应用程序
; 4.5.1 单击模拟 Windows + Left; 双击模拟 Windows + Shift + Left
Tab & h::
if tab_h_presses > 0 
{
	tab_h_presses += 1
	return
}
tab_h_presses = 1
SetTimer, KeyTabH, 250
return

KeyTabH:
SetTimer, KeyTabH, Off
if tab_h_presses = 1 
{
	Send, #{Left}
} 
else if tab_h_presses = 2 
{
	Send, #+{Left}
} 
else if tab_h_presses = 3
{
	
}
tab_h_presses = 0
return
; 4.5.2 单击模拟 Windows + Right; 双击模拟 Windows + Shift + Right; 三击打开 lib
Tab & l::
if tab_l_presses > 0 
{
	tab_l_presses += 1
	return
}
tab_l_presses = 1
SetTimer, KeyTabL, 400
return

KeyTabL:
SetTimer, KeyTabL, Off
if tab_l_presses = 1 
{
	Send, #{Right}
} 
else if tab_l_presses = 2 
{
	Send, #+{Right}
} 
else if tab_l_presses = 3
{
	Run C:\Users\JiaMingSheng\Documents\me\lib
}
tab_l_presses = 0
return
; 4.5.3 单击模拟 Windows + Down
Tab & j::
if tab_j_presses > 0 
{
	tab_j_presses += 1
	return
}
tab_j_presses = 1
SetTimer, KeyTabJ, 300
return

KeyTabJ:
SetTimer, KeyTabJ, Off
if tab_j_presses = 1 
{
	Send, #{Down}
} 
else if tab_j_presses = 2 
{
	
} 
else if tab_j_presses = 3
{
	;
}
tab_j_presses = 0
return
; 4.5.4 单击模拟 Windows + Up
Tab & k::
if tab_k_presses > 0 
{
	tab_k_presses += 1
	return
}
tab_k_presses = 1
SetTimer, KeyTabK, 300
return

KeyTabK:
SetTimer, KeyTabK, Off
if tab_k_presses = 1 
{
	Send, #{Up}
} 
else if tab_k_presses = 2 
{
	
} 
else if tab_k_presses = 3
{
	;
}
tab_k_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 4.6 "Tab + n, m, comma, full stop, slash" 模拟 Windows + 字母键 或 打开应用程序
; 4.6.1 单击创建记事本新实例
Tab & n::
if tab_n_presses > 0 
{
	tab_n_presses += 1
	return
}
tab_n_presses = 1
SetTimer, KeyTabN, 250
return

KeyTabN:
SetTimer, KeyTabN, Off
if tab_n_presses = 1 
{
	Run notepad
} 
else if tab_n_presses = 2 
{
	;
} 
else if tab_n_presses = 3
{
	;
}
tab_n_presses = 0
return
; 4.6.2 单击最小化所有窗口; 双击打开远程桌面连接
Tab & m::
TransformLanguage()
if tab_m_presses > 0 
{
	tab_m_presses += 1
	return
}
tab_m_presses = 1
SetTimer, KeyTabM, 250
return

KeyTabM:
SetTimer, KeyTabM, Off
if tab_m_presses = 1 
{
	Send, #m
} 
else if tab_m_presses = 2 
{
	Run mstsc             
} 
else if tab_m_presses = 3
{
	;
}
tab_m_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 5. "Capslock + 字母 (单击, 双击, 三击)" 模拟对所有窗口程序都适用的公用热键
; 5.1 "Capslock + q, w, e, r, t (单击, 双击, 三击)" 模拟公用功能键
; 5.1.1 截图 (需要在 PicPick 里设置相应的快捷键)
Capslock & q:: 
TransformLanguage()
SetCapsLockState, AlwaysOff
Send, ^!+x
return
; 5.1.2 关闭
Capslock & w:: 
SetCapsLockState, AlwaysOff
Send, ^w
return
; 5.1.3 Toggle Everything
Capslock & e:: 
SetCapsLockState, AlwaysOff
Send, #!e
return
; 5.1.4 打开运行窗口
Capslock & r:: 
SetCapsLockState, AlwaysOff
TransformLanguage()
Send, #r
return
; 5.1.5 替换
Capslock & t:: 
SetCapsLockState, AlwaysOff
Send, ^h
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 5.2 "Capslock + a, s, d, f, g (单击, 双击, 三击)" 模拟公用功能键
; 5.2.1 全选
Capslock & a::
SetCapsLockState, AlwaysOff 
Send, ^a
return
; 5.2.2 保存
Capslock & s:: 
SetCapsLockState, AlwaysOff
Send, ^s
return
; 5.2.3 打开欧陆辞典
Capslock & d:: 
SetCapsLockState, AlwaysOff
Run C:\Program Files (x86)\eudic\eudic.exe
return
; 5.2.4 搜索
Capslock & f:: 
SetCapsLockState, AlwaysOff
Send, ^f
return
; 5.2.5 使用 Google 搜索选中内容
Capslock & g::
SetCapsLockState, AlwaysOff
Send, ^c
Run http://www.google.com/search?q=%clipboard%
return 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 5.3 "Capslock + z, x, c, v, b (单击, 双击, 三击)" 模拟公用功能键
; 5.3.1 撤销
Capslock & z:: 
SetCapsLockState, AlwaysOff
Send, ^z
return
; 5.3.2 剪切
Capslock & x:: 
SetCapsLockState, AlwaysOff
Send, ^x
return
; 5.3.3 复制
Capslock & c:: 
SetCapsLockState, AlwaysOff
Send, ^c
return
; 5.3.4 粘贴
Capslock & v:: 
SetCapsLockState, AlwaysOff
Send, ^v
return
; 5.3.5 使用 Baidu 搜索选中内容
Capslock & b::
SetCapsLockState, AlwaysOff
Send, ^c
Run http://www.baidu.com/s?wd=%clipboard%
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 5.4 "Capslock + y, u, i, o, p (单击, 双击, 三击)" 模拟公用功能键
; 5.4.1 重做
Capslock & y:: 
SetCapsLockState, AlwaysOff
Send, ^y
return
; 5.4.2 单击模拟 Home 键; 双击模拟 Ctrl + Home 键
Capslock & i::
SetCapsLockState, AlwaysOff
if capslock_i_presses > 0 
{
	capslock_i_presses += 1
	return
}
capslock_i_presses = 1
SetTimer, KeyCapslockI, 250
return

KeyCapslockI:
SetTimer, KeyCapslockI, Off
if capslock_i_presses = 1 
{
	Send, {Home}
} 
else if capslock_i_presses = 2 
{
	Send, ^{Home}
} 
else if capslock_i_presses = 3
{
	;
}
capslock_i_presses = 0
return
; 5.4.3 单击模拟 End 键; 双击模拟 Ctrl + End 键
Capslock & o::
SetCapsLockState, AlwaysOff
if capslock_o_presses > 0 
{
	capslock_o_presses += 1
	return
}
capslock_o_presses = 1
SetTimer, KeyCapslockO, 250
return

KeyCapslockO:
SetTimer, KeyCapslockO, Off
if capslock_o_presses = 1 
{
	Send, {End}
} 
else if capslock_o_presses = 2 
{
	Send, ^{End}
} 
else if capslock_o_presses = 3
{
	;
}
capslock_o_presses = 0
return
; 5.4.4 单击模拟 PgUp 键; 双击模拟 Ctrl + Pgup 键
Capslock & u::
SetCapsLockState, AlwaysOff
if capslock_u_presses > 0 
{
	capslock_u_presses += 1
	return
}
capslock_u_presses = 1
SetTimer, KeyCapslockU, 250
return

KeyCapslockU:
SetTimer, KeyCapslockU, Off
if capslock_u_presses = 1 
{
	Send, {PgUp}
} 
else if capslock_u_presses = 2 
{
	Send, ^{PgUp}
} 
else if capslock_u_presses = 3
{
	;
}
capslock_u_presses = 0
return
; 5.4.5 单击模拟 PgDn 键; 双击模拟 Ctrl + PgDn 键
Capslock & p::
SetCapsLockState, AlwaysOff
if capslock_p_presses > 0 
{
	capslock_p_presses += 1
	return
}
capslock_p_presses = 1
SetTimer, KeyCapslockP, 250
return

KeyCapslockP:
SetTimer, KeyCapslockP, Off
if capslock_p_presses = 1 
{
	Send, {PgDn}
} 
else if capslock_p_presses = 2 
{
	Send, ^{PgDn}
} 
else if capslock_p_presses = 3
{
	;
}
capslock_p_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 5.5 "Capslock + h, j, k, l, ; (单击, 双击, 三击)" 模拟公用功能键
; 5.5.1 单击模拟 Left 键; 双击模拟 Ctrl + Left 键
Capslock & h::
SetCapsLockState, AlwaysOff
if capslock_h_presses > 0 
{
	capslock_h_presses += 1
	return
}
capslock_h_presses = 1
SetTimer, KeyCapslockH, 250
return

KeyCapslockH:
SetTimer, KeyCapslockH, Off
if capslock_h_presses = 1 
{
	Send, {Left}
} 
else if capslock_h_presses = 2 
{
	Send, ^{Left}
} 
else if capslock_h_presses = 3
{
	;
}
capslock_h_presses = 0
return
; 5.5.2 单击模拟 Right 键; 双击模拟 Ctrl + Right 键
Capslock & l::
SetCapsLockState, AlwaysOff
if capslock_l_presses > 0 
{
	capslock_l_presses += 1
	return
}
capslock_l_presses = 1
SetTimer, KeyCapslockL, 250
return

KeyCapslockL:
SetTimer, KeyCapslockL, Off
if capslock_l_presses = 1 
{
	Send, {Right}
} 
else if capslock_l_presses = 2 
{
	Send, ^{Right}
} 
else if capslock_l_presses = 3
{
	;
}
capslock_l_presses = 0
return
; 5.5.3 单击模拟 Down 键
Capslock & j::
SetCapsLockState, AlwaysOff
if capslock_j_presses > 0 
{
	capslock_j_presses += 1
	return
}
capslock_j_presses = 1
SetTimer, KeyCapslockJ, 1
return

KeyCapslockJ:
SetTimer, KeyCapslockJ, Off
if capslock_j_presses = 1 
{
	Send, {Down}
} 
else if capslock_j_presses = 2 
{
	;
} 
else if capslock_j_presses = 3
{
	;
}
capslock_j_presses = 0
return
; 5.5.4 单击模拟 Up 键
Capslock & k::
SetCapsLockState, AlwaysOff
if capslock_k_presses > 0 
{
	capslock_k_presses += 1
	return
}
capslock_k_presses = 1
SetTimer, KeyCapslockK, 1
return

KeyCapslockK:
SetTimer, KeyCapslockK, Off
if capslock_k_presses = 1 
{
	Send, {Up}
} 
else if capslock_k_presses = 2 
{
	;
} 
else if capslock_k_presses = 3
{
	;
}
capslock_k_presses = 0
return
; 5.5.5 单击模拟 Ctrl + WheelDown 键; 双击模拟 Ctrl + WheelUp 键
/*
Capslock & `;::
SetCapsLockState, AlwaysOff
if capslock_semicolon_presses > 0 
{
	capslock_semicolon_presses += 1
	return
}
capslock_semicolon_presses = 1
SetTimer, KeyCapslockSemicolon, 250
return

KeyCapslockSemicolon:
SetTimer, KeyCapslockSemicolon, Off
if capslock_semicolon_presses = 1 
{
	Send, ^{WheelDown}
} 
else if capslock_semicolon_presses = 2 
{
	Send, ^{WheelUp}
} 
else if capslock_semicolon_presses = 3
{
	;
}
capslock_semicolon_presses = 0
return
*/
; 5.5.6 单击模拟向右滚动; 双击模拟向左滚动
Capslock & '::
SetCapsLockState, AlwaysOff
if capslock_quote_presses > 0 
{
	capslock_quote_presses += 1
	return
}
capslock_quote_presses = 1
SetTimer, KeyCapslockQuote, 250
return

KeyCapslockQuote:
SetTimer, KeyCapslockQuote, Off
if capslock_quote_presses = 1 
{
	ControlGetFocus, fcontrol, A
	Loop 6  ; <-- 增加这个值来加快滚动速度.
    SendMessage, 0x114, 1, 0, %fcontrol%, A  ; 0x114 是 WM_HSCROLL, 它后面的 1 是 SB_LINERIGHT.
} 
else if capslock_quote_presses = 2 
{
	ControlGetFocus, fcontrol, A
	Loop 6  ; <-- 增加这个值来加快滚动速度.
    SendMessage, 0x114, 0, 0, %fcontrol%, A  ; 0x114 是 WM_HSCROLL, 它后面的 0 是 SB_LINELEFT.
} 
else if capslock_quote_presses = 3
{
	;
}
capslock_quote_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 5.6 "Capslock + n, m, comma, full stop, slash (单击, 双击, 三击)" 模拟公用功能键
; 5.6.1 单击模拟 Ctrl + n 键; 双击模拟 Ctrl + Shift + n 键
Capslock & n::
SetCapsLockState, AlwaysOff
if capslock_n_presses > 0 
{
	capslock_n_presses += 1
	return
}
capslock_n_presses = 1
SetTimer, KeyCapslockN, 250
return

KeyCapslockN:
SetTimer, KeyCapslockN, Off
if capslock_n_presses = 1 
{
	Send, ^n
} 
else if capslock_n_presses = 2 
{
	Send, ^+n
} 
else if capslock_n_presses = 3
{
	;
}
capslock_n_presses = 0
return
; 5.6.2 单击模拟 BackSpace 键
Capslock & m:: 
SetCapsLockState, AlwaysOff
Send, {BackSpace}
return
; 5.6.3 单击模拟 Delete 键, 双击模拟 Ctrl + Delete 键
Capslock & ,::
SetCapsLockState, AlwaysOff
if capslock_comma_presses > 0 
{
	capslock_comma_presses += 1
	return
}
capslock_comma_presses = 1
SetTimer, KeyCapslockComma, 250
return

KeyCapslockComma:
SetTimer, KeyCapslockComma, Off
if capslock_comma_presses = 1 
{
	Send, {Delete}
} 
else if capslock_comma_presses = 2 
{
	Send, ^{Delete}
} 
else if capslock_comma_presses = 3
{
	;
}
capslock_comma_presses = 0
return
; 5.6.4 在中文状态下, 切换中英文标点 		 
Capslock & .:: 
SetCapsLockState, AlwaysOff
input_num := GetInputNum()
if (input_num <> 67699721) 
{
    Send, ^. 
}
return
; 5.6.5 单击提高音量, 双击降低音量, 三击静音
Capslock & /::
if capslock_slash_presses > 0 
{
	capslock_slash_presses += 1
	return
}
capslock_slash_presses = 1
SetTimer, KeyCapslockSlash, 400
return

KeyCapslockSlash:
SetTimer, KeyCapslockSlash, Off
if capslock_slash_presses = 1 
{
	Send, {Volume_Up}
} 
else if capslock_slash_presses = 2 
{
	Send, {Volume_Down}
} 
else if capslock_slash_presses = 3
{
	Send, {Volume_Mute}
}
capslock_slash_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 5.7 Capslock + 其他按键
; 5.7.1 Capslock + ` 模拟 Capslock 键
Capslock & `::
GetKeyState, CapsLockState, Capslock, T                              
if CapsLockState = D                                              
    SetCapsLockState, AlwaysOff                                  
else                                                            
    SetCapsLockState, AlwaysOn                                 
KeyWait, ``                                                   
return 
; 5.7.2 Capslock + Space 模拟滚轮, 单击向下滚动; 双击向上滚动
Capslock & space::
SetCapsLockState, AlwaysOff
if capslock_space > 0 
{
	capslock_space += 1
	return
}
capslock_space = 1
SetTimer, KeyCapslockSpace, 250
return

KeyCapslockSpace:
SetTimer, KeyCapslockSpace, Off
if capslock_space = 1
{
	Send, {WheelDown}
} 
else if capslock_space = 2 
{
	Send, {WheelUp}
} 
else if capslock_space = 3
{
	;
}
capslock_space = 0
return
; 5.7.3 Capslock + RButton 模拟 AltTab; Capslock + LButton 模拟 ShiftAltTab
Capslock & ~RButton:: AltTab
Capslock & ~LButton:: ShiftAltTab
; 5.7.4 Capslock + MButton
;       单击在窗口最大化和正常状态间切换
;       双击最小化窗口
;       三击关闭窗口
Capslock & MButton::
SetCapsLockState, AlwaysOff
if capslock_mbutton_presses > 0
{
    capslock_mbutton_presses += 1
    return
}
capslock_mbutton_presses = 1
SetTimer, KeyCapslockMButton, 400
return

KeyCapslockMButton:
SetTimer, KeyCapslockMButton, Off
if capslock_mbutton_presses = 1
{
	if WinStatus = 0 
    { 
        WinMaximize, A 
        WinStatus := 1 
    } 
    else 
    { 
        WinRestore, A 
        WinStatus := 0 
    }
}
else if capslock_mbutton_presses = 2
{
	WinMinimize, A
}
else if capslock_mbutton_presses = 3
{
    Send, !{F4}
}
capslock_mbutton_presses = 0
return 
; 5.7.5 按住 Capslock + 滚轮模拟水平滚动
; 向左滚动
Capslock & WheelUp::
SetCapsLockState, AlwaysOff
ControlGetFocus, fcontrol, A
Loop 6  ; <-- 增加这个值来加快滚动速度.
    SendMessage, 0x114, 0, 0, %fcontrol%, A  ; 0x114 是 WM_HSCROLL, 它后面的 0 是 SB_LINELEFT.
return
; 向右滚动
Capslock & WheelDown::  
SetCapsLockState, AlwaysOff
ControlGetFocus, fcontrol, A
Loop 6  ; <-- 增加这个值来加快滚动速度.
    SendMessage, 0x114, 1, 0, %fcontrol%, A  ; 0x114 是 WM_HSCROLL, 它后面的 1 是 SB_LINERIGHT.
return
; 5.7.6 模拟鼠标指针移动到当前窗口
Tab & LButton::
MouseMove, -1000, 0, 0, R
Click
return
Tab & RButton::
MouseMove, 1000, 0, 0, R 
Click
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 6. 使用热字串映射字符串, 网址, 程序
; 6.1 打开提示
/*
:*:;;:: 
ToolTip,
(LTrim Join
	当前上下文可用的字符串有:`n
	第一部分 自动替换热字串`n
	;svn ---> 输入 svn 地址`t;em ---> 输入 email 地址`n
	;date ---> 输入当前日期`n
	第二部分 ---> 替换网址`n
	;gg ---> Google`t`t;bd ---> Baidu`n
	;oa ---> OA`t`t;qd ---> 签到系统`n
	;db ---> 豆瓣`t`t;zh ---> 知乎`n
	;tb ---> 淘宝`t`t;jd ---> 京东`n
	;rd ---> raindrop`n
	;yk ---> 优酷`n
	;cpaj ---> 图说中国 Java 后台`n
	;cpap ---> 图说中国 PHP 后台 `n
	;vih ---> Vim Help
	;faq ---> 图说中国 FAQ
	;hibr ---> Hibernate 参考文档
)
SetTimer, RemoveHotStringTip, 10000
return

RemoveHotStringTip:
SetTimer, RemoveHotStringTip, Off
ToolTip
return
*/
; 6.1 自动替换热字串
; 7.1 字符串
:*:;svn::
Send, http://10.1.10.8/svn/chinapic/4Code/01Trunk/chinapic/
return

:*:;ema::
Send, jms1209@qq.com
return

:*:;ft::
FormatTime, OhMyTime, %A_now%, yyyy年M月d日 dddd H时m分s秒
SendInput %OhMyTime%
:*:;gg::
Run http://www.google.com
return

; 7.2 网址
:*:;bd::
Run http://www.baidu.com
return

:*:;oa::
Run http://oa.people.lo/general/
return

:*:;db::
Run https://www.douban.com/
return

:*:;zh::
Run https://www.zhihu.com/
return
 
:*:;rd::
Run https://raindrop.io/app#/collection/0
return

:*::yk::
Run http://www.youku.com/
return

:*:;qd::
Run http://10.1.7.217/randd/index.asp
return

:*:;cpaj::
Run http://localhost:9080/chinapic/admin/login
return

:*:;cpap::
Run http://10.1.7.36/chinapic/admin.php
return

:*:/tb::
Run https://www.taobao.com
return

:*:;jd::
Run https://www.jd.com
return

:*:;vih::
Run http://vimcdoc.sourceforge.net/doc/help.html
return

:*:;faq::
Run http://faq.comsenz.com/library/database/x25/x25_index.htm
return

:*:;hibr::
Run file:///C:/Users/JiaMingSheng/Documents/me/lib/hibernate/hibernate-distribution-3.6.10.Final-dist/hibernate-distribution-3.6.10.Final/documentation/manual/zh-CN/html_single/index.html
return

; 7.3 程序
; 清空回收站
:*:;fre:: 
FileRecycleEmpty
return

:*:;cal::
Run calc
return

:*:;msc::
Run msconfig
return

:*:;msi::
Run msinfo32
return

; 屏幕键盘
:*:;osk::
Run osk
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 7. 字母键的模拟
$a::
if (is_tab_w = 1)
{
	Send, #a
}
else
{
	Send, a
}
return

$b::
if (is_lalt_f = 1)
{
	Send, {F8}
}
if (is_lalt_a = 1)
{
	Send, !{F8}
}
if (is_lalt_c = 1)
{
	Send, ^{F8}
}
else
{
	Send, b
}
return

$c::
if (is_lalt_f = 1)
{
	
}
else
{
	Send, c
}
return

$d::
if (is_lalt_f = 1)
{
	
}
else
{
	Send, d
}
return

$e::
if (is_lalt_f = 1)
{
	
}
else
{
	Send, e
}
return

$f::
if (is_lalt_f = 1)
{
	Send, {F4}
}
if (is_lalt_a = 1)
{
	Send, !{F4}
}
if (is_lalt_c = 1)
{
	Send, ^{F4}
}
else
{
	Send, f
}
return

$g::
if (is_lalt_f = 1)
{
	
}
else
{
	Send, g
}
return

$h::
if (is_lalt_f = 1)
{
	Send, {F11}
}
if (is_lalt_a = 1)
{
	Send, !{F11}
}
if (is_lalt_c = 1)
{
	Send, ^{F11}
}
else
{
	Send, h
}
return

$i::
if (is_lalt_f = 1)
{
	
}
else
{
	Send, i
}
return

$j::
if (is_lalt_f = 1)
{
	Send, {F12}
}
if (is_lalt_a = 1)
{
	Send, !{F12}
}
if (is_lalt_c = 1)
{
	Send, ^{F12}
}
else
{
	Send, j
}
return

$k::
if (is_lalt_f = 1)
{
	
}
else
{
	Send, k
}
return

$l::
if (is_lalt_f = 1)
{
	
}
else
{
	Send, l
}
return

$m::
if (is_lalt_f = 1)
{
	
}
else
{
	Send, m
}
return

$n::
if (is_lalt_f = 1)
{
	
}
else
{
	Send, n
}
return

$o::
if (is_lalt_f = 1)
{
	
}
else
{
	Send, o
}
return

$p::
if (is_lalt_f = 1)
{
	
}
else
{
	Send, p
}
return

$q::
if (is_lalt_f = 1)
{
	Send, {F7}
}
if (is_lalt_a = 1)
{
	Send, !{F7}
}
if (is_lalt_c = 1)
{
	Send, ^{F7}
}
else
{
	Send, q
}
return

$r::
if (is_lalt_f = 1)
{
	Send, {F2}
}
if (is_lalt_a = 1)
{
	Send, !{F2}
}
if (is_lalt_c = 1)
{
	Send, ^{F2}
}
else
{
	Send, r
}
return

$s::
if (is_lalt_f = 1)
{
	Send, {F6}
}
if (is_lalt_a = 1)
{
	Send, !{F6}
}
if (is_lalt_c = 1)
{
	Send, ^{F6}
}
else
{
	Send, s
}
return

$t::
if (is_lalt_f = 1)
{
	Send, {F3}
}
if (is_lalt_a = 1)
{
	Send, !{F3}
}
if (is_lalt_c = 1)
{
	Send, ^{F3}
}
else
{
	Send, t
}
return

$u::
if (is_lalt_f = 1)
{
	
}
else
{
	Send, u
}
return

$v::
if (is_lalt_f = 1)
{
	Send, {F5}
}
if (is_lalt_a = 1)
{
	Send, !{F5}
}
if (is_lalt_c = 1)
{
	Send, ^{F5}
}
else
{
	Send, v
}
return

$w::
if (is_lalt_f = 1)
{
	
}
else
{
	Send, w
}
return

$x::
if (is_lalt_f = 1)
{
	
}
else
{
	Send, x
}
return

$y::
if (is_lalt_f = 1)
{
	Send, {F1}
}
if (is_lalt_a = 1)
{
	Send, !{F1}
}
if (is_lalt_c = 1)
{
	Send, ^{F1}
}
else
{
	Send, y
}
return

$z::
if (is_lalt_f = 1)
{
	Send, {F10}
}
if (is_lalt_a = 1)
{
	Send, !{F10}
}
if (is_lalt_c = 1)
{
	Send, ^{F10}
}
else
{
	Send, z
}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 8. Spring Tool Suite 的上下文中快捷键的模拟
#IfWinActive, ahk_class SWT_Window0
; 8.1 "Capslock + q, w, e, r, t (单击, 双击, 三击)" 模拟 STS 环境下的快捷键
; 8.1.1 单击实现截图; 双击实现 Copy Qualified Name
Capslock & q::
TransformLanguage()
SetCapsLockState, AlwaysOff
if capslock_q_presses > 0 
{
	capslock_q_presses += 1
	return
}
capslock_q_presses = 1
SetTimer, KeyCapslockQ, 250
return

KeyCapslockQ:
SetTimer, KeyCapslockQ, Off
if capslock_q_presses = 1 
{
	Send, ^!+x
} 
else if capslock_q_presses = 2 
{
	Send, {AppsKey}
	Send, y
	Send, {Enter}
} 
else if capslock_q_presses = 3
{

}
capslock_q_presses = 0
return
; 8.1.2 单击实现 Close; 双击实现 Close Others; 三击实现 Close All
Capslock & w::
SetCapsLockState, AlwaysOff
if capslock_w_presses > 0 
{
	capslock_w_presses += 1
	return
}
capslock_w_presses = 1
SetTimer, KeyCapslockW, 400
return

KeyCapslockW:
SetTimer, KeyCapslockW, Off
if capslock_w_presses = 1 
{
	Send, ^w
} 
else if capslock_w_presses = 2 
{
	Send, !-o
} 
else if capslock_w_presses = 3
{
	Send, ^+w
}
capslock_w_presses = 0
return
; 8.1.3 单击实现 Toggle Everything; 双击实现重构
Capslock & e::
TransformLanguage()
SetCapsLockState, AlwaysOff
if capslock_e_presses > 0 
{
	capslock_e_presses += 1
	return
}
capslock_e_presses = 1
SetTimer, KeyCapslockE, 250
return

KeyCapslockE:
SetTimer, KeyCapslockE, Off
if capslock_e_presses = 1 
{
	Send, #!e
} 
else if capslock_e_presses = 2 
{
	Send, !+t
} 
else if capslock_e_presses = 3
{
	;
}
capslock_e_presses = 0
return
; 8.1.4 单击打开运行; 双击实现 Open Resource
Capslock & r::
TransformLanguage()
if capslock_r_presses > 0 
{
	capslock_r_presses += 1
	return
}
capslock_r_presses = 1
SetTimer, KeyCapslockR, 250
return

KeyCapslockR:
SetTimer, KeyCapslockR, Off
if capslock_r_presses = 1 
{
	Send, #r
} 
else if capslock_r_presses = 2 
{
	Send, ^+r
} 
else if capslock_r_presses = 3
{
	;
}
capslock_r_presses = 0
return
; 8.1.5 单击实现替换, 双击实现 Open Type
Capslock & t::
TransformLanguage()
if capslock_t_presses > 0 
{
	capslock_t_presses += 1
	return
}
capslock_t_presses = 1
SetTimer, KeyCapslockT, 250
return

KeyCapslockT:
SetTimer, KeyCapslockT, Off
if capslock_t_presses = 1 
{
	Send, ^h
} 
else if capslock_t_presses = 2 
{
	Send, ^+t
} 
else if capslock_t_presses = 3
{
	;
}
capslock_t_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 8.2 "Capslock + a, s, d, f, g (单击, 双击, 三击)" 模拟 STS 环境下的快捷键
; 8.2.1 单击实现全选; 双击实现 Content Assist
Capslock & a::
if capslock_a_presses > 0 
{
	capslock_a_presses += 1
	return
}
capslock_a_presses = 1
SetTimer, KeyCapslockA, 250
return

KeyCapslockA:
SetTimer, KeyCapslockA, Off
if capslock_a_presses = 1 
{
	Send, ^a
} 
else if capslock_a_presses = 2 
{
	Send, !{/}
} 
else if capslock_a_presses = 3
{
	;
}
capslock_a_presses = 0
return
; 8.2.2 单击实现 Save; 双击实现打开 Source
Capslock & s::
TransformLanguage()
if capslock_s_presses > 0 
{
	capslock_s_presses += 1
	return
}
capslock_s_presses = 1
SetTimer, KeyCapslockS, 250
return

KeyCapslockS:
SetTimer, KeyCapslockS, Off
if capslock_s_presses = 1 
{
	Send, ^s
} 
else if capslock_s_presses = 2 
{
	Send, !+s
} 
else if capslock_s_presses = 3
{
	;
}
capslock_s_presses = 0
return
; 8.2.3 单击打开辞典; 双击实现删除行
Capslock & d::
if capslock_d_presses > 0 
{
	capslock_d_presses += 1
	return
}
capslock_d_presses = 1
SetTimer, KeyCapslockD, 250
return

KeyCapslockD:
SetTimer, KeyCapslockD, Off
if capslock_d_presses = 1 
{
	
} 
else if capslock_d_presses = 2 
{
	Send, ^d
} 
else if capslock_d_presses = 3
{
	;
}
capslock_d_presses = 0
return
; 8.2.4 单击实现搜索; 双击实现 Format
Capslock & f::
if capslock_f_presses > 0 
{
	capslock_f_presses += 1
	return
}
capslock_f_presses = 1
SetTimer, KeyCapslockF, 250
return

KeyCapslockF:
SetTimer, KeyCapslockF, Off
if capslock_f_presses = 1 
{
	Send, ^f
} 
else if capslock_f_presses = 2 
{
	Send, ^+f
} 
else if capslock_f_presses = 3
{
	;
}
capslock_f_presses = 0
return
; 8.2.5 单击实现将选中的内容使用 Google 搜索; 双击实现 Go To Line
Capslock & g::
TransformLanguage()
if capslock_g_presses > 0 
{
	capslock_g_presses += 1
	return
}
capslock_g_presses = 1
SetTimer, KeyCapslockG, 250
return

KeyCapslockG:
SetTimer, KeyCapslockG, Off
if capslock_g_presses = 1 
{
	Send, ^c
	Run http://www.google.com/search?q=%clipboard%
} 
else if capslock_g_presses = 2
{
	Send, ^l
	sleep, 2000
	Send, {Enter}
} 
else if capslock_g_presses = 3
{
	;
}
capslock_g_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 8.3 "Capslock + z, x, c, v, b (单击, 双击, 三击)" 模拟 STS 环境下的快捷键
; 8.3.1 单击实现撤销; 双击实现 Surround With
Capslock & z::
if capslock_z_presses > 0 
{
	capslock_z_presses += 1
	return
}
capslock_z_presses = 1
SetTimer, KeyCapslockZ, 250
return

KeyCapslockZ:
SetTimer, KeyCapslockZ, Off
if capslock_z_presses = 1 
{
	Send, ^z
} 
else if capslock_z_presses = 2
{
	Send, !+z
} 
else if capslock_z_presses = 3
{
	;
}
capslock_z_presses = 0
return
; 8.3.2 单击实现剪切; 双击实现 Run As
Capslock & x::
if capslock_x_presses > 0 
{
	capslock_x_presses += 1
	return
}
capslock_x_presses = 1
SetTimer, KeyCapslockX, 250
return

KeyCapslockX:
SetTimer, KeyCapslockX, Off
if capslock_x_presses = 1 
{
	Send, ^x
} 
else if capslock_x_presses = 2
{
	Send, !+x
} 
else if capslock_x_presses = 3
{
	;
}
capslock_x_presses = 0
return
; 8.3.3 单击实现复制; 双击实现 Toggle Comment
Capslock & c::
if capslock_c_presses > 0 
{
	capslock_c_presses += 1
	return
}
capslock_c_presses = 1
SetTimer, KeyCapslockC, 400
return

KeyCapslockC:
SetTimer, KeyCapslockC, Off
if capslock_c_presses = 1 
{
	Send, ^c
} 
else if capslock_c_presses = 2
{
	Send, ^+c
} 
else if capslock_c_presses = 3
{
	Send, !+j
}
capslock_c_presses = 0
return
; 8.3.4
Capslock & v::
if capslock_v_presses > 0 
{
	capslock_v_presses += 1
	return
}
capslock_v_presses = 1
SetTimer, KeyCapslockV, 250
return

KeyCapslockV:
SetTimer, KeyCapslockV, Off
if capslock_v_presses = 1 
{
	Send, ^v
} 
else if capslock_v_presses = 2
{
	;
} 
else if capslock_v_presses = 3
{
	;
}
capslock_v_presses = 0
return
; 8.3.5 单击实现将选中的内容使用 Baidu 搜索; 双击添加块注释; 三击删除块注释
Capslock & b::
if capslock_b_presses > 0 
{
	capslock_b_presses += 1
	return
}
capslock_b_presses = 1
SetTimer, KeyCapslockB, 400
return

KeyCapslockB:
SetTimer, KeyCapslockB, Off
if capslock_b_presses = 1 
{
	Send, ^c
	Run http://www.baidu.com/s?wd=%clipboard%
} 
else if capslock_b_presses = 2
{
	Send, ^+/
} 
else if capslock_b_presses = 3
{
	Send, ^+\
}
capslock_b_presses = 0
return
; 8.4 "Capslock + 其他键 (单击, 双击, 三击)" 模拟 STS 环境下的快捷键
; 8.4.1 单击实现 Down 键; 双击定位到 Next Member
Capslock & j::
if capslock_j_presses > 0 
{
	capslock_j_presses += 1
	return
}
capslock_j_presses = 1
SetTimer, KeyCapslockJ2, 175
return

KeyCapslockJ2:
SetTimer, KeyCapslockJ2, Off
if capslock_j_presses = 1 
{
	Send, {Down}
} 
else if capslock_j_presses = 2 
{
	Send, ^+{Down}
} 
else if capslock_j_presses > 2
{
	;
}
capslock_j_presses = 0
return
; 8.4.2 单击实现 UP 键; 双击定位到 Previous Member
Capslock & k::
if capslock_k_presses > 0 
{
	capslock_k_presses += 1
	return
}
capslock_k_presses = 1
SetTimer, KeyCapslockK2, 175
return

KeyCapslockK2:
SetTimer, KeyCapslockK2, Off
if capslock_k_presses = 1 
{
	Send, {Up}
} 
else if capslock_k_presses = 2 
{
	Send, ^+{Up}
} 
else if capslock_k_presses > 2
{
	;
}
capslock_k_presses = 0
return
; 8.4.3 单击实现新建文件, 双击实现新建项目
Capslock & n::
if capslock_n_presses > 0 
{
	capslock_n_presses += 1
	return
}
capslock_n_presses = 1
SetTimer, KeyCapslockN2, 250
return

KeyCapslockN2:
SetTimer, KeyCapslockN2, Off
if capslock_n_presses = 1 
{
	Send, !+n 
} 
else if capslock_n_presses = 2 
{
	Send, ^n
} 
else if capslock_n_presses = 3
{
	;
}
capslock_n_presses = 0
return
/*
Capslock & Enter::
if enter_presses > 0 
{
	enter_presses += 1
	return
}
enter_presses = 1
SetTimer, KeyEnter, 300
return

KeyEnter:
SetTimer, KeyEnter, Off
if enter_presses = 1 
{
	Send, +{Enter}
} 
else if enter_presses = 2 
{
	Send, ^+{Enter}
} 
else if enter_presses = 3
{
	;
}
enter_presses = 0
return
*/
; 8.4.4 单击模拟 Ctrl + 1
Capslock & 1::
SetCapsLockState, AlwaysOff
Send, ^1
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 8.5 "Space + q, w, e, r, t (单击, 双击, 三击)" 模拟 STS 环境下的快捷键
; 8.5.1 单击输入数字 7; 双击打开 Show View ---> Other
Space & q::
if space_q_presses > 0 
{
	space_q_presses += 1
	return
}
space_q_presses = 1
SetTimer, KeySpaceQ, 250
return

KeySpaceQ:
SetTimer, KeySpaceQ, Off
if space_q_presses = 1 
{
	Send, 7
} 
else if space_q_presses = 2 
{
	Send, !+qq
	WinMaximize, A
} 
else if space_q_presses = 3
{
	;
}
space_q_presses = 0
return
; 8.5.2 单击输入符号 #; 双击实现 Show In
Space & w::
if space_w_presses > 0 
{
	space_w_presses += 1
	return
}
space_w_presses = 1
SetTimer, KeySpaceW, 250
return

KeySpaceW:
SetTimer, KeySpaceW, Off
if space_w_presses = 1 
{
	Send, {#}
} 
else if space_w_presses = 2 
{
	Send, !+w
} 
else if space_w_presses = 3
{
	;
}
space_w_presses = 0
return
; 8.5.3 单击输入符号 =; 双击激活编辑窗口 (Activate Editor) 并最大化
Space & e::
if space_e_presses > 0 
{
	space_e_presses += 1
	return
}
space_e_presses = 1
SetTimer, KeySpaceE, 250
return

KeySpaceE:
SetTimer, KeySpaceE, Off
if space_e_presses = 1 
{
	Send, {=}
} 
else if space_e_presses = 2 
{
	Send, {F12} 
	Send, ^m
} 
else if space_e_presses = 3
{
	;
}
space_e_presses = 0
return
; 8.5.4 单击输入数字 2; 双击实现 Restart Server (需要设置 STS 快捷键)
Space & r::
if space_r_presses > 0 
{
	space_r_presses += 1
	return
}
space_r_presses = 1
SetTimer, KeySpaceR, 250
return

KeySpaceR:
SetTimer, KeySpaceR, Off
if space_r_presses = 1 
{
	Send, 2
} 
else if space_r_presses = 2 
{
	Send, !+qv
	Send, ^!r
} 
else if space_r_presses = 3
{
	;
}
space_r_presses = 0
return
; 8.5.5 单击输入数字 3; 双击实现 Run Junit Test; 三击实现 Debug Junit Test
Space & t::
TransformLanguage()
if space_t_presses > 0 
{
	space_t_presses += 1
	return
}
space_t_presses = 1
SetTimer, KeySpaceT, 400
return

KeySpaceT:
SetTimer, KeySpaceT, Off
if space_t_presses = 1 
{
	Send, 3
} 
else if space_t_presses = 2 
{
	Send, !+xt
} 
else if space_t_presses = 3
{
	Send, !+dt
}
space_t_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 8.6 "Space + a, s, d, f, g (单击, 双击, 三击)" 模拟 STS 环境下的快捷键
; 8.6.1 单击输入符号 &; 双击打开 Parameter Hints
Space & a::
if space_a_presses > 0 
{
	space_a_presses += 1
	return
}
space_a_presses = 1
SetTimer, KeySpaceA, 250
return

KeySpaceA:
SetTimer, KeySpaceA, Off
if space_a_presses = 1 
{
	Send, {&}
} 
else if space_a_presses = 2 
{
	Send, !+/
} 
else if space_a_presses = 3
{
	;
}
space_a_presses = 0
return
; 8.6.2 单击输入数字 6; 双击实现 Run on Server; 三击实现 Debug on Server
Space & s::
if space_s_presses > 0 
{
	space_s_presses += 1
	return
}
space_s_presses = 1
SetTimer, KeySpaceS, 400
return

KeySpaceS:
SetTimer, KeySpaceS, Off
if space_s_presses = 1 
{
	Send, {$}
} 
else if space_s_presses = 2 
{
	Send, !+xr
} 
else if space_s_presses = 3
{
	Send, !+dr
}
space_s_presses = 0
return
; 8.6.3 单击输入符号 $; 双击打开 Debug
Space & d::
if space_d_presses > 0 
{
	space_d_presses += 1
	return
}
space_d_presses = 1
SetTimer, KeySpaceD, 250
return

KeySpaceD:
SetTimer, KeySpaceD, Off
if space_d_presses = 1 
{
	Send, {$}
} 
else if space_d_presses = 2 
{
	Send, {F11}
} 
else if space_d_presses = 3
{
	/*
	Send, {Control Down}
	;sleep, 2000
	varX = %A_CaretX%
	varY = %A_CaretY%
	varY += 15 
	MouseMove, %varX%, %varY%
	VarY += 5
	MouseMove, %varX%, %varY%
	Click
	Sleep, 5000
	Send, {Control Up}
	 */
}
space_d_presses = 0
return
; 8.6.4 单击输入数字 4; 双击实现 Focus
Space & f::
if space_f_presses > 0 
{
	space_f_presses += 1
	return
}
space_f_presses = 1
SetTimer, KeySpaceF, 250
return

KeySpaceF:
SetTimer, KeySpaceF, Off
if space_f_presses = 1 
{
	Send, 4
} 
else if space_f_presses = 2 
{
	Send, {F2}
} 
else if space_f_presses = 3
{
	;
}
space_f_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 8.7 "Space + z, x, c, v, b (单击, 双击, 三击)" 模拟 STS 环境下的快捷键
; 8.7.3 单击输入符号 @; 双击定位到 Console 视图, 并最大化
Space & c::
if space_c_presses > 0 
{
	space_c_presses += 1
	return
}
space_c_presses = 1
SetTimer, KeySpaceC, 250
return

KeySpaceC:
SetTimer, KeySpaceC, Off
if space_c_presses = 1 
{
	Send, {@}
} 
else if space_c_presses = 2 
{
	Send, !+qc
	Send, ^m
} 
else if space_c_presses = 3
{
	;
}
space_c_presses = 0
return
; 8.7.4 单击输入数字 5, 双击定位到 Server 视图(需要在 STS 里设置) 
Space & v::
if space_v_presses > 0 
{
	space_v_presses += 1
	return
}
space_v_presses = 1
SetTimer, KeySpaceV, 250
return

KeySpaceV:
SetTimer, KeySpaceV, Off
if space_v_presses = 1 
{
	Send, 5
} 
else if space_v_presses = 2 
{
	Send, !+qv
	Send, {AppsKey}
} 
else if space_v_presses = 3
{
	;
}
space_v_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 8.8 "Space + y, u, i, o, p (单击, 双击, 三击)" 模拟 STS 环境下的快捷键
; 8.8.3 单击输入符号 \; 双击实现 Organize Imports
Space & i::
if space_i_presses > 0 
{
	space_i_presses += 1
	return
}
space_i_presses = 1
SetTimer, KeySpaceI, 250
return

KeySpaceI:
SetTimer, KeySpaceI, Off
if space_i_presses = 1 
{
	Send, {\}
} 
else if space_i_presses = 2 
{
	Send, ^+o
} 
else if space_i_presses = 3
{
	;
}
space_i_presses = 0
return
; 8.8.4 单击输入符号 |; 双击定位到 Outline 视图; 三击打开 Quick Outline 
Space & o::
if space_o_presses > 0 
{
	space_o_presses += 1
	return
}
space_o_presses = 1
SetTimer, KeySpaceO, 400
return

KeySpaceO:
SetTimer, KeySpaceO, Off
if space_o_presses = 1 
{
	Send, {|}
} 
else if space_o_presses = 2 
{
	Send, !+qo
} 
else if space_o_presses = 3
{
	Send, ^o
}
space_o_presses = 0
return
; 8.8.5 单击输入符号 +; 双击定位到 Package Explorer 视图; 三击打开 Preference 菜单
Space & p::
if space_p_presses > 0 
{
	space_p_presses += 1
	return
}
space_p_presses = 1
SetTimer, KeySpaceP, 400
return

KeySpaceP:
SetTimer, KeySpaceP, Off
if space_p_presses = 1 
{
	Send, {+}
} 
else if space_p_presses = 2 
{
	Send, !+qp
} 
else if space_p_presses = 3
{
	Send, !wp
}
space_p_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 8.9 "Space + h, j, k, l, ; (单击, 双击, 三击)" 模拟 STS 环境下的快捷键
; 8.9.1 单击输入符号 -; 双击打开 Type Hierarchy 视图; 三击打开 Quick Type Hierarchy
Space & h::
if space_h_presses > 0 
{
	space_h_presses += 1
	return
}
space_h_presses = 1
SetTimer, KeySpaceH, 400
return

KeySpaceH:
SetTimer, KeySpaceH, Off
if space_h_presses = 1 
{
	Send, {-}
} 
else if space_h_presses = 2 
{
	Send, !+qt
} 
else if space_h_presses = 3
{
	Send, ^t
}
space_h_presses = 0
return
; 8.9.2 单击输入符号 (; 双击实现 Run Java Application; 三击输入符号 )
Space & j::
if space_j_presses > 0 
{
	space_j_presses += 1
	return
}
space_j_presses = 1
SetTimer, KeySpaceJ2, 400
return

KeySpaceJ2:
SetTimer, KeySpaceJ2, Off
if space_j_presses = 1 
{
	Send, {(}
} 
else if space_j_presses = 2 
{
	Send, {)}
} 
else if space_j_presses = 3
{
	Send, !+xj
}
space_j_presses = 0
return
; 8.9.4 单击输入符号 [; 双击实现 Assign to Local Variable; 三击输入符号 ]
Space & l::
if space_l_presses > 0 
{
	space_l_presses += 1
	return
}
space_l_presses = 1
SetTimer, KeySpaceL2, 400
return

KeySpaceL2:
SetTimer, KeySpaceL2, Off
if space_l_presses = 1
{
	Send, {[}
} 
else if space_l_presses = 2 
{
	Send, ^2l
} 
else if space_l_presses = 3
{
	Send, {]}
}
space_l_presses = 0
return
; 8.10 "Space + n, m, comma, finish point, slash (单击, 双击, 三击)" 模拟 STS 环境下的快捷键
; 8.10.2 单击输入符号 %; 双击实现 Move
Space & m::
if space_m_presses > 0 
{
	space_m_presses += 1
	return
}
space_m_presses = 1
SetTimer, KeySpaceM, 250
return

KeySpaceM:
SetTimer, KeySpaceM, Off
if space_m_presses = 1
{
	Send, {`%}
} 
else if space_m_presses = 2 
{
	Send, !+v
} 
else if space_m_presses = 3
{
	;
}
space_m_presses = 0
return
; 8.10.3 单击输入符号 <; 双击定位到 Previous Annotation
Space & ,::
if space_comma_presses > 0 
{
	space_comma_presses += 1
	return
}
space_comma_presses = 1
SetTimer, KeySpaceComma, 250
return

KeySpaceComma:
SetTimer, KeySpaceComma, Off
if space_comma_presses = 1
{
	Send, {<}
} 
else if space_comma_presses = 2 
{
	Send, ^,
} 
else if space_comma_presses = 3
{
	;
}
space_comma_presses = 0
return
; 8.10.4 单击输入符号 >; 双击定位到 Next Annotation
Space & .::
if space_point_presses > 0 
{
	space_point_presses += 1
	return
}
space_point_presses = 1
SetTimer, KeySpacePoint, 250
return

KeySpacePoint:
SetTimer, KeySpacePoint, Off
if space_point_presses = 1
{
	Send, {>}
} 
else if space_point_presses = 2 
{
	input_num := GetInputNum()
    if (input_num = 67699721) 
    {
        Send, ^. 
    }
    else
    {
        SetCapsLockState, Off
        Send, #{Space}^.
    }
} 
else if space_point_presses = 3
{
	;
}
space_point_presses = 0
return
; 8.11 Space + 其他按键模拟 STS 快捷键
; 8.11.1 单击输入符号空格; 双击实现窗口最大化
$Space::
if space_presses > 0 
{
	space_presses += 1
	return
}
space_presses = 1
SetTimer, KeySpace, 200
return

KeySpace:
SetTimer, KeySpace, Off
if space_presses = 1
{
	Send, {Space}
} 
else if space_presses = 2 
{
	Send, ^m
} 
else if space_presses = 3
{
	;
}
space_presses = 0
return
; 8.11.2 单击实现在当前行下方插入一行; 双击实现在当前行上方插入一行
Space & Enter::
if space_enter_presses > 0 
{
	space_enter_presses += 1
	return
}
space_enter_presses = 1
SetTimer, KeySpaceEnter, 250
return

KeySpaceEnter:
SetTimer, KeySpaceEnter, Off
if space_enter_presses = 1
{
	Send, +{Enter}
} 
else if space_enter_presses = 2 
{
	Send, ^+{Enter}
} 
else if space_enter_presses = 3
{
	;
}
space_enter_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 8.11 "LAlt + m, comma, period, slash (单击, 双击, 三击)" 实现 Expand Selection To
; 8.11.1 单击实现 Shift + Left; 双击实现 Previous Element
LAlt & m::
if lalt_m_presses > 0 
{
	lalt_m_presses += 1
	return
}
lalt_m_presses = 1
SetTimer, KeyLAltM, 250
return

KeyLAltM:
SetTimer, KeyLAltM, Off
if lalt_m_presses = 1
{
	Send, +{Left}
} 
else if lalt_m_presses = 2 
{
	Send, !+{Left}
} 
else if lalt_m_presses = 3
{
	;
}
lalt_m_presses = 0
return
; 8.11.2 单击实现 Shift + Right; 双击实现 Next Element
LAlt & /:: 
if lalt_slash_presses > 0 
{
	lalt_slash_presses += 1
	return
}
lalt_slash_presses = 1
SetTimer, KeyLAltSlash, 250
return

KeyLAltSlash:
SetTimer, KeyLAltSlash, Off
if lalt_slash_presses = 1
{
	Send, +{Right}
} 
else if lalt_slash_presses = 2 
{
	Send, !+{Right}
} 
else if lalt_slash_presses = 3
{
	;
}
lalt_slash_presses = 0
return
; 8.11.3 单击实现 Shift + Up; 双击实现 Enclosing Element
LAlt & ,:: 
if lalt_comma_presses > 0 
{
	lalt_comma_presses += 1
	return
}
lalt_comma_presses = 1
SetTimer, KeyLAltComma, 250
return

KeyLAltComma:
SetTimer, KeyLAltComma, Off
if lalt_comma_presses = 1
{
	Send, +{Up}
} 
else if lalt_comma_presses = 2 
{
	Send, !+{Up}
} 
else if lalt_comma_presses = 3
{
	;
}
lalt_comma_presses = 0
return
; 8.11.4 单击实现 Shift + Down; 双击实现 Restoe Last Selection
LAlt & .::
if lalt_period_presses > 0 
{
	lalt_period_presses += 1
	return
}
lalt_period_presses = 1
SetTimer, KeyLAltPeriod, 250
return

KeyLAltPeriod:
SetTimer, KeyLAltPeriod, Off
if lalt_period_presses = 1
{
	Send, +{Down}
} 
else if lalt_period_presses = 2 
{
	Send, !+{Down}
} 
else if lalt_period_presses = 3
{
	;
}
lalt_period_presses = 0
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 8.12 使用热字串模拟 STS 下面的快捷键
; Override / Implement Methods
:*:;oi::                    
Send, !+sv
return
; Generate Getters and Setters
:*:;gs::                  
Send, !+sr
return
; Generate hashCode() and equals()
:*:;he::                  
Send, !+sh
return
; Generate toString()
:*:;ts::                  
Send, !+ss
return 
; Generate Constructor using Fields
:*:;cf::                  
Send, !+so
return
; Generate Constructors from SuperClass
:*:;cs::                  
Send, !+sc
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 8.13 
; 8.13.1 "' + q, w, e, r, t (单击, 双击, 三击)" 模拟 STS 环境下的快捷键
' & q::
if quote_q_presses > 0 
{
	quote_q_presses += 1
	return
}
quote_q_presses = 1
SetTimer, KeyQuoteQ, 250
return

KeyQuoteQ:
SetTimer, KeyQuoteQ, Off
if quote_q_presses = 1
{
	Send, ^q 
} 
else if quote_q_presses = 2 
{
	;
} 
else if quote_q_presses = 3
{
	;
}
quote_q_presses = 0
return




return  	; #IfWinActive, ahk_class SWT_Window0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 8. 其它程序的上下文里模拟快捷键
#IfWinActive, ahk_class MainWindow
; 双击实现执行
Space & r::
if space_r_presses > 0 
{
	space_r_presses += 1
	return
}
space_r_presses = 1
SetTimer, KeySpaceR2, 250
return

KeySpaceR2:
SetTimer, KeySpaceR2, Off
if space_r_presses = 1 
{
	
} 
else if space_r_presses = 2 
{
	Send, {F9}
} 
else if space_r_presses = 3
{
	;
}
space_r_presses = 0
return

; 列出所有标签
Capslock & Space:: Send, ^{Space}
; 列出匹配标签
Capslock & Enter:: Send, ^{Enter}

#IfWinActive, ahk_class ConsoleWindowClass
Capslock & m:: Send, {BackSpace}
return

#IfWinActive, ahk_class TXGuiFoundation
Space & Enter:: Send, ^{Enter}
return

/*
; 映射 Vim 下的快捷键
#IfWinActive, ahk_class Vim
; Scrolling the Screen.
; Scroll forward one screen.
Capslock & f:: 
SetCapsLockState, AlwaysOff
Send, ^f
return
; Scroll backward one screen.
Capslock & b::
SetCapsLockState, AlwaysOff
Send, ^b
return
; Scroll forward half screen.
Capslock & d::
SetCapsLockState, AlwaysOff
Send, ^d
return
; Scroll backward half screen. 
Capslock & u::
SetCapsLockState, AlwaysOff
Send, ^u
return
; Scroll the screen up one line.
Capslock & e::
SetCapsLockState, AlwaysOff
Send, ^e
return
; Scroll the screen down one line.
Capslock & y::
SetCapsLockState, AlwaysOff
Send, ^y
return
; Redrawing the screen
Capslock & l::
SetCapsLockState, AlwaysOff
Send, ^l
return
; Display current number
Capslock & g::
SetCapsLockState, AlwaysOff
Send, ^g
return
; the Command about the window
Capslock & w::
SetCapsLockState, AlwaysOff
Send, ^w
return

return
*/

#IfWinActive, ahk_class Chrome_WidgetWin_1
$Enter::
if enter_presses > 0 
{
	enter_presses += 1
	return
}
enter_presses = 1
SetTimer, KeyEnter, 200
return

KeyEnter:
SetTimer, KeyEnter, Off
if enter_presses = 1
{
	Send, +{Enter}
} 
else if enter_presses = 2 
{
	Send, {Enter}
} 
else if enter_presses = 3
{
	;
}
enter_presses = 0
return
/*
Capslock & s:: 
input_num := DllCall("GetKeyboardLayout","UINT",DllCall("GetWindowThreadProcessId","UINT",WinActive("A"),"UINTP",0),UInt)
if (input_num = 67699721) 
{
    Send, ^s 
}
else
{
    Send, ^s#{Space}
}
return

Capslock & m::
if capslock_m_presses > 0 +-zz 
{
	capslock_m_presses += 1
	return
}
capslock_m_presses = 1
SetTimer, KeyCapslockM, 250
return

KeyCapslockM:
SetTimer, KeyCapslockM, Off
if capslock_m_presses = 1 
{
	Send, {BackSpace}
} 
else if capslock_m_presses = 2 
{
	Send, ^{BackSpace}
} 
else if capslock_m_presses = 3
{
	;
}
capslock_m_presses = 0
return
*/	



