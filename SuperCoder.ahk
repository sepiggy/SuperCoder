#NoEnv
SendMode Input
CustomColor = EEAA99
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow +E0x20
Gui, Color, %CustomColor%
Gui, Font, s46
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
Sleep 50
; 1. 初始化操作
; 1.1 Function: 返回当前的语言
GetInputNum()
{
	SetCapsLockState, AlwaysOff
	return DllCall("GetKeyboardLayout","UINT",DllCall("GetWindowThreadProcessId","UINT",WinActive("A"),"UINTP",0),UInt)
}

; 1.2 Function: 若当前语言是中文, 则将其转化为英文
TransformLanguage()
{
	input_num := GetInputNum()
    if (input_num <> 67699721) 
    {        
        Send, #{Space} 
    }
}

; 1.3 初始化 Capslock 键
;     单击 Capslock 键模拟 ESC 键 (中英文状态下都有效)
$Capslock::
SetCapsLockState, AlwaysOff
if caps_presses > 0 
{
    caps_presses += 1
    return
}
caps_presses = 1
SetTimer, KeyCaps, 1
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
	;
}
caps_presses = 0  
return

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
else if tab_presses > 2
{
    ;
}
tab_presses = 0
return

; 1.5 初始化 Space 键
$Space:: Send, {Space}

; 1.6 初始化 LAlt 实现中英文切换 
$LAlt:: Send, #{Space}

; 1.7 屏蔽 RShift 键
RShift:: return

; 1.8 初始化 RControl, 热字串输入窗口
RControl::
InputBox, OutputVar , HotString Input, `;zh `124
return

; 1.9 Function to run a program or activate an already running instance 
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

; 1.10 脚本相关
; 1.10.1 重载                
RControl & r:: Reload

; 1.10.2 使用 ST 编辑脚本
RControl & e:: 
Run, C:\Program Files\Sublime Text 3x64\sublime_text.exe C:\Users\JiaMingSheng\Documents\SuperCoder.ahk
return

; 1.10.3 打开帮助
RControl & h:: Run C:\Program Files\AutoHotkey\AutoHotkey_CN.chm

; 1.10.4 打开 Window Spy
RControl & s:: Run C:\Program Files\AutoHotkey\AU3_Spy.exe

; 1.11 初始化 MButton 键
$MButton:: Send, {MButton}

; 1.12 屏幕显示语言信息函数


; 2. 映射数字键, 功能键, 以及 Windows + 数字键
; 2.1 ; + 字母键 映射数字键
$`;:: Send, `;
`; & i:: Send, 1
`; & z:: Send, 2
`; & m:: Send, 3
`; & f:: Send, 4
`; & v:: Send, 5
`; & s:: Send, 6
`; & q:: Send, 7
`; & b:: Send, 8
`; & n:: Send, 9
`; & o:: Send, 0

; 2.2 ' + 字母键 映射功能键
$':: Send, '
' & i:: Send, {F1}
' & z:: Send, {F2}
' & m:: Send, {F3}
' & f:: Send, {F4}
' & v:: Send, {F5}
' & s:: Send, {F6}
' & q:: Send, {F7}
' & b:: Send, {F8}
' & n:: Send, {F9}
' & o:: Send, {F10}
' & h:: Send, {F11}
' & r:: Send, {F12}

; 2.3 "3 + 数字 (单击)" 模拟 "Windows + Ctrl + 数字"
;     打开桌面，并切换到固定到任务栏的位于该数字所表示位置的应用的最后一个活动窗口               
;     "3 + 数字 (双击)" 模拟 "Windows + Alt + 数字"
;     打开桌面，并打开固定到任务栏的位于该数字所表示位置的应用的跳转列表
;     "3 + 数字 (多击)" 模拟 "Windows + Control + Shift + 数字"
;     打开桌面，并以管理员身份打开位于任务栏上给定位置的应用的新实例
$3:: Send, {3}
3 & j::
if 3_j_presses > 0 
{
	3_j_presses += 1
	return
}
3_j_presses = 1
SetTimer, Key3J, 350
return

Key3J:
SetTimer, Key3J, Off
if 3_j_presses = 1 
{
	Send, #^1
} 
else if 3_j_presses = 2 
{
	Send, #!1
} 
else if 3_j_presses > 2
{
	Send, #^+1
}
3_j_presses = 0
return

3 & k::
if 3_k_presses > 0 
{
	3_k_presses += 1
	return
}
3_k_presses = 1
SetTimer, Key3K, 350
return

Key3K:
SetTimer, Key3K, Off
if 3_k_presses = 1 
{
	Send, #^2
} 
else if 3_k_presses = 2 
{
	Send, #!2
} 
else if 3_k_presses > 2
{
	Send, #^+2
}
3_k_presses = 0
return

3 & l::
if 3_l_presses > 0 
{
	3_l_presses += 1
	return
}
3_l_presses = 1
SetTimer, Key3L, 350
return

Key3L:
SetTimer, Key3L, Off
if 3_l_presses = 1 
{
	Send, #^3
} 
else if 3_l_presses = 2 
{
	Send, #!3
} 
else if 3_l_presses > 2
{
	Send, #^+3
}
3_l_presses = 0
return

3 & `;::
if 3_semicolon_presses > 0 
{
	3_semicolon_presses += 1
	return
}
3_semicolon_presses = 1
SetTimer, Key3Semicolon, 350
return

Key3Semicolon:
SetTimer, Key3Semicolon, Off
if 3_semicolon_presses = 1 
{
	Send, #^4
} 
else if 3_semicolon_presses = 2 
{
	Send, #!4
} 
else if 3_semicolon_presses > 2
{
	Send, #^+4
}
3_semicolon_presses = 0
return

3 & u::
if 3_u_presses > 0 
{
	3_u_presses += 1
	return
}
3_u_presses = 1
SetTimer, Key3U, 350
return

Key3U:
SetTimer, Key3U, Off
if 3_u_presses = 1 
{
	Send, #^5
} 
else if 3_u_presses = 2 
{
	Send, #!5
} 
else if 3_u_presses > 2
{
	Send, #^+5
}
3_u_presses = 0
return

3 & i::
if 3_i_presses > 0 
{
	3_i_presses += 1
	return
}
3_i_presses = 1
SetTimer, Key3I, 350
return

Key3I:
SetTimer, Key3I, Off
if 3_i_presses = 1 
{
	Send, #^6
} 
else if 3_i_presses = 2 
{
	Send, #!6
} 
else if 3_i_presses > 2
{
	Send, #^+6
}
3_i_presses = 0
return

3 & o::
if 3_o_presses > 0 
{
	3_o_presses += 1
	return
}
3_o_presses = 1
SetTimer, Key3O, 350
return

Key3O:
SetTimer, Key3O, Off
if 3_o_presses = 1 
{
	Send, #^7
} 
else if 3_o_presses = 2 
{
	Send, #!7
} 
else if 3_o_presses > 2
{
	Send, #^+7
}
3_o_presses = 0
return

3 & p::
if 3_p_presses > 0 
{
	3_p_presses += 1
	return
}
3_p_presses = 1
SetTimer, Key3P, 350
return

Key3P:
SetTimer, Key3P, Off
if 3_p_presses = 1 
{
	Send, #^8
} 
else if 3_p_presses = 2 
{
	Send, #!8
} 
else if 3_p_presses > 2
{
	Send, #^+8
}
3_p_presses = 0
return

3 & m::
if 3_m_presses > 0 
{
	3_m_presses += 1
	return
}
3_m_presses = 1
SetTimer, Key3M, 350
return

Key3M:
SetTimer, Key3M, Off
if 3_m_presses = 1 
{
	Send, #^9
} 
else if 3_m_presses = 2 
{
	Send, #!9
} 
else if 3_m_presses > 2
{
	Send, #^+9
}
3_m_presses = 0
return

3 & ,::
if 3_comma_presses > 0 
{
	3_comma_presses += 1
	return
}
3_comma_presses = 1
SetTimer, Key3Comma, 350
return

Key3Comma:
SetTimer, Key3Comma, Off
if 3_comma_presses = 1 
{
	Send, #^0
} 
else if 3_comma_presses = 2 
{
	Send, #!0
} 
else if 3_comma_presses > 2
{
	Send, #^+0
}
3_comma_presses = 0
return

; 3. "Space + 字母 (单击)" 模拟输入符号
Space & `:: Send, {~}       ; ~
Space & w:: Send, {`#}      ; well(井号键)
Space & e:: Send, {=}       ; equal

Space & a:: Send, {&}       ; and
Space & s:: Send, {$}       ; $

Space & z:: Send, {@}       ; @ 代表"在"
Space & x:: Send, {*}       ; x (乘号)
Space & v:: Send, {^}       ; v 倒过来就是 ^

Space & u:: Send, {_}       ; underline
Space & i:: Send, {\}       ; i 象形 \
Space & o:: Send, {|}       ; or
Space & p:: Send, {+}       ; plus

Space & h:: Send, {-}       ; hyphen

; 单击输入 (; 双击输入 )
Space & j::
if space_j_presses > 0 
{
	space_j_presses += 1
	return
}
space_j_presses = 1
SetTimer, KeySpaceJ, 250
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
else if space_j_presses > 2
{
	;
}
space_j_presses = 0
return

; 单击输入 {; 双击输入 }
Space & k::
if space_k_presses > 0 
{
	space_k_presses += 1
	return
}
space_k_presses = 1
SetTimer, KeySpaceK, 250
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
else if space_k_presses > 2
{
	;
}
space_k_presses = 0
return

; 单击输入 [; 双击输入 ]
Space & l::
if space_l_presses > 0 
{
	space_l_presses += 1
	return
}
space_l_presses = 1
SetTimer, KeySpaceL, 250
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
	;
}
space_l_presses = 0
return

Space & `;:: Send, {:}      ; :
Space & ':: Send, {"}       ; "

Space & n:: Send, {!}       ; not
Space & m:: Send, {`%}      ; mod
Space & ,:: Send, {<}       ; <
Space & .:: Send, {>}       ; >
Space & /:: Send, {?}       ; ?


; 4. "Capslock + 字母 (单击, 双击, 多击)" 模拟对所有窗口程序都适用的公用功能键
; 4.1 "Capslock + q, w, e, r, t (单击, 双击, 多击)" 模拟公用功能键
; 4.1.1 截图 (需要在 PicPick 里设置相应的快捷键)
Capslock & q:: 
TransformLanguage()
SetCapsLockState, AlwaysOff
Send, ^!+x
return

; 4.1.2 关闭
Capslock & w:: 
TransformLanguage()
SetCapsLockState, AlwaysOff
Send, ^w
return

; 4.1.3 重命名
Capslock & e:: 
SetCapsLockState, AlwaysOff
Send, {F2}
return

; 4.1.4 刷新
Capslock & r:: 
SetCapsLockState, AlwaysOff
Send, {F5}
return

; 4.1.5 替换
Capslock & t:: 
SetCapsLockState, AlwaysOff
Send, ^h
return

; 4.2 "Capslock + a, s, d, f, g (单击, 双击, 多击)" 模拟公用功能键
; 4.2.1 全选
Capslock & a::
SetCapsLockState, AlwaysOff 
Send, ^a
return

; 4.2.2 保存
Capslock & s:: 
TransformLanguage()
SetCapsLockState, AlwaysOff
Send, ^s
return

; 4.2.3 删除
Capslock & d:: 
SetCapsLockState, AlwaysOff
Send, {delete}
return

; 4.2.4 搜索
Capslock & f:: 
SetCapsLockState, AlwaysOff
Send, ^f
return

; 4.2.5 使用 Google 搜索选中内容
Capslock & g::
SetCapsLockState, AlwaysOff
Send, ^c
Run http://www.google.com/search?q=%clipboard%
return 

; 4.3 "Capslock + z, x, c, v, b (单击, 双击, 多击)" 模拟公用功能键
; 4.3.1 撤销
Capslock & z:: 
SetCapsLockState, AlwaysOff
Send, ^z
return

; 4.3.2 剪切
Capslock & x:: 
SetCapsLockState, AlwaysOff
Send, ^x
return

; 4.3.3 复制
Capslock & c:: 
SetCapsLockState, AlwaysOff
Send, ^c
return

; 4.3.4 粘贴
Capslock & v:: 
SetCapsLockState, AlwaysOff
Send, ^v
return

; 4.3.5 使用 Baidu 搜索选中内容
Capslock & b::
SetCapsLockState, AlwaysOff
Send, ^c
Run http://www.baidu.com/s?wd=%clipboard%
return

; 4.4 "Capslock + y, u, i, o, p (单击, 双击, 多击)" 模拟公用功能键
; 4.4.1 重做
Capslock & y:: 
SetCapsLockState, AlwaysOff
Send, ^y
return

; 4.4.2 单击模拟 Home 键; 双击模拟 Ctrl + Home 键
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
else if capslock_i_presses > 2
{
	;
}
capslock_i_presses = 0
return

; 4.4.3 单击模拟 End 键; 双击模拟 Ctrl + End 键
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
else if capslock_o_presses > 2
{
	;
}
capslock_o_presses = 0
return

; 4.4.4 单击模拟 PgUp 键; 双击模拟 Ctrl + Pgup 键
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
else if capslock_u_presses > 2
{
	;
}
capslock_u_presses = 0
return

; 4.4.5 单击模拟 PgDn 键; 双击模拟 Ctrl + PgDn 键
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
else if capslock_p_presses > 2
{
	;
}
capslock_p_presses = 0
return

; 4.5 "Capslock + h, j, k, l, ; (单击, 双击, 多击)" 模拟公用功能键
; 4.5.1 单击模拟 Left 键; 双击模拟 Ctrl + Left 键
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
else if capslock_h_presses > 2
{
	;
}
capslock_h_presses = 0
return

; 4.5.2 单击模拟 Right 键; 双击模拟 Ctrl + Right 键
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
else if capslock_l_presses > 2
{
	;
}
capslock_l_presses = 0
return

; 4.5.3 单击模拟 Down 键; 双击模拟 4 次 Down 键
Capslock & j::
SetCapsLockState, AlwaysOff
if capslock_j_presses > 0 
{
	capslock_j_presses += 1
	return
}
capslock_j_presses = 1
SetTimer, KeyCapslockJ, 200
return

KeyCapslockJ:
SetTimer, KeyCapslockJ, Off
if capslock_j_presses = 1 
{
	Send, {Down}
} 
else if capslock_j_presses = 2 
{
	Send, {Down 4}
} 
else if capslock_j_presses > 2
{
	;
}
capslock_j_presses = 0
return

; 4.5.4 单击模拟 Up 键; 双击模拟 4 次 Up 键
Capslock & k::
SetCapsLockState, AlwaysOff
if capslock_k_presses > 0 
{
	capslock_k_presses += 1
	return
}
capslock_k_presses = 1
SetTimer, KeyCapslockK, 200
return

KeyCapslockK:
SetTimer, KeyCapslockK, Off
if capslock_k_presses = 1 
{
	Send, {Up}
} 
else if capslock_k_presses = 2 
{
	Send, {Up 4}
} 
else if capslock_k_presses > 2
{
	;
}
capslock_k_presses = 0
return

; 4.5.5 单击模拟 WheelDown 键; 双击模拟 Ctrl + WheelDown 键
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
	Send, {WheelDown}
} 
else if capslock_semicolon_presses = 2 
{
	Send, ^{WheelDown}
} 
else if capslock_semicolon_presses > 2
{
	;
}
capslock_semicolon_presses = 0
return

; 4.5.6 单击模拟 WheelUp 键; 双击模拟 Ctrl + WheelUp 键
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
	Send, {WheelUp}
} 
else if capslock_quote_presses = 2 
{
	Send, ^{WheelUp}
} 
else if capslock_quote_presses > 2
{
	;
}
capslock_quote_presses = 0
return

; 4.6 "Capslock + n, m, comma, full stop, slash (单击, 双击, 多击)" 模拟公用功能键
; 4.6.1 单击模拟 Ctrl + n 键
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
	;
} 
else if capslock_n_presses > 2
{
	;
}
capslock_n_presses = 0
return

; 4.6.2 单击模拟 BackSpace 键
Capslock & m:: 
SetCapsLockState, AlwaysOff
Send, {BackSpace}
return

; 4.6.3 单击模拟 Delete 键, 双击模拟 Ctrl + Delete 键
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
else if capslock_comma_presses > 2
{
	;
}
capslock_comma_presses = 0
return

; 4.6.4 切换中 / 英文标点 		 
Capslock & .:: 
SetCapsLockState, AlwaysOff
input_num := GetInputNum()
if (input_num <> 67699721) 
{
    Send, ^. 
}
return

; 4.7 Capslock + ` 模拟 Capslock 键
Capslock & `::
GetKeyState, CapsLockState, Capslock, T                              
if CapsLockState = D                                              
    SetCapsLockState, AlwaysOff                                  
else                                                            
    SetCapsLockState, AlwaysOn                                 
KeyWait, ``                                                   
return 

; 4.8 Capslock + Space 模拟滚轮, 单击向下滚动; 双击向上滚动
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
else if capslock_space > 2
{
	;
}
capslock_space = 0
return

; 4.9 Capslock + RButton 模拟 AltTab; Capslock + LButton 模拟 ShiftAltTab
Capslock & ~RButton:: AltTab
Capslock & ~LButton:: ShiftAltTab

; 4.10 Capslock + MButton
;      单击在窗口最大化和正常状态间切换
;      双击最小化窗口
;      多击关闭窗口
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
else if capslock_mbutton_presses > 2
{
    Send, !{F4}
}
capslock_mbutton_presses = 0
return 


; 5. "Tab + 字母 (双击或多击)" 模拟 Windows + 字母键 或 打开应用程序    
; 5.1 "Tab + q, w, e, r, t" 模拟 Windows + 字母键 或 打开应用程序
; 5.1.1 单击打开 cortana (Win 10); 双击打开 QQ
Tab & q::
if Tab_q_presses > 0 
{
	Tab_q_presses += 1
	return
}
Tab_q_presses = 1
SetTimer, KeyTabQ, 250
return

KeyTabQ:
SetTimer, KeyTabQ, Off
if Tab_q_presses = 1 
{
	Send, #q
} 
else if Tab_q_presses = 2 
{
	DetectHiddenWindows, On
	SetTitleMatchMode, 2
	WinGet, winid, ID, QQ
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
		RunOrActivateProgram("C:\Program Files (x86)\Tencent\QQLite\Bin\QQ.exe")
	}
	DetectHiddenWindows, Off
} 
else if Tab_q_presses > 2
{
	;
}
Tab_q_presses = 0
return

; 5.1.2 单击打开 Workspace 文件夹; 双击触发 Toggle 微信 (需在微信里设置)
Tab & w::
if Tab_w_presses > 0 
{
	Tab_w_presses += 1
	return
}
Tab_w_presses = 1
SetTimer, KeyTabW, 250
return

KeyTabW:
SetTimer, KeyTabW, Off
if Tab_w_presses = 1 
{
	Run C:\Users\JiaMingSheng\Workspaces
	WinMaximize, A
} 
else if Tab_w_presses = 2 
{
	Send, ^!w
} 
else if Tab_w_presses > 2
{
	;
}
Tab_w_presses = 0
return

; 5.1.3 单击打开资源管理器; 双击触发 Toggle Everything (需设置)
Tab & e::
TransformLanguage()
if Tab_e_presses > 0 
{
	Tab_e_presses += 1
	return
}
Tab_e_presses = 1
SetTimer, KeyTabE, 250
return

KeyTabE:
SetTimer, KeyTabE, Off
if Tab_e_presses = 1 
{
	Send, #e
} 
else if Tab_e_presses = 2 
{
	Send, #!e
} 
else if Tab_e_presses > 2
{
	;
}
Tab_e_presses = 0
return

; 5.1.4 单击打开回收站; 双击打开 reference; 多击打开运行菜单
Tab & r::
TransformLanguage()
if Tab_r_presses > 0 
{
	Tab_r_presses += 1
	return
}
Tab_r_presses = 1
SetTimer, KeyTabR, 450
return

KeyTabR:
SetTimer, KeyTabR, Off
if Tab_r_presses = 1 
{
	Run explorer.exe ::{645FF040-5081-101B-9F08-00AA002F954E} 
} 
else if Tab_r_presses = 2 
{
	Run C:\Users\JiaMingSheng\Documents\me\reference
} 
else if Tab_r_presses > 2
{
	Send, #r
}
Tab_r_presses = 0
return

; 5.1.5 单击打开任务管理器
Tab & t::
TransformLanguage()
if Tab_t_presses > 0 
{
	Tab_t_presses += 1
	return
}
Tab_t_presses = 1
SetTimer, KeyTabT, 250
return

KeyTabT:
SetTimer, KeyTabT, Off
if Tab_t_presses = 1 
{
	if WinExist Windows 任务管理器 
	WinActivate 
	else 
	Run taskmgr.exe 
} 
else if Tab_t_presses = 2 
{
	;
} 
else if Tab_t_presses > 2
{
	;
}
Tab_t_presses = 0
return

; 5.2 "Tab + a, s, d, f, g" 模拟 Windows + 字母键 或 打开应用程序
; 5.2.1 单击打开操作中心
Tab & a::
TransformLanguage()
if Tab_a_presses > 0 
{
	Tab_a_presses += 1
	return
}
Tab_a_presses = 1
SetTimer, KeyTabA, 250
return

KeyTabA:
SetTimer, KeyTabA, Off
if Tab_a_presses = 1 
{
	Send, #a
} 
else if Tab_a_presses = 2 
{
	;
} 
else if Tab_a_presses > 2
{
	;
}
Tab_a_presses = 0
return

; 5.2.2 单击打开开始菜单; 双击打开系统信息; 三击打开 STS
Tab & s::
TransformLanguage()
if Tab_s_presses > 0 
{
	Tab_s_presses += 1
	return
}
Tab_s_presses = 1
SetTimer, KeyTabS, 400
return

KeyTabS:
SetTimer, KeyTabS, Off
if Tab_s_presses = 1 
{
	Send, ^{Esc}
} 
else if Tab_s_presses = 2 
{
	Send, #{Pause} 
} 
else if Tab_s_presses > 2
{
	Run C:\Program Files (x86)\spring-tool-suite-3.7.2.RELEASE-e4.5.1-win32-x86_64\sts-bundle\sts-3.7.2.RELEASE\STS.exe
}
Tab_s_presses = 0
return

; 5.2.3 单击显示和隐藏桌面; 双击打开下载文件夹并最大化
Tab & d::
TransformLanguage()
if Tab_d_presses > 0 
{
	Tab_d_presses += 1
	return
}
Tab_d_presses = 1
SetTimer, KeyTabD, 250
return

KeyTabD:
SetTimer, KeyTabD, Off
if Tab_d_presses = 1 
{
	Send, #d
} 
else if Tab_d_presses = 2 
{
	Run C:\Users\JiaMingSheng\Downloads
	WinMaximize, A
} 
else if Tab_d_presses > 2
{
	;
}
Tab_d_presses = 0
return

; 5.2.4
Tab & f::
if Tab_f_presses > 0 
{
	Tab_f_presses += 1
	return
}
Tab_f_presses = 1
SetTimer, KeyTabF, 250
return

KeyTabF:
SetTimer, KeyTabF, Off
if Tab_f_presses = 1 
{
	;
} 
else if Tab_f_presses = 2 
{
	;
} 
else if Tab_f_presses > 2
{
	;
}
Tab_f_presses = 0
return

; 5.2.5
Tab & g::
if Tab_g_presses > 0 
{
	Tab_g_presses += 1
	return
}
Tab_g_presses = 1
SetTimer, KeyTabG, 250
return

KeyTabG:
SetTimer, KeyTabG, Off
if Tab_g_presses = 1 
{
	;
} 
else if Tab_g_presses = 2 
{
	;
} 
else if Tab_g_presses > 2
{
	;
}
Tab_g_presses = 0
return

; 5.3 "Tab + z, x, c, v, b" 模拟 Windows + 字母键 或 打开应用程序
; 5.3.1
Tab & z::
if Tab_z_presses > 0 
{
	Tab_z_presses += 1
	return
}
Tab_z_presses = 1
SetTimer, KeyTabZ, 250
return

KeyTabZ:
SetTimer, KeyTabZ, Off
if Tab_z_presses = 1 
{
	;
} 
else if Tab_z_presses = 2 
{
	;
} 
else if Tab_z_presses > 2
{
	;
}
Tab_z_presses = 0
return

; 5.3.2 单击打开 “快速链接” 菜单
Tab & x::
TransformLanguage()
if Tab_x_presses > 0 
{
	Tab_x_presses += 1
	return
}
Tab_x_presses = 1
SetTimer, KeyTabX, 250
return

KeyTabX:
SetTimer, KeyTabX, Off
if Tab_x_presses = 1 
{
	Send, #x
} 
else if Tab_x_presses = 2 
{
	
} 
else if Tab_x_presses > 2
{
	;
}
Tab_x_presses = 0
return

; 5.3.3 单击打开 CMD; 双击打开 Chrome; 多击打开控制面板
Tab & c::
TransformLanguage()
if Tab_c_presses > 0 
{
	Tab_c_presses += 1
	return
}
Tab_c_presses = 1
SetTimer, KeyTabC, 450
return

KeyTabC:
SetTimer, KeyTabC, Off
if Tab_c_presses = 1 
{
	Run Cmd
} 
else if Tab_c_presses = 2 
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
else if Tab_c_presses > 2
{
	Run Control
}
Tab_c_presses = 0
return

; 5.3.4
Tab & v::
if Tab_v_presses > 0 
{
	Tab_v_presses += 1
	return
}
Tab_v_presses = 1
SetTimer, KeyTabV, 250
return

KeyTabV:
SetTimer, KeyTabV, Off
if Tab_v_presses = 1 
{
	
} 
else if Tab_v_presses = 2 
{
	;
} 
else if Tab_v_presses > 2
{
	;
}
Tab_v_presses = 0
return

; 5.3.5 单击将焦点设置到通知区域
Tab & b::
TransformLanguage()
if Tab_b_presses > 0 
{
	Tab_b_presses += 1
	return
}
Tab_b_presses = 1
SetTimer, KeyTabB, 250
return

KeyTabB:
SetTimer, KeyTabB, Off
if Tab_b_presses = 1 
{
	Send, #b{Enter}
} 
else if Tab_b_presses = 2 
{
	
} 
else if Tab_b_presses > 2
{
	;
}
Tab_b_presses = 0
return

; 5.4 "Tab + y, u, i, o, p" 模拟 Windows + 字母键 或 打开应用程序
; 5.4.1 
Tab & y::
if Tab_y_presses > 0 
{
	Tab_y_presses += 1
	return
}
Tab_y_presses = 1
SetTimer, KeyTabY, 250
return

KeyTabY:
SetTimer, KeyTabY, Off
if Tab_y_presses = 1 
{
	
} 
else if Tab_y_presses = 2 
{
	;
} 
else if Tab_y_presses > 2
{
	;
}
Tab_y_presses = 0
return

; 5.4.2
Tab & u::
if Tab_u_presses > 0 
{
	Tab_u_presses += 1
	return
}
Tab_u_presses = 1
SetTimer, KeyTabU, 250
return

KeyTabU:
SetTimer, KeyTabU, Off
if Tab_u_presses = 1 
{
	
} 
else if Tab_u_presses = 2 
{
	;
} 
else if Tab_u_presses > 2
{
	;
}
Tab_u_presses = 0
return

; 5.4.3 单击打开 “设置”; 双击模拟 Windows + Home 键
Tab & i::
if Tab_i_presses > 0 
{
	Tab_i_presses += 1
	return
}
Tab_i_presses = 1
SetTimer, KeyTabI, 250
return

KeyTabI:
SetTimer, KeyTabI, Off
if Tab_i_presses = 1 
{
	Send, #i
} 
else if Tab_i_presses = 2 
{
	Send, #{Home}
} 
else if Tab_i_presses > 2
{
	;
}
Tab_i_presses = 0
return

; 5.4.4
Tab & o::
if Tab_o_presses > 0 
{
	Tab_o_presses += 1
	return
}
Tab_o_presses = 1
SetTimer, KeyTabO, 250
return

KeyTabO:
SetTimer, KeyTabO, Off
if Tab_o_presses = 1 
{
} 
else if Tab_o_presses = 2 
{
	;
} 
else if Tab_o_presses > 2
{
	;
}
Tab_o_presses = 0
return

; 5.4.5 单击用管理员模式启动 PowerShell, 双击打开投影
Tab & p::
TransformLanguage()
if Tab_p_presses > 0 
{
	Tab_p_presses += 1
	return
}
Tab_p_presses = 1
SetTimer, KeyTabP, 250
return

KeyTabP:
SetTimer, KeyTabP, Off
if Tab_p_presses = 1 
{
	Send, #xa
} 
else if Tab_p_presses = 2 
{
	Send, #p
} 
else if Tab_p_presses > 2
{
	;
}
Tab_p_presses = 0
return

; 5.4 "Tab + h, j, k, l, semicolon, quote" 模拟 Windows + 字母键 或 打开应用程序
; 5.4.1 单击模拟 Windows + Left; 双击模拟 Windows + Shift + Left
Tab & h::
if Tab_h_presses > 0 
{
	Tab_h_presses += 1
	return
}
Tab_h_presses = 1
SetTimer, KeyTabH, 250
return

KeyTabH:
SetTimer, KeyTabH, Off
if Tab_h_presses = 1 
{
	Send, #{Left}
} 
else if Tab_h_presses = 2 
{
	Send, #+{Left}
} 
else if Tab_h_presses > 2
{
	
}
Tab_h_presses = 0
return

; 5.4.2 单击模拟 Windows + Right; 双击模拟 Windows + Shift + Right; 多击打开 lib
Tab & l::
if Tab_l_presses > 0 
{
	Tab_l_presses += 1
	return
}
Tab_l_presses = 1
SetTimer, KeyTabL, 400
return

KeyTabL:
SetTimer, KeyTabL, Off
if Tab_l_presses = 1 
{
	Send, #{Right}
} 
else if Tab_l_presses = 2 
{
	Send, #+{Right}
} 
else if Tab_l_presses > 2
{
	Run C:\Users\JiaMingSheng\Documents\me\lib
}
Tab_l_presses = 0
return

; 5.4.3 单击模拟 Windows + Down
Tab & j::
if Tab_j_presses > 0 
{
	Tab_j_presses += 1
	return
}
Tab_j_presses = 1
SetTimer, KeyTabJ, 300
return

KeyTabJ:
SetTimer, KeyTabJ, Off
if Tab_j_presses = 1 
{
	Send, #{Down}
} 
else if Tab_j_presses = 2 
{
	
} 
else if Tab_j_presses > 2
{
	;
}
Tab_j_presses = 0
return

; 5.4.4 单击模拟 Windows + Up
Tab & k::
if Tab_k_presses > 0 
{
	Tab_k_presses += 1
	return
}
Tab_k_presses = 1
SetTimer, KeyTabK, 300
return

KeyTabK:
SetTimer, KeyTabK, Off
if Tab_k_presses = 1 
{
	Send, #{Up}
} 
else if Tab_k_presses = 2 
{
	
} 
else if Tab_k_presses > 2
{
	;
}
Tab_k_presses = 0
return

; 5.5 "Tab + n, m, comma, full stop, slash" 模拟 Windows + 字母键 或 打开应用程序
; 5.5.1 单击创建记事本新实例
Tab & n::
if Tab_n_presses > 0 
{
	Tab_n_presses += 1
	return
}
Tab_n_presses = 1
SetTimer, KeyTabN, 250
return

KeyTabN:
SetTimer, KeyTabN, Off
if Tab_n_presses = 1 
{
	Run notepad
} 
else if Tab_n_presses = 2 
{
	;
} 
else if Tab_n_presses > 2
{
	;
}
Tab_n_presses = 0
return

; 5.5.2 单击最小化所有窗口; 双击打开远程桌面连接
Tab & m::
TransformLanguage()
if Tab_m_presses > 0 
{
	Tab_m_presses += 1
	return
}
Tab_m_presses = 1
SetTimer, KeyTabM, 250
return

KeyTabM:
SetTimer, KeyTabM, Off
if Tab_m_presses = 1 
{
	Send, #m
} 
else if Tab_m_presses = 2 
{
	Run mstsc             
} 
else if Tab_m_presses > 2
{
	;
}
Tab_m_presses = 0
return

; 5.5.5 单击提高音量, 双击降低音量, 三击静音
Tab & /::
if Tab_slash_presses > 0 
{
	Tab_slash_presses += 1
	return
}
Tab_slash_presses = 1
SetTimer, KeyTabSlash, 400
return

KeyTabSlash:
SetTimer, KeyTabSlash, Off
if Tab_slash_presses = 1 
{
	Send, {Volume_Up}
} 
else if Tab_slash_presses = 2 
{
	Send, {Volume_Down}
} 
else if Tab_slash_presses > 2
{
	Send, {Volume_Mute}
}
Tab_slash_presses = 0
return

; 6. 其它系统热键映射
; 6.1 ` + 字母键模拟 Shift + 方向键
$`:: Send, ``
` & h:: Send, +{Left}
` & l:: Send, +{Right}
` & j:: Send, +{Down}
` & k:: Send, +{Up}
` & i:: Send, +{Home}
` & o:: Send, +{End}
` & u:: Send, +{Pgup}
` & p:: Send, +{PgDn}
; 选择整句
` & m::
Send, {Home}
Send, +{End}
return

; 6.2 LAlt + 字母键模拟 Alt + 方向键
LAlt & h:: Send, !{Left}
LAlt & l:: Send, !{Right}
LAlt & j:: Send, !{Down}
LAlt & k:: Send, !{Up}

; 6.3 鼠标滚轮相关
; 6.3.1 按住左 Capslock 键并转动滚轮时进行水平滚动而不是垂直滚动
; 向左滚动
Capslock & WheelUp::
TransformLanguage()
ControlGetFocus, fcontrol, A
Loop 6  ; <-- 增加这个值来加快滚动速度.
    SendMessage, 0x114, 0, 0, %fcontrol%, A  ; 0x114 是 WM_HSCROLL, 它后面的 0 是 SB_LINELEFT.
return

; 向右滚动
Capslock & WheelDown::  
ControlGetFocus, fcontrol, A
Loop 6  ; <-- 增加这个值来加快滚动速度.
    SendMessage, 0x114, 1, 0, %fcontrol%, A  ; 0x114 是 WM_HSCROLL, 它后面的 1 是 SB_LINERIGHT.
return

; 6.4 LAlt + Space 兼容 potplayer 全局快捷键 (需要在 potplayer 里设置)
LAlt & Space:: Send, ^!+{Space}  ; 暂停
Shift & Space:: Send, ^+{Space}  ; 后退

; 6.5 Capslock + LAlt 键实现 AppsKey
Capslock & LAlt:: 
SetCapsLockState, AlwaysOff
Send, {AppsKey}
return

; 7. 使用热字串映射字符串, 网址, 程序
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
Run http://10.1.7.36/chinapic/admin.php?
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

*~sc163::SetNumlockState, On

; 8. "Capslock + 字母 (单击, 双击, 多击)" 模拟 STS 环境下的快捷键
;    "Space + 字母 (单击, 双击, 多击)" 模拟 STS 环境下的快捷键
#IfWinActive, ahk_class SWT_Window0
; 8.0 "Capslock + Tab, 数字 (单击, 双击, 多击)" 模拟 STS 环境下的快捷键
; 8.0.1 单击实现窗口大小切换
Capslock & Tab:: Send, ^m

; 8.0.2 单击实现 Quick Fix
Capslock & 1:: Send, ^1

; 8.0.3 单击实现 Quick Access
Capslock & 3:: 
TransformLanguage()
Send, ^3
return

; 8.1 "Capslock + q, w, e, r, t (单击, 双击, 多击)" 模拟 STS 环境下的快捷键
; 8.1.1 单击定位到上次编辑的地方; 双击实现 Copy Qualified Name
Capslock & q::
TransformLanguage()
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
	Send, ^q
} 
else if capslock_q_presses = 2 
{
	Send, !ey
} 
else if capslock_q_presses > 2
{
	;
}
capslock_q_presses = 0
return

; 8.1.2 单击实现 Close; 双击实现 Close Others; 多击实现 Close All
Capslock & w::
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
else if capslock_w_presses > 2
{
	Send, ^+w
}
capslock_w_presses = 0
return

; 8.1.3 单击实现重构
Capslock & e::
TransformLanguage()
Send, !+t
return

; 8.1.4 单击实现刷新; 双击实现 Open Resource
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
	Send, {F5}
} 
else if capslock_r_presses = 2 
{
	Send, ^+r
} 
else if capslock_r_presses > 2
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
else if capslock_t_presses > 2
{
	;
}
capslock_t_presses = 0
return

; 8.2 "Capslock + a, s, d, f, g (单击, 双击, 多击)" 模拟 STS 环境下的快捷键
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
else if capslock_a_presses > 2
{
	;
}
capslock_a_presses = 0
return

; 8.2.2 单击实现 Save; 双击实现 Save All
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
	Send, ^+s
} 
else if capslock_s_presses > 2
{
	;
}
capslock_s_presses = 0
return

; 8.2.3 单击实现删除行; 双击模拟 delete 键
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
	Send, ^d
} 
else if capslock_d_presses = 2 
{
	Send, {delete}
} 
else if capslock_d_presses > 2
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
else if capslock_f_presses > 2
{
	;
}
capslock_f_presses = 0
return

; 8.2.5 单击实现将选中的内容使用 Google 搜索
Capslock & g::
TransformLanguage()
if capslock_g_presses > 0 
{
	capslock_g_presses += 1
	return
}
capslock_g_presses = 1
SetTimer, KeyCapslockG, 100
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
	;
} 
else if capslock_g_presses > 2
{
	;
}
capslock_g_presses = 0
return

; 8.3 "Capslock + z, x, c, v, b (单击, 双击, 多击)" 模拟 STS 环境下的快捷键
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
else if capslock_z_presses > 2
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
else if capslock_x_presses > 2
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
else if capslock_c_presses > 2
{
	Send, !+j
}
capslock_c_presses = 0
return

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
else if capslock_v_presses > 2
{
	;
}
capslock_v_presses = 0
return

Capslock & b::
if capslock_b_presses > 0 
{
	capslock_b_presses += 1
	return
}
capslock_b_presses = 1
SetTimer, KeyCapslockB, 250
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
	;
} 
else if capslock_b_presses > 2
{
	;
}
capslock_b_presses = 0
return

; 8.4 "Capslock + j, k, n, Enter (单击, 双击, 多击)" 模拟 STS 环境下的快捷键
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
else if capslock_n_presses > 2
{
	;
}
capslock_n_presses = 0
return

; 8.4.4 Capslock + Enter 实现在当前行下方插入一行; Shift + Enter 实现在当前行上方插入一行
Capslock & Enter:: Send, +{Enter}
Shift & Enter:: Send, ^+{Enter}

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
else if enter_presses > 2
{
	;
}
enter_presses = 0
return
*/

; 8.5 "Space + q, w, e, r, t (单击, 双击, 多击)" 模拟 STS 环境下的快捷键
; 8.5.1 单击实现 Copy Qualified Name
Space & q::
Send, {AppsKey}
Send, y
Send, {Enter}
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
else if space_w_presses > 2
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
else if space_e_presses > 2
{
	;
}
space_e_presses = 0
return

; 8.5.4 单击实现 Rename; 双击实现 Restart Server (需要设置 STS 快捷键)
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
	Send, !+r
} 
else if space_r_presses = 2 
{
	Send, !+qv
	Send, ^!r
} 
else if space_r_presses > 2
{
	;
}
space_r_presses = 0
return

; 8.5.5 单击实现 Toggle Toolbar; 双击实现 Run Junit Test
Space & t::
TransformLanguage()
if space_t_presses > 0 
{
	space_t_presses += 1
	return
}
space_t_presses = 1
SetTimer, KeySpaceT, 250
return

KeySpaceT:
SetTimer, KeySpaceT, Off
if space_t_presses = 1 
{
	Send, !wt
} 
else if space_t_presses = 2 
{
	Send, !+xt
} 
else if space_t_presses > 2
{
	;
}
space_t_presses = 0
return
; 8.6 "Space + a, s, d, f, g (单击, 双击, 多击)" 模拟 STS 环境下的快捷键
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
else if space_a_presses > 2
{
	;
}
space_a_presses = 0
return

; 8.6.2 单击输入符号 $; 双击实现打开 Source 界面; 多击实现 Run on Server
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
	Send, !+s 
} 
else if space_s_presses > 2
{
	Send, !+xr
}
space_s_presses = 0
return

; 8.6.3 单击 Open Declaration; 双击打开 Debug
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
	Send, {F3}
} 
else if space_d_presses = 2 
{
	Send, {F11}
} 
else if space_d_presses > 2
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

; 8.6.4 单击实现 Focus
Space & f::
Send, {F2}
return

; 8.6.5 单击实现 Go to Line
Space & g::
Send, ^l
sleep, 2000
Send, {Enter}
return

; 8.7 "Space + z, x, c, v, b (单击, 双击, 多击)" 模拟 STS 环境下的快捷键
; 8.7.3 双击定位到 Console 视图, 并最大化
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
	;
} 
else if space_c_presses = 2 
{
	Send, !+qc
	Send, ^m
} 
else if space_c_presses > 2
{
	;
}
space_c_presses = 0
return

; 8.7.4 单击输入符号^, 双击定位到 Server 视图(需要在 STS 里设置) 
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
	Send, {^}
} 
else if space_v_presses = 2 
{
	Send, !+qv
	Send, {AppsKey}
} 
else if space_v_presses > 2
{
	;
}
space_v_presses = 0
return

; 8.8 "Space + y, u, i, o, p (单击, 双击, 多击)" 模拟 STS 环境下的快捷键

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
else if space_i_presses > 2
{
	;
}
space_i_presses = 0
return

; 8.8.4 单击输入符号 |; 双击定位到 Outline 视图; 多击打开 Quick Outline 
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
else if space_o_presses > 2
{
	Send, ^o
}
space_o_presses = 0
return

; 8.8.5 单击输入符号 +; 双击定位到 Package Explorer 视图; 多击打开 Preference 菜单
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
else if space_p_presses > 2
{
	Send, !wp
}
space_p_presses = 0
return

; 8.9 "Space + h, j, k, l, ; (单击, 双击, 多击)" 模拟 STS 环境下的快捷键
; 8.9.1 单击输入符号 -; 双击打开 Type Hierarchy 视图; 多击打开 Quick Type Hierarchy
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
else if space_h_presses > 2
{
	Send, ^t
}
space_h_presses = 0
return

; 8.9.2 单击输入符号 (; 双击实现 Run Java Application
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
else if space_j_presses > 2
{
	Send, !+xj
}
space_j_presses = 0
return

; 8.9.4 单击输入符号 [; 双击实现 Assign to Local Variable
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
	Send, {]}
} 
else if space_l_presses > 2
{
	Send, ^2l
}
space_l_presses = 0
return

; 8.10 "Space + n, m, comma, finish point, slash (单击, 双击, 多击)" 模拟 STS 环境下的快捷键
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
else if space_m_presses > 2
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
else if space_comma_presses > 2
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
	input_num := DllCall("GetKeyboardLayout","UINT",DllCall("GetWindowThreadProcessId","UINT",WinActive("A"),"UINTP",0),UInt)
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
else if space_point_presses > 2
{
	;
}
space_point_presses = 0
return 

; 8.11 使用 LAlt + 字母键 模拟 STS 快捷键
; 8.11.1 Expand Selection To
; Previous Element
LAlt & i:: Send, !+{Left}
; Next Element
LAlt & o:: Send, !+{Right}
; Enclosing Element
LAlt & u:: Send, !+{Up}
; Restoe Last Selection
LAlt & p:: Send, !+{Down}

; 8.11.2 代码折叠与展开
; 单击 Collapse; 双击 Collapse All
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
	Send, ^{NumpadSub}
} 
else if lalt_comma_presses = 2 
{
	Send, ^+{NumpadDiv}
} 
else if lalt_comma_presses > 2
{
	;
}
lalt_comma_presses = 0
return

; 单击 Expand; 双击 Expand All
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
	Send, ^{NumpadAdd}
} 
else if lalt_period_presses = 2 
{
	Send, ^{NumpadMult}
} 
else if lalt_period_presses > 2
{
	;
}
lalt_period_presses = 0
return

; 8.12 RShift 键的改造: 单击打开编辑窗口, 双击实现 Open Source
$RShift::
TransformLanguage()
if rshift_presses > 0 
{
	rshift_presses += 1
	return
}
rshift_presses = 1
SetTimer, KeyRShift, 250
return

KeyRShift:
SetTimer, KeyRShift, Off
if rshift_presses = 1
{
	Send, {F12}
	Send, ^m
} 
else if rshift_presses = 2 
{
	Send, ^+r
} 
else if rshift_presses > 2
{
	;
}
rshift_presses = 0
return



; 8.13 使用热字串模拟 STS 下面的快捷键
; Override / Implement Methods
:*:,oi::                    
Send, !+sv
return

; Generate Getters and Setters
:*:,gs::                  
Send, !+sr
return

; Generate hashCode() and equals()
:*:,he::                  
Send, !+sh
return

; Generate toString()
:*:,ts::                  
Send, !+ss
return 

; Generate Constructor using Fields
:*:,cf::                  
Send, !+so
return

; Generate Constructors from SuperClass
:*:,cs::                  
Send, !+sc
return

return


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
else if space_r_presses > 2
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
Capslock & Enter:: Send, ^{Enter}
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
if capslock_m_presses > 0 
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
else if capslock_m_presses > 2
{
	;
}
capslock_m_presses = 0
return
*/	

