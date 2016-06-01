#NoEnv
SetCapsLockState, AlwaysOff

; 全局变量定义
combination_prefix := ""
combination_suffix := ""
combination_press := ""
combination_suffix_array := ""
combination_context := ""

/*
 * Space 组合键
 * @STS
 * Space & a: 单击输入符号 &; 双击实现 Add Import
 * Space & b: 单击实现 Add Block Comment; 双击实现 Remove Block Comment
 * Space & c: 单击实现 Toggle Comment
 * Space & d: 单击输入符号 $; 双击实现删除当前行
 * Space & e: 单击输入符号 =; 双击实现 Generate Element Comment
 * Space & f: 单击实现 Format
 * Space & g: 单击跳转到下一行; 双击跳转到上一行
 * Space & h: 单击输入符号 -
 * Space & i: 单击输入符号 \
 * Space & j: 单击输入符号 (; 双击输入符号 )
 * Space & k: 单击输入符号 {; 双击输入符号 }
 * Space & l: 单击输入符号 [; 双击输入符号 ] 
 * Space & m: 单击输入符号 %
 * Space & n: 单击输入符号 !; 双击定位到 Next Member
 * Space & o: 单击输入符号 |; 双击实现 Quick Outline
 * Space & p: 单击输入符号 +; 双击定位到 Previous Member
 * Sapce & q: 单击定位到上次编辑的地方
 * Space & r: 
 * Space & s: 单击输入符号 #; 双击实现 Show In
 * Space & t: 单击实现 Show Tooltip Description; 双击实现 Open Type
 * Space & u: 单击输入符号 _
 * Space & v: 单击输入符号 ^
 * Space & w: 单击输入符号 ~
 * Space & x: 单击输入符号 *
 * Space & y:
 * Space & z: 单击输入符号 @; 双击实现 Surround With
 * Space & [: 单击实现 Back
 * Space & ]: 单击实现 ForWard
 * Space & ;:
 * Space & ':
 * Space & ,:
 * Space & .:
 * Space & /:
 */
space_a_map := { OTHERS: ["&", "", "", "", -1, 0] 
, SWT_Window0: ["&", "^+m", "", "", 250, 0] }

space_b_map := { OTHERS: ["", "", "", "", -1, 0]
, SWT_Window0: ["^+/", "^+\", "", "", 250, 0] }

space_c_map := { OTHERS: ["", "", "", "", -1, 0] 
, SWT_Window0: ["^/", "", "", "", -1, 0] }

space_d_map := { OTHERS: ["$", "", "", "", -1, 0] 
, SWT_Window0: ["$", "^d", "", "", 250, 0] }

space_e_map := { OTHERS: ["=", "", "", "" -1, 0] 
, SWT_Window0: ["=", "!+j", "", "", 250, 0] }

space_f_map := { OTHERS: [] 
, SWT_Window0: ["{^+f}", "", "", "", -1, 0] }

space_g_map := { OTHERS: ["", "", "", "", -1, 0] }

space_h_map := { OTHERS: ["-", "", "", "", -1, 0] }

space_i_map := { OTHERS: ["\", "", "", "", -1, 0] 
, SWT_Window0: ["\", "^+o", "", "", 250, 0] }

space_j_map := { OTHERS: ["(", ")", "", "", 250, 0] }

space_k_map := { OTHERS: ["{", "}", "", "", 250, 0] }

space_l_map := { OTHERS: ["[", "]", "", "", 250, 0] }

space_m_map := { OTHERS: ["%", "", "", "", -1, 0] }

space_n_map := { OTHERS: ["!", "", "", "", -1, 0] }

space_o_map := { OTHERS: ["|", "", "", "", -1, 0] 
, SWT_Window0: ["|", "^+o", "", "", 250, 0] }

space_p_map := { OTHERS: ["+", "", "", "", -1, 0] }

space_q_map := { OTHERS: [] 
, SWT_Window0: ["^q", "", "", "", -1, 0] }

space_r_map := { OTHERS: ["", "", "", "", -1, 0] }

space_s_map := { OTHERS: ["#", "", "", "", -1, 0] 
, SWT_Window0: ["#", "!+z", "", "", 250, 0] } 

space_t_map := { OTHERS: []
, SWT_Window0: ["{F2}", "", "", "", -1, 0] }

space_u_map := { OTHERS: ["_", "", "", "", -1, 0] }

space_v_map := { OTHERS: ["^", "", "", "", -1, 0] }

space_w_map := { OTHERS: ["~", "", "", "", -1, 0] } 

space_x_map := { OTHERS: ["*", "", "", "", -1, 0] }

space_y_map := { OTHERS: ["", "", "", "", -1, 0] }

space_z_map := { OTHERS: ["@", "", "", "", -1, 0] }

space_comma_map := { OTHERS: ["<", "", "", "", -1, 0] }

space_full_stop_map := { OTHERS: [">", "", "", "", -1, 0] }

space_slash_map := { OTHERS: ["?", "", "", "", -1, 0] }

space_semicolon_map := { OTHERS: [":", "", "", "", -1, 0] }

space_quotation_map := { OTHERS: [func("pressSpaceQuotation"), "", "", "", -1, 0] } 

pressSpaceQuotation() {
	Send, {"}
}

space_enter_map := { SWT_Window0: ["+{Enter}", "^+{Enter}", "", "", 250, 0] }

space_space_map := { OTHERS: ["{Space}", "", "", "", -1, 0] }

space_map := { a: space_a_map
	, b: space_b_map
	, c: space_c_map
	, d: space_d_map
	, e: space_e_map
	, f: space_f_map
	, g: space_g_map
	, h: space_h_map
	, i: space_i_map
	, j: space_j_map
	, k: space_k_map
	, l: space_l_map
	, m: space_m_map
	, n: space_n_map
	, o: space_o_map
	, p: space_p_map
	, q: space_q_map
	, r: space_r_map
	, s: space_s_map
	, t: space_t_map
	, u: space_u_map
	, v: space_v_map
	, w: space_w_map
	, x: space_x_map
	, y: space_y_map
	, z: space_z_map
	, 1: space_1_map
	, 2: space_2_map
	, ",": space_comma_map
	, ".": space_full_stop_map
	, "/": space_slash_map
	, ";": space_semicolon_map
	, "'": space_quotation_map
	, "Enter": space_enter_map
	, "$Space": space_space_map }

/*
 * Capslock 组合键
 * @STS
 * Capslock & a: 单击实现 Content Assist; 双击打开 Parameter Hints
 * Capslock & b: 单击实现 Show in Breadcrumb
 * Capslock & c: 单击定位到 Console 视图
 * Capslock & d: 单击实现 Debug As
 * Capslock & e: 单击实现定位编辑窗口; 双击实现快速切换编辑器
 * Capslock & f: 单击实现 Focus
 * Capslock & g: 单击实现在 Workspace 中搜索引用
 * Capslock & h: 单击模拟 Left 键
 * Capslock & i: 单击模拟 Home 键
 * Capslock & j: 单击模拟 Down 键
 * Capslock & k: 单击模拟 UP 键
 * Capslock & l: 单击模拟 Right 键; 双击实现 Assign to Local Variable
 * Capslock & m: 单击实现将当前窗口最大化 (^M)
 * Capslock & n: 单击实现新建项目
 * Capslock & o: 单击打开 Quick Outline; 双击定位到 Outline 视图
 * Capslock & p: 单击模拟 PgDn 键; 双击定位到 Package Explorer 视图; 三击打开 Preference 菜单
 * Capslock & q: 单击实现回到最后一次编辑的地方; 双击实现 Copy Qualified Name
 * Capslock & r: 单击实现 Open Resource; 双击实现 Refactor
 * Capslock & s: 单击实现 Source; 双击实现 Surround With
 * Capslock & t: 单击实现 Open Type; 双击定位到 Type Hierarchy 视图; 三击打开 Quick Type Hierarchy
 * Capslock & u: 单击模拟 PgUp 键
 * Capslock & v: 单击实现 Show View
 * Capslock & w: 单击实现 Close; 双击实现 Close Others; 三击实现 Close All
 * Capslock & x: 单击实现 Run As
 * Capslock & y: 
 * Capslock & z: 
 * Capslock & [: 单击定位到 Previous Member
 * Capslock & ]: 单击定位到 Next Member
 * Capslock & ;: 单击模拟 Ctrl + WheelDown
 * Capslock & ': 单击模拟 Ctrl + WheelUp
 * Capslock & ,: 单击模拟 Delete 键
 * Capslock & .: 单击在中文语言下切换全半角标点符号
 * Capslock & /: 单击实现 Toggle Comment; 
 * Capslock & Enter: 单击实现窗口最大化
 */
capslock_a_map := { OTHERS: ["^a", "", "", "", -1, 0] 
, SWT_Window0: ["!/", "!+/", "", "", 250, 0] }

capslock_b_map := { OTHERS: ["", "", "", "", -1, 0]
, SWT_Window0: ["", "!+b", "", "", 250, 0] }

capslock_c_map := { OTHERS: ["^c", "", "", "", -1, 0] 
, SWT_Window0: ["!+qc", "", "", "", 250, 0] }

capslock_d_map := { OTHERS: ["", "", "", "", -1, 0] 
, SWT_Window0: ["", "!rg", "", "", 250, 0] }

capslock_e_map := { OTHERS: ["", "", "", "", -1, 0] 
, SWT_Window0: ["{F12}", "^e", "", "", 250, 0] }

capslock_f_map := { OTHERS: ["^f", "", "", "", -1, 0]
, SWT_Window0: ["{F2}", "", "", "", -1, 0] }

capslock_g_map := { OTHERS: ["", "", "", "", -1, 0] 
, SWT_Window0: ["", "^+g", "", "", 250, 0] }

capslock_h_map := { OTHERS: ["{Left}", "^{Left}", "", "", 200, 0] 
, SWT_Window0: ["{Left}", "", "", "", 200, 0] }

capslock_i_map := { OTHERS: ["{Home}", "^{Home}", "", "", 250, 0] 
, SWT_Window0: ["{Home}", "", "", "", 250, 0] }
 
capslock_j_map := { OTHERS: ["{Down}", "^{Down}", "", "", 200, 0] 
, SWT_Window0: ["{Down}", "^+{Down}", "!+j", "", 400, 0] }

capslock_k_map := { OTHERS: ["{Up}", "^{Up}", "", "", 200, 0] 
, SWT_Window0: ["{Up}", "^+{Up}", "", "", 200, 0] }
  
capslock_l_map := { OTHERS: ["{Right}", "^{Right}", "", "", 200, 0] 
, SWT_Window0: ["{Right}", "^2l", "", "", 200, 0] }

capslock_m_map := { OTHERS: ["{BackSpace}", "", "", "", -1, 0] 
, SWT_Window0: [] }

capslock_n_map := { OTHERS: ["^n", "", "", "", -1, 0] 
, SWT_Window0: ["!+n", "", "", "", -1, 0] }

capslock_o_map := { OTHERS: ["{End}", "^{End}", "", "^o", 250, 0] 
, SWT_Window0: ["^o", "!+qo", "", "", 200, 0] }

capslock_p_map := { OTHERS: ["{PgDn}", "^{PgDn}", "", "", 250, 0] 
, SWT_Window0: ["{PgDn}", "!+qp", "!wp", "", 400, 0] }

capslock_q_map := { OTHERS: [] 
, SWT_Window0: ["^q", "{AppsKey}y{Enter}", "", "", 250 , 0] }

capslock_r_map := { OTHERS: ["", "", "", "", -1, 0] 
, SWT_Window0: ["^+r", "!+t", "", "", 200, 1] }

capslock_s_map := { OTHERS: ["^s", "", "", "", -1, 0] 
, SWT_Window0: ["!+s", "!+z", "", "", 250, 0] }

capslock_t_map := { OTHERS: ["^h", "", "", "", -1, 0] 
, SWT_Window0: ["^+t", "!+qt", "^t", "", 400, 1] }

capslock_u_map := { OTHERS: ["{PgUp}", "^{PgUp}", "", "", 250, 0] 
, SWT_Window0: ["{PgUp}", "!+z", "", "", 250. 0] }

capslock_v_map := { OTHERS: ["^v", "", "", "", -1, 0]
, SWT_Window0: ["^v", "!+qq", "", "", 250, 0] }

capslock_w_map := { OTHERS: ["^w", "", "", "", -1, 0] 
, SWT_Window0: ["^w", "!-o", "^+w", "", 400, 0] }

capslock_x_map := { OTHERS: ["^x", "", "", "", -1, 0] 
, SWT_Window0: ["^x", "!rs", "", "", 250, 0] }

capslock_y_map := { OTHERS: ["^y", "", "", "", -1, 0] }

capslock_z_map := { OTHERS: ["^z", "", "", "", -1, 0] }

capslock_1_map := { OTHERS: ["^1", "", "", "", -1, 0] }
capslock_2_map := { OTHERS: ["^2", "", "", "", -1, 0] }
capslock_3_map := { OTHERS: ["^3", "", "", "", -1, 0] }
capslock_4_map := { OTHERS: ["^4", "", "", "", -1, 0] }
capslock_5_map := { OTHERS: ["^5", "", "", "", -1, 0] }
capslock_6_map := { OTHERS: ["^6", "", "", "", -1, 0] }
capslock_7_map := { OTHERS: ["^7", "", "", "", -1, 0] }
capslock_8_map := { OTHERS: ["^8", "", "", "", -1, 0] }
capslock_9_map := { OTHERS: ["^9", "", "", "", -1, 0] }
capslock_0_map := { OTHERS: ["^0", "", "", "", -1, 0] }

capslock_comma_map := { OTHERS: ["{Delete}", "", "", "", -1, 0] }

capslock_full_stop_map := { OTHERS: [func("pressCapslockFullStopOnce"), "", "", "", -1, 0] }

pressCapslockFullStopOnce() {
	input_num := GetInputNum()
	if (input_num <> 67699721) {
	    Send, ^. 
	}
	return
}

capslock_slash_map := { SWT_Window0: ["^/", "^+/", "^+\", "", 400, 0] }

capslock_semicolon_map := { OTHERS: ["^{WheelDown}", "", "", "", -1, 0] }

capslock_quotation_map := { OTHERS: ["^{WheelUp}", "", "", "", -1, 0] }

capslock_left_square_map := { OTHERS: [func("pressCapslockLeftSquareOnce"), "", "", "", -1, 0]
, SWT_Window0: ["^+{Up}", "", "", "", -1, 0] }

pressCapslockLeftSquareOnce() {
}

capslock_right_square_map := { OTHERS: [func("pressCapslockRightSquareOnce"), "", "", "", -1, 0] 
, SWT_Window0: ["^+{Down}", "", "", "", -1, 0] }

pressCapslockRightSquareOnce() {
}

capslock_lbutton_map := { OTHERS : ["^{PgUp}", "", "", "", -1, 0] }

capslock_rbutton_map := { OTHERS : ["^{PgDn}", "", "", "", -1, 0] }

capslock_enter_map := { SWT_Window0: ["^m", "", "", "", -1, 0] }

capslock_capslock_map := { OTHERS: [func("pressCapslockOnce"), "", "", "", -1, 0] }

pressCapslockOnce() {
	SetCapsLockState, AlwaysOff
	input_num := getInputNum()
	if (input_num <> 67699721) {
        Send, #{Space}{Esc}
    }
    else {
        Send, {Esc}
    }
}

capslock_map := { a: capslock_a_map
	, b: capslock_b_map
	, c: capslock_c_map
	, d: capslock_d_map
	, e: capslock_e_map
	, f: capslock_f_map
	, g: capslock_g_map
	, h: capslock_h_map
	, i: capslock_i_map
	, j: capslock_j_map
	, k: capslock_k_map
	, l: capslock_l_map
	, m: capslock_m_map
	, n: capslock_n_map
	, o: capslock_o_map
	, p: capslock_p_map
	, q: capslock_q_map
	, r: capslock_r_map
	, s: capslock_s_map
	, t: capslock_t_map
	, u: capslock_u_map
	, v: capslock_v_map
	, w: capslock_w_map
	, x: capslock_x_map
	, y: capslock_y_map
	, z: capslock_z_map
	, 1: capslock_1_map
	, 2: capslock_2_map
	, 3: capslock_3_map
	, 4: capslock_4_map
	, 5: capslock_5_map
	, 6: capslock_6_map
	, 7: capslock_7_map
	, 8: capslock_8_map
	, 9: capslock_9_map
	, 0: capslock_0_map
	, ",": capslock_comma_map
	, ".": capslock_full_stop_map
	, "/": capslock_slash_map
	, ";": capslock_semicolon_map
	, "'": capslock_quotation_map
	, "[": capslock_left_square_map
	, "]": capslock_right_square_map
	, LButton: capslock_lbutton_map
	, RButton: capslock_rbutton_map
	, WheelDown: capslock_wheeldown_map
	, WheelUp: capslock_wheelup_map
	, Enter: capslock_enter_map
	, Capslock: capslock_capslock_map }

/*
 * Tab 组合键
 * @OTHERS
 * Tab & a: 单击打开操作中心
 * Tab & b: 单击将焦点设置到通知区域
 * Tab & c: 单击打开 CMD; 双击打开 Chrome
 * Tab & d: 单击显示桌面; 双击打开欧路词典
 * Tab & e: 单击显示资源管理器
 * Tab & f: Toggle Everything
 * Tab & g: Toggle Listary
 * Tab & h: 单击模拟 Windows + Left; 双击模拟 Windows + Shift + Left
 * Tab & i: 单击打开 “设置”; 双击模拟 Windows + Home 键
 * Tab & j: 单击模拟 Windows + Down
 * Tab & k: 单击模拟 Windows + Up
 * Tab & l: 单击模拟 Windows + Right; 双击模拟 Windows + Shift + Right 
 * Tab & m: 单击最小化所有窗口; 双击打开远程桌面连接
 * Tab & n: 单击打开记事本
 * Tab & o: 单击打开 AltRun 菜单
 * Tab & p: 单击打开投影
 * Tab & q: 单击打开 cortana; 双击关闭当前程序
 * Tab & r: 单击打开运行
 * Tab & s: 单击打开系统信息
 * Tab & t: 单击打开任务管理器
 * Tab & u: 
 * Tab & v: Toggle CLCL
 * Tab & w: 单击打开开始菜单
 * Tab & x: 单击打开快速链接
 * Tab & y: 
 * Tab & z: 
 * Tab & [: 单击模拟左移滚动条
 * Tab & ]: 单击模拟右移滚动条
 * Tab & ;: 单击模拟下移滚动条
 * Tab & ': 单击模拟上移滚动条
 * Tab & ,: 单击模拟降低音量
 * Tab & .: 单击模拟提高音量
 * Tab & /: 单击模拟静音
 */
tab_a_map := { OTHERS: ["#a", "", "", "", -1, 0] }
tab_b_map := { OTHERS: ["#b{Enter}", "", "", "", -1, 0] }
tab_c_map := { OTHERS: [func("pressTabCOnce"), func("pressTabCTwice"), "", "", 250, 0] }

pressTabCOnce() {
	Run Cmd
}

pressTabCTwice() {
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

tab_d_map := { OTHERS: ["#d", func("pressTabDTwice"), "", "", 250, 0] }

pressTabDTwice() {
	DetectHiddenWindows, On
	SetTitleMatchMode, 2
	WinGet, winid, ID, 欧路词典
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
		RunOrActivateProgram("C:\Program Files (x86)\eudic\eudic.exe")
	}
	DetectHiddenWindows, Off
}

tab_e_map := { OTHERS: ["#e", "", "", "", -1, 1] }
tab_f_map := { OTHERS: ["#!e", "", "", "", -1, 0] }
tab_g_map := { OTHERS: ["!+g", "", "", "", -1, 0] }
tab_h_map := { OTHERS: ["#{Left}", "#+{Left}", "", "", 250, 0] }
tab_i_map := { OTHERS: ["#i", "#{Home}", "", "", 250, 0] }
tab_j_map := { OTHERS: ["#{Down}", "", "", "", -1, 0] }
tab_k_map := { OTHERS: ["#{Up}", "", "", "", -1, 0] }
tab_l_map := { OTHERS: ["#{Right}", "#+{Right}", "", "", 250, 0] }
tab_m_map := { OTHERS: ["#m", func("pressTabMTwice"), "", "", 250, 0] }

pressTabMTwice() {
	Run mstsc
}

tab_n_map := { OTHERS: [func("pressTabNOnce"), "", "", "", -1, 0] }

pressTabNOnce() {
	Run notepad
}

tab_o_map := { OTHERS: ["#+r", "", "", "", -1, 1] }
tab_p_map := { OTHERS: ["#p", "", "", "", -1, 0] }
tab_q_map := { OTHERS: ["#q", "!{F4}", "", "", 250, 0] }
tab_r_map := { OTHERS: ["#r", "", "", "", -1, 0] }
tab_s_map := { OTHERS: ["#{Pause}", "", "", "", -1, 0] }
tab_t_map := { OTHERS: [func("pressTabTOnce"), "", "", "", -1, 0] }

pressTabTOnce() {
	if WinExist Windows 任务管理器 
	WinActivate 
	else 
	Run taskmgr.exe 
}

tab_u_map := { OTHERS: [] }
tab_v_map := { OTHERS: ["!c", "", "", "", 250, 0] }
tab_w_map := { OTHERS: ["^{Esc}", "", "", "", -1, 0] } 
tab_x_map := { OTHERS: ["#x", "", "", "", -1, 1] }
tab_y_map := { OTHERS: [] }
tab_z_map := { OTHERS: [] }
tab_1_map := { OTHERS: ["#^+1", "#!1", "", "", 250, 0] }
tab_2_map := { OTHERS: ["#^+2", "#!2", "", "", 250, 0] }
tab_3_map := { OTHERS: ["#^+3", "#!3", "", "", 250, 0] }
tab_4_map := { OTHERS: ["#^+4", "#!4", "", "", 250, 0] }
tab_5_map := { OTHERS: ["#^+5", "#!5", "", "", 250, 0] }
tab_6_map := { OTHERS: ["#^+6", "#!6", "", "", 250, 0] }
tab_7_map := { OTHERS: ["#^+7", "#!7", "", "", 250, 0] }
tab_8_map := { OTHERS: ["#^+8", "#!8", "", "", 250, 0] }
tab_9_map := { OTHERS: ["#^+9", "#!9", "", "", 250, 0] }
tab_0_map := { OTHERS: ["#^+0", "#!0", "", "", 250, 0] }

tab_left_square_map := { OTHERS: [func("pressTabLeftSquareOnce"), "", "", "", -1, 0] }

pressTabLeftSquareOnce() {
    ControlGetFocus, fcontrol, A
	Loop 6  ; <-- 增加这个值来加快滚动速度.
    SendMessage, 0x114, 0, 0, %fcontrol%, A  ; 0x114 是 WM_HSCROLL, 它后面的 0 是 SB_LINELEFT.
}

tab_right_square_map := { OTHERS: [func("pressTabRightSquareOnce"), "", "", "", -1, 0] }

pressTabRightSquareOnce() {
	ControlGetFocus, fcontrol, A
	Loop 6  ; <-- 增加这个值来加快滚动速度.
    SendMessage, 0x114, 1, 0, %fcontrol%, A  ; 0x114 是 WM_HSCROLL, 它后面的 1 是 SB_LINERIGHT.
}

tab_semicolon_map := { OTHERS: ["{WheelDown}", "", "", "", -1, 0] }

tab_quotation_map := { OTHERS: ["{WheelUp}", "", "", "", -1, 0] }

tab_comma_map := { OTHERS: ["{Volume_Down}", "", "", "", -1, 0] }

tab_full_stop_map := { OTHERS: ["{Volume_Up}", "", "", "", -1, 0] }

tab_slash_map := { OTHERS: ["{Volume_Mute}", "", "", "", -1, 0] }

tab_space_map := { OTHERS: [] }

tab_tab_map := { OTHERS: ["{Tab}", "#{Tab}", "", "", 250, 0] }

tab_map := { a: tab_a_map
	, b: tab_b_map
	, c: tab_c_map
	, d: tab_d_map
	, e: tab_e_map
	, f: tab_f_map
	, g: tab_g_map
	, h: tab_h_map
	, i: tab_i_map
	, j: tab_j_map
	, k: tab_k_map
	, l: tab_l_map 
	, m: tab_m_map
	, n: tab_n_map
	, o: tab_o_map
	, p: tab_p_map
	, q: tab_q_map
	, r: tab_r_map
	, s: tab_s_map
	, t: tab_t_map
	, u: tab_u_map
	, v: tab_v_map							
	, w: tab_w_map
	, x: tab_x_map 
	, y: tab_y_map
	, z: tab_z_map
	, 1: tab_1_map 
	, 2: tab_2_map 
	, 3: tab_3_map 
	, 4: tab_4_map 
	, 5: tab_5_map 
	, 6: tab_6_map 
	, 7: tab_7_map 
	, 8: tab_8_map 									
	, 9: tab_9_map 
	, 0: tab_0_map 
	, "[": tab_left_square_map
	, "]": tab_right_square_map
	, ";": tab_semicolon_map
	, "'": tab_quotation_map
	, ",": tab_comma_map
	, ".": tab_full_stop_map
	, "/": tab_slash_map
	, "$Tab": tab_tab_map }

/*
 * LAlt 组合键
 * @STS
 * LAlt & a:
 * LAlt & b:
 * LAlt & c:
 * LAlt & d:
 * LAlt & e:
 * LAlt & f:
 * LAlt & g:
 * LAlt & h: 模拟 Alt + Left 键
 * LAlt & i: 
 * LAlt & j: 模拟 Alt + Down 键
 * LAlt & k: 模拟 Alt + Up 键
 * LAlt & l: 模拟 Alt + Right 键
 * LAlt & m: 
 * LAlt & n: 
 * LAlt & o:
 * LAlt & p:
 * LAlt & q:
 * LAlt & r:
 * LAlt & s: 单击实现 Surround With
 * LAlt & t: 单击实现 Run Junit Test; 双击实现 Debug Junit Test
 * LAlt & u:
 * LAlt & v:
 * LAlt & w:
 * LAlt & x:
 * LAlt & y:
 * LAlt & z:
 * LAlt & ,: 
 * LAlt & .: 
 * LAlt & /:
 */

lalt_a_map := { OTHERS: [] }

lalt_b_map := { OTHERS: [] }

lalt_c_map := { OTHERS: [] }

lalt_d_map := { OTHERS: [] }

lalt_e_map := { OTHERS: [] }

lalt_f_map := { OTHERS: [] }

lalt_g_map := { OTHERS: [] }

lalt_h_map := { OTHERS: ["!{Left}", "", "", "", -1, 0] }

lalt_i_map := { OTHERS: ["", "", "", "", -1, 0] }

lalt_j_map := { OTHERS: ["!{Down}", "", "", "", -1, 0] }

lalt_k_map := { OTHERS: ["!{Up}", "", "", "", -1, 0] }

lalt_l_map := { OTHERS: ["!{Right}", "", "", "", -1, 0] }

lalt_m_map := { OTHERS: ["", "", "", -1, 0] }

lalt_n_map := { OTHERS: ["", "", "", "", -1, 0] }

lalt_o_map := { OTHERS: ["", "", "", "", -1, 0] }

lalt_p_map := { OTHERS: ["", "", "", "", -1, 0] }

lalt_q_map := { OTHERS: ["!{F4}", "", "", "", -1, 0] }

lalt_r_map := { OTHERS: [] }

lalt_s_map := { OTHERS: []
, SWT_Window0: ["!+z", "", "", "", -1, 1] }

lalt_t_map := { OTHERS: [] 
, SWT_Window0: ["!+xt", "!+dt", "", "", 250, 0] }

lalt_u_map := { OTHERS: ["", "", "", "", -1, 0] }

lalt_v_map := { OTHERS: [] }

lalt_w_map := { OTHERS: [] }

lalt_x_map := { OTHERS: [] }

lalt_y_map := { OTHERS: [] }

lalt_z_map := { OTHERS: [] }

lalt_comma_map := {}

lalt_full_stop_map := {}

lalt_lalt_map := { OTHERS: ["{AppsKey}", "{NumLock}", "", "", 250, 0] }

lalt_map := { a: lalt_a_map
	, b: lalt_b_map
	, c: lalt_c_map
	, d: lalt_d_map
	, e: lalt_e_map
	, f: lalt_f_map
	, g: lalt_g_map
	, h: lalt_h_map
	, i: lalt_i_map
	, j: lalt_j_map
	, k: lalt_k_map
	, l: lalt_l_map
	, m: lalt_m_map
	, n: lalt_n_map
	, o: lalt_o_map
	, p: lalt_p_map
	, q: lalt_q_map
	, r: lalt_r_map
	, s: lalt_s_map
	, t: lalt_t_map
	, u: lalt_u_map
	, v: lalt_v_map
	, w: lalt_w_map
	, x: lalt_x_map
	, y: lalt_y_map
	, z: lalt_z_map
	, ",": lalt_comma_map
	, ".": lalt_full_stop_map
	, LAlt: lalt_lalt_map }

/*
 * ' 组合键
 * @OTHERS
 * ' & a: 单击全选
 * ' & b: 单击模拟 BackSpace 键; 双击实现将选中的内容使用 Baidu 搜索
 * ' & c: 单击模拟复制操作 (^C)
 * ` & d: 单击模拟 Delete 键; 双击实现将选中的内容使用 Bing Dictionary 搜索
 * ` & e: 单击编辑当前 AHK 脚本
 * ' & f: 单击模拟查找操作 (^F)
 * ' & g: 单击模拟选择整行; 双击实现将选中的内容使用 Google 搜索
 * ' & h: 单击模拟 Shift + Left; 双击模拟 Shift + Ctrl + Left
 * ' & i: 单击模拟 Shift + Home; 双击模拟 Shift + Ctrl + Home
 * ' & j: 单击模拟 Shift + Down; 双击模拟 Shift + Ctrl + Down
 * ' & k: 单击模拟 Shift + Up; 双击模拟 Shift + Ctrl + Up
 * ' & l: 单击模拟 Shift + Right; 双击模拟 Shift + Ctrl + Right
 * ' & m: 单击模拟全屏操作 (F11)
 * ' & n: 单击模拟新建文件操作 (^N)
 * ' & o: 单击模拟 Shift + End; 双击模拟 Shift + Ctrl + End
 * ' & p: 单击模拟 Shift + PgDn
 * ' & q: 单击实现截图操作; 双击实现退出程序 (!F4)
 * ' & r: 单击重载当前 AHk 脚本
 * ' & s: 单击模拟保存动作 (^S)
 * ' & t: 单击模拟替换操作 (^H)
 * ' & u: 单击模拟 Shift + PgUp
 * ' & v: 单击模拟粘贴操作 (^V)
 * ' & w: 单击模拟关闭操作 (^N)
 * ' & x: 单击模拟剪切操作 (^X)
 * ' & y: 单击模拟撤销操作 (^Y)
 * ' & z: 单击模拟撤销操作 (^Z)
 */

quotation_a_map := { OTHERS: ["^a", "", "", "", -1, 0] }	

quotation_b_map := { OTHERS: ["{BackSpace}", func("pressQuotationBTwice"), "", "", 250, 0] }

pressQuotationBTwice() {
	Send, ^c
	Run http://www.baidu.com/s?wd=%clipboard%
}

quotation_c_map := { OTHERS: ["^c", "", "", "", -1, 0] }

quotation_d_map := { OTHERS: ["{Delete}", func("pressQuotationDTwice"), "", "", 225, 0] }

pressQuotationDTwice() {
	Send, ^c
	Run http://cn.bing.com/dict/search?q=%clipboard%
}

quotation_e_map := { OTHERS: [func("pressQuotationEOnce"), "", "", "", -1, 0] }

pressQuotationEOnce() {
	Run C:\Program Files\Sublime Text 3x64\sublime_text.exe C:\Users\JiaMingSheng\Documents\SuperCoder20160509.ahk
}

quotation_f_map := { OTHERS: ["^f", "", "", "", -1, 0] }

quotation_g_map := { OTHERS: ["{Home}+{End}", func("pressQuotationGTwice"), "", "", 250, 0] }

pressQuotationGTwice() {
	Send, ^c
	Run http://www.google.com/search?q=%clipboard%
}

quotation_h_map := { OTHERS: ["+{Left}", "+^{Left}", "", "", 250, 0] }

quotation_i_map := { OTHERS: ["+{Home}", "+^{Home}", "", "", 250, 0] }

quotation_j_map := { OTHERS: ["+{Down}", "+^{Down}", "", "", 250, 0] }

quotation_k_map := { OTHERS: ["+{up}", "+^{Up}", "", "", 250, 0] }

quotation_l_map := { OTHERS: ["+{Right}", "+^{Right}", "", "", 250, 0] }

quotation_m_map := { OTHERS: ["{F11}", "", "", "", -1, 0] }

quotation_n_map := { OTHERS: ["^n", "", "", "", -1, 0] }

quotation_o_map := { OTHERS: ["+{End}", "+^{End}", "", "", 250, 0] }

quotation_p_map := { OTHERS: ["+{PgDn}", "", "", "", -1, 0] }

quotation_q_map := { OTHERS: ["^!+x", "!{F4}", "", "", 250, 0] }

quotation_r_map := { OTHERS: [func("pressQuotationROnce"), "", "", "", -1, 0] }

pressQuotationROnce() {
	Reload
}

quotation_s_map := { OTHERS: ["^s", "", "", "", -1, 0] }

quotation_t_map := { OTHERS: ["^h", "", "", "", -1, 0] }

quotation_u_map := { OTHERS: ["+{PgUp}", "", "", "", -1, 0] }

quotation_v_map := { OTHERS: ["^v", "", "", "", -1, 0] }

;quotation_w_map := { OTHERS: [func("pressQuotationWOnce"), "", "", "", -1, 0] }
;
;pressQuotationWOnce() {
;	Run C:\Program Files\AutoHotkey\AU3_Spy.exe
;}

quotation_w_map := { OTHERS: ["^w", "", "", "", -1, 0] }

quotation_x_map := { OTHERS: ["^x", "", "", "", -1, 0] }

quotation_y_map := { OTHERS: ["^y", "", "", "", -1, 0] }

quotation_z_map := { OTHERS: ["^z", "", "", "", -1, 0] }

quotation_quotation_map := { OTHERS: ["'", "", "", "", -1, 0] }

quotation_map := { a: quotation_a_map
	, b: quotation_b_map
	, c: quotation_c_map
	, d: quotation_d_map
	, e: quotation_e_map
	, f: quotation_f_map
	, g: quotation_g_map
	, h: quotation_h_map
	, i: quotation_i_map
	, j: quotation_j_map
	, k: quotation_k_map
	, l: quotation_l_map
	, m: quotation_m_map
	, n: quotation_n_map
	, o: quotation_o_map
	, p: quotation_p_map
	, q: quotation_q_map
	, r: quotation_r_map
	, s: quotation_s_map
	, t: quotation_t_map
	, u: quotation_u_map
	, v: quotation_v_map
	, w: quotation_w_map
	, x: quotation_x_map
	, y: quotation_y_map
	, z: quotation_z_map
    , "'": quotation_quotation_map }

left_square_e_map := { OTHERS: ["{1}", "", "", "", -1, 0] }

left_square_r_map := { OTHERS: ["{2}", "", "", "", -1, 0] }

left_square_t_map := { OTHERS: ["{3}", "", "", "", -1, 0] }

left_square_f_map := { OTHERS: ["{4}", "", "", "", -1, 0] }

left_square_v_map := { OTHERS: ["{5}", "", "", "", -1, 0] }

left_square_s_map := { OTHERS: ["{6}", "", "", "", -1, 0] }

left_square_q_map := { OTHERS: ["{7}", "", "", "", -1, 0] }

left_square_b_map := { OTHERS: ["{8}", "", "", "", -1, 0] }

left_square_g_map := { OTHERS: ["{9}", "", "", "", -1, 0] }

left_square_z_map := { OTHERS: ["{0}", "", "", "", -1, 0] }

left_square_square_map := { OTHERS: ["{[}", "", "", "", -1, 0] }

left_square_map := { a: left_square_a_map
, b: left_square_b_map
, c: left_square_c_map
, d: left_square_d_map
, e: left_square_e_map
, f: left_square_f_map
, g: left_square_g_map
, h: left_square_h_map
, i: left_square_i_map
, j: left_square_j_map
, k: left_square_k_map
, l: left_square_l_map
, m: left_square_m_map
, n: left_square_n_map
, o: left_square_o_map
, p: left_square_p_map
, q: left_square_q_map
, r: left_square_r_map
, s: left_square_s_map
, t: left_square_t_map
, u: left_square_u_map
, v: left_square_v_map
, w: left_square_w_map
, x: left_square_x_map
, y: left_square_y_map
, z: left_square_z_map 
, "[": left_square_square_map }

right_square_e_map := { OTHERS: ["{F1}", "^{F1}", "!{F1}", "", 400, 0] }

right_square_r_map := { OTHERS: ["{F2}", "^{F2}", "!{F2}", "", 400, 0] }

right_square_t_map := { OTHERS: ["{F3}", "^{F3}", "!{F3}", "", 400, 0] }

right_square_f_map := { OTHERS: ["{F4}", "^{F4}", "!{F4}", "", 400, 0] }

right_square_v_map := { OTHERS: ["{F5}", "^{F5}", "!{F5}", "", 400, 0] }

right_square_s_map := { OTHERS: ["{F6}", "^{F6}", "!{F6}", "", 400, 0] }

right_square_q_map := { OTHERS: ["{F7}", "^{F7}", "!{F7}", "", 400, 0] }

right_square_b_map := { OTHERS: ["{F8}", "^{F8}", "!{F8}", "", 400, 0] }

right_square_g_map := { OTHERS: ["{F9}", "^{F9}", "!{F9}", "", 400, 0] }

right_square_x_map := { OTHERS: ["{F10}", "^{F10}", "!{F10}", "", 400, 0] }

right_square_a_map := { OTHERS: ["{F11}", "^{F11}", "!{F11}", "", 400, 0] }

right_square_w_map := { OTHERS: ["{F12}", "^{F12}", "!{F12}", "", 400, 0] }

right_square_square_map := { OTHERS: ["{]}", "", "", "", -1, 0] }

right_square_map := { a: right_square_a_map
, b: right_square_b_map
, c: right_square_c_map
, d: right_square_d_map
, e: right_square_e_map
, f: right_square_f_map
, g: right_square_g_map
, h: right_square_h_map
, i: right_square_i_map
, j: right_square_j_map
, k: right_square_k_map
, l: right_square_l_map
, m: right_square_m_map
, n: right_square_n_map
, o: right_square_o_map
, p: right_square_p_map
, q: right_square_q_map
, r: right_square_r_map
, s: right_square_s_map
, t: right_square_t_map
, u: right_square_u_map
, v: right_square_v_map
, w: right_square_w_map
, x: right_square_x_map
, y: right_square_y_map
, z: right_square_z_map
, "]": right_square_square_map }

lshift_lshift_map := { OTHERS: ["#{Space}", "", "", "", -1, 0] } 

lshift_map := { "$LShift": lshift_lshift_map }

combination_map := { "Space": space_map 
	, "$Space": space_map 
	, "Capslock": capslock_map
	, "$Capslock": capslock_map
	, "Tab": tab_map
	, "$Tab": tab_map 
	, "LAlt": lalt_map 
	, "$LShift": lshift_map
	, "$LControl": lcontrol_map 
	, "'": quotation_map 
    , "[": left_square_map 
    , "]": right_square_map }

Hotkey, $Space, customCombinations
Hotkey, Space & a, customCombinations
Hotkey, Space & b, customCombinations
Hotkey, Space & c, customCombinations
Hotkey, Space & d, customCombinations
Hotkey, Space & e, customCombinations
Hotkey, Space & f, customCombinations
Hotkey, Space & g, customCombinations
Hotkey, Space & h, customCombinations
Hotkey, Space & i, customCombinations
Hotkey, Space & j, customCombinations
Hotkey, Space & k, customCombinations
Hotkey, Space & l, customCombinations
Hotkey, Space & m, customCombinations
Hotkey, Space & n, customCombinations
Hotkey, Space & o, customCombinations
Hotkey, Space & p, customCombinations
Hotkey, Space & q, customCombinations
Hotkey, Space & r, customCombinations
Hotkey, Space & s, customCombinations
Hotkey, Space & t, customCombinations
Hotkey, Space & u, customCombinations
Hotkey, Space & v, customCombinations
Hotkey, Space & w, customCombinations
Hotkey, Space & x, customCombinations
Hotkey, Space & y, customCombinations
Hotkey, Space & z, customCombinations
Hotkey, Space & 1, customCombinations
HotKey, Space & 2, customCombinations
Hotkey, Space & 3, customCombinations
Hotkey, Space & 4, customCombinations
Hotkey, Space & 5, customCombinations
Hotkey, Space & 6, customCombinations
Hotkey, Space & 7, customCombinations
Hotkey, Space & 8, customCombinations
Hotkey, Space & 9, customCombinations
Hotkey, Space & 0, customCombinations
Hotkey, Space & `;, customCombinations
Hotkey, Space & `', customCombinations
Hotkey, Space & `,, customCombinations
Hotkey, Space & `., customCombinations
Hotkey, Space & `/, customCombinations
Hotkey, Space & Enter, customCombinations

Hotkey, Capslock, customCombinations
Hotkey, Capslock & a, customCombinations
Hotkey, Capslock & b, customCombinations
Hotkey, Capslock & c, customCombinations
Hotkey, Capslock & d, customCombinations
Hotkey, Capslock & e, customCombinations
Hotkey, Capslock & f, customCombinations
Hotkey, Capslock & g, customCombinations
Hotkey, Capslock & h, customCombinations
Hotkey, Capslock & i, customCombinations
Hotkey, Capslock & j, customCombinations
Hotkey, Capslock & k, customCombinations
Hotkey, Capslock & l, customCombinations
Hotkey, Capslock & m, customCombinations
Hotkey, Capslock & n, customCombinations
Hotkey, Capslock & o, customCombinations
Hotkey, Capslock & p, customCombinations
Hotkey, Capslock & q, customCombinations
Hotkey, Capslock & r, customCombinations
Hotkey, Capslock & s, customCombinations
Hotkey, Capslock & t, customCombinations
Hotkey, Capslock & u, customCombinations
Hotkey, Capslock & v, customCombinations
Hotkey, Capslock & w, customCombinations
Hotkey, Capslock & x, customCombinations
Hotkey, Capslock & y, customCombinations
Hotkey, Capslock & z, customCombinations
Hotkey, Capslock & 1, customCombinations
Hotkey, Capslock & 2, customCombinations
Hotkey, Capslock & 3, customCombinations
Hotkey, Capslock & 4, customCombinations
Hotkey, Capslock & 5, customCombinations
Hotkey, Capslock & 6, customCombinations
Hotkey, Capslock & 7, customCombinations
Hotkey, Capslock & 8, customCombinations
Hotkey, Capslock & 9, customCombinations
Hotkey, Capslock & 0, customCombinations
Hotkey, Capslock & `,, customCombinations
Hotkey, Capslock & `., customCombinations
Hotkey, Capslock & `/, customCombinations
Hotkey, Capslock & `;, customCombinations
Hotkey, Capslock & `', customCombinations
Hotkey, Capslock & `[, customCombinations
Hotkey, Capslock & `], customCombinations
Hotkey, Capslock & LButton, customCombinations
Hotkey, Capslock & RButton, customCombinations
Hotkey, Capslock & Enter, customCombinations

HotKey, $Tab, customCombinations
Hotkey, Tab & a, customCombinations
Hotkey, Tab & b, customCombinations
Hotkey, Tab & c, customCombinations
Hotkey, Tab & d, customCombinations
Hotkey, Tab & e, customCombinations
Hotkey, Tab & f, customCombinations
Hotkey, Tab & g, customCombinations
Hotkey, Tab & h, customCombinations
Hotkey, Tab & i, customCombinations
Hotkey, Tab & j, customCombinations
Hotkey, Tab & k, customCombinations
Hotkey, Tab & l, customCombinations
Hotkey, Tab & m, customCombinations
Hotkey, Tab & n, customCombinations
Hotkey, Tab & o, customCombinations
Hotkey, Tab & p, customCombinations
Hotkey, Tab & q, customCombinations
Hotkey, Tab & r, customCombinations
Hotkey, Tab & s, customCombinations
Hotkey, Tab & t, customCombinations
Hotkey, Tab & u, customCombinations
Hotkey, Tab & v, customCombinations
Hotkey, Tab & w, customCombinations
Hotkey, Tab & x, customCombinations
Hotkey, Tab & y, customCombinations
Hotkey, Tab & z, customCombinations
Hotkey, Tab & 1, customCombinations
Hotkey, Tab & 2, customCombinations
Hotkey, Tab & 3, customCombinations
Hotkey, Tab & 4, customCombinations
Hotkey, Tab & 5, customCombinations
Hotkey, Tab & 6, customCombinations
Hotkey, Tab & 7, customCombinations
Hotkey, Tab & 8, customCombinations
Hotkey, Tab & 9, customCombinations
Hotkey, Tab & 0, customCombinations
Hotkey, Tab & `[, customCombinations
Hotkey, Tab & `], customCombinations
Hotkey, Tab & `;, customCombinations
Hotkey, Tab & `', customCombinations
Hotkey, Tab & `,, customCombinations
Hotkey, Tab & `., customCombinations
Hotkey, Tab & `/, customCombinations

Hotkey, LAlt, customCombinations
Hotkey, LAlt & a, customCombinations
Hotkey, LAlt & b, customCombinations
Hotkey, LAlt & c, customCombinations
Hotkey, LAlt & d, customCombinations
Hotkey, LAlt & e, customCombinations
Hotkey, LAlt & f, customCombinations
Hotkey, LAlt & g, customCombinations
Hotkey, LAlt & h, customCombinations
Hotkey, LAlt & i, customCombinations
Hotkey, LAlt & j, customCombinations
Hotkey, LAlt & k, customCombinations
Hotkey, LAlt & l, customCombinations
Hotkey, LAlt & m, customCombinations
Hotkey, LAlt & n, customCombinations
Hotkey, LAlt & o, customCombinations
Hotkey, LAlt & p, customCombinations
Hotkey, LAlt & q, customCombinations
Hotkey, LAlt & r, customCombinations
Hotkey, LAlt & s, customCombinations
Hotkey, LAlt & t, customCombinations
Hotkey, LAlt & u, customCombinations
Hotkey, LAlt & v, customCombinations
Hotkey, LAlt & w, customCombinations
Hotkey, LAlt & x, customCombinations
Hotkey, LAlt & y, customCombinations
Hotkey, LAlt & z, customCombinations
Hotkey, LAlt & `,, customCombinations
Hotkey, LAlt & `., customCombinations

Hotkey, $LShift, customCombinations

Hotkey, `', customCombinations
Hotkey, `' & a, customCombinations
Hotkey, `' & b, customCombinations
Hotkey, `' & c, customCombinations
Hotkey, `' & d, customCombinations
Hotkey, `' & e, customCombinations
Hotkey, `' & f, customCombinations
Hotkey, `' & g, customCombinations
Hotkey, `' & h, customCombinations
Hotkey, `' & i, customCombinations
Hotkey, `' & j, customCombinations
Hotkey, `' & k, customCombinations
Hotkey, `' & l, customCombinations
Hotkey, `' & m, customCombinations
Hotkey, `' & n, customCombinations
Hotkey, `' & o, customCombinations
Hotkey, `' & p, customCombinations
Hotkey, `' & q, customCombinations
Hotkey, `' & r, customCombinations
Hotkey, `' & s, customCombinations
Hotkey, `' & t, customCombinations
Hotkey, `' & u, customCombinations
Hotkey, `' & v, customCombinations
Hotkey, `' & w, customCombinations
Hotkey, `' & x, customCombinations
Hotkey, `' & y, customCombinations
Hotkey, `' & z, customCombinations

Hotkey, `[, customCombinations
HotKey, `[ & a, customCombinations
HotKey, `[ & b, customCombinations
HotKey, `[ & c, customCombinations
HotKey, `[ & d, customCombinations
HotKey, `[ & e, customCombinations
HotKey, `[ & f, customCombinations
HotKey, `[ & g, customCombinations
HotKey, `[ & h, customCombinations
HotKey, `[ & i, customCombinations
HotKey, `[ & j, customCombinations
HotKey, `[ & k, customCombinations
HotKey, `[ & l, customCombinations
HotKey, `[ & m, customCombinations
HotKey, `[ & n, customCombinations
HotKey, `[ & o, customCombinations
HotKey, `[ & p, customCombinations
HotKey, `[ & q, customCombinations
HotKey, `[ & r, customCombinations
HotKey, `[ & s, customCombinations
HotKey, `[ & t, customCombinations
HotKey, `[ & u, customCombinations
HotKey, `[ & v, customCombinations
HotKey, `[ & w, customCombinations
HotKey, `[ & x, customCombinations
HotKey, `[ & y, customCombinations
HotKey, `[ & z, customCombinations

HotKey, `], customCombinations
HotKey, `] & a, customCombinations
HotKey, `] & b, customCombinations
HotKey, `] & c, customCombinations
HotKey, `] & d, customCombinations
HotKey, `] & e, customCombinations
HotKey, `] & f, customCombinations
HotKey, `] & g, customCombinations
HotKey, `] & h, customCombinations
HotKey, `] & i, customCombinations
HotKey, `] & j, customCombinations
HotKey, `] & k, customCombinations
HotKey, `] & l, customCombinations
HotKey, `] & m, customCombinations
HotKey, `] & n, customCombinations
HotKey, `] & o, customCombinations
HotKey, `] & p, customCombinations
HotKey, `] & q, customCombinations
HotKey, `] & r, customCombinations
HotKey, `] & s, customCombinations
HotKey, `] & t, customCombinations
HotKey, `] & u, customCombinations
HotKey, `] & v, customCombinations
HotKey, `] & w, customCombinations
HotKey, `] & x, customCombinations
HotKey, `] & y, customCombinations
HotKey, `] & z, customCombinations

customCombinations() {

	global combination_prefix, combination_suffix, combination_press, combination_map, combination_suffix_array, combination_context

	combination_context := getAhkClass()

	if (combination_context <> "PX_WINDOW_CLASS" and combination_context <> "SWT_Window0" and combination_context <> "Vim") {
		combination_context := "OTHERS"
	}

	; 判断是否是组合键
	isCombination := InStr(A_ThisHotkey, "&")

	;Msgbox % Trim(StrSplit(A_ThisHotkey, "&")[1]) == 1)

	if (isCombination <> 0) {
		combination_prefix := Trim(StrSplit(A_ThisHotkey, "&")[1]) 
		combination_suffix := Trim(StrSplit(A_ThisHotkey, "&")[2]) 
	} else {
		combination_prefix := Trim(A_ThisHotkey)
		combination_suffix := Trim(A_ThisHotkey)
	}

	KeyWait, %combination_suffix%
	;  长按某键
	if (A_TimeSinceThisHotkey > 400) {
		if (IsFunc(combination_suffix_array[4])) {
			combination_suffix_array[4]()
		}
		if (Strlen(combination_suffix_array[4]) == 0) {
			;
		} else if (Strlen(combination_suffix_array[4]) == 1) {
			SendRaw % combination_suffix_array[4]
		} else {
			Send % combination_suffix_array[4]
		}
	}

	if (combination_prefix == "Capslock") {
		SetCapsLockState, AlwaysOff
	}

	combination_suffix_array := combination_map[combination_prefix][combination_suffix][combination_context]

	if (combination_suffix_array == "") {
		combination_context := "OTHERS"
	}

	combination_suffix_array := combination_map[combination_prefix][combination_suffix][combination_context]
	combination_period := combination_suffix_array[5]
	is_transform_to_english := combination_suffix_array[6]

	if (is_transform_to_english <> 0) {
		transformToEnglish()
	}
 
    ; MsgBox % A_ThisHotkey
	; MsgBox % combination_suffix_array
	; MsgBox % IsObject(combination_suffix_array)
	; MsgBox % combination_prefix
	; MsgBox % combination_suffix
	; MsgBox % combination_period
	; Msgbox % combination_context

	if (combination_press > 0) {
		combination_press += 1
		RETURN
	}

	combination_press := 1
	SetTimer, KeyCombination, %combination_period%
	return
}
  
KeyCombination:
global combination_prefix, combination_suffix, combination_press, combination_map, combination_suffix_array, combination_context
SetTimer, KeyCombination, Off
; MsgBox % combination_prefix
; MsgBox % combination_suffix
; combination_suffix_array := combination_map[combination_prefix][combination_suffix]
; Msgbox % IsObject(combination_suffix_array)
if (combination_press == 1) {
	if (IsFunc(combination_suffix_array[1])) { ; 判断是否是函数
		combination_suffix_array[1]()
	}
	if (Strlen(combination_suffix_array[1]) == 0) {
		;
	} else if (Strlen(combination_suffix_array[1]) == 1) {
		SendRaw % combination_suffix_array[1]
	} else {
		Send % combination_suffix_array[1]
	}
} else if (combination_press == 2) {
	if (IsFunc(combination_suffix_array[2])) {
		combination_suffix_array[2]()
	}
	if (Strlen(combination_suffix_array[2]) == 0) {
		;
	} else if (Strlen(combination_suffix_array[2]) == 1) {
		SendRaw % combination_suffix_array[2]
	} else {
		Send % combination_suffix_array[2]
	}
} else if (combination_press == 3) {
	if (IsFunc(combination_suffix_array[3])) {
		combination_suffix_array[3]()
	}
	if (Strlen(combination_suffix_array[3]) == 0) {
		;
	} else if (Strlen(combination_suffix_array[3]) == 1) {
		SendRaw % combination_suffix_array[3]
	} else {
		Send % combination_suffix_array[3]
	}
}
combination_press := 0
return 

; 返回当前的语言
getInputNum() {
	return DllCall("GetKeyboardLayout", "UINT", DllCall("GetWindowThreadProcessId", "UINT", WinActive("A"), "UINTP", 0), UInt)
}

; 若当前语言是中文, 则将其转化为英文
transformToEnglish() {
	input_num := getInputNum()
    if (input_num <> 67699721) {        
        Send, #{Space} 
    }
}

; Function to run a program or activate an already running instance
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

getAhkClass() {
	WinGetClass, ahk_class, A
	return ahk_class
}

Tab & ~RButton:: AltTab
Tab & ~LButton:: ShiftAltTab

Capslock & WheelDown:: Send, ^{WheelDown}
Capslock & WheelUp:: Send, ^{WheelUp}
Capslock & Space:: Send, ^!+{Space}  ; Potplayer 全局快捷键 --- 暂停
~Shift & Space:: Send, ^+{Space}     ; Potplayer 全局快捷键 --- 后退

; STS 下的热字串
; Toggle Toolbar
#IfWinActive ahk_class SWT_Window0
:*:;tt::
Send, !wt
return
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

; Sublime Text 下的热字串
; Ctrl+P 文件定位；会定位到当前文件夹中文件或者已经打开的文件
#IfWinActive ahk_class PX_WINDOW_CLASS
:*:;gf:: 
Send, ^p
return
; Ctrl+; 词语定位；等同于Ctrl+P之后输入#；会定位到当前文件中的词语
:*:;gw::
Send, ^; 
return
; Ctrl+R 方法定位；等同于Ctrl+P之后输入@；会定位到当前文件中的函数
:*:;gm::
Send, ^r
return
; Ctrl+G 行号定位；等同于Ctrl+P之后输入:；会定位到输入的行数
:*:;gl::
Send, ^g
return

; 全局热字串
#IfWinActive

; svn 地址
:*:;svn::
Send, http://10.1.10.8/svn/chinapic/4Code/01Trunk/chinapic/
return

; email 地址
:*:;ema::
Send, jms1209@qq.com
return

; 格式化时间
:*:;ft::
FormatTime, OhMyTime, %A_now%, yyyy年M月d日 dddd H时m分s秒
SendInput %OhMyTime%
return

; Google
:*:;gg::
Run http://www.google.com
return

; Baidu
:*:;bd::
Run http://www.baidu.com
return

; 必应词典
:*:;dic::
Run http://cn.bing.com/dict/
return
; OA
:*:;oa::
Run http://oa.people.lo/general/
return

; 豆瓣
:*:;db::
Run https://www.douban.com/
return

; 知乎
:*:;zh::
Run https://www.zhihu.com/
return

; RainDrop
:*:;rd::
Run https://raindrop.io/app#/collection/0
return

; 优酷
:*:;yk::
Run http://www.youku.com/
return

; 签到
:*:;qd::
Run http://10.1.7.217/randd/index.asp
return

; 图说中国 Java 前台
:*:;cpfj::
Run http://localhost:8080/chinapic/front/login
return

; 图说中国 Java 后台
:*:;cpaj::
Run http://localhost:8080/chinapic/admin/login
return

; 图说中国 PHP 前台
:*:;cpfp::
Run http://10.1.7.36/chinapic/portal.php
return

; 图说中国 PHP 后台
:*:;cpap::
Run http://10.1.7.36/chinapic/admin.php
return

; 淘宝
:*:;tb::
Run https://www.taobao.com
return

; 京东
:*:;jd::
Run https://www.jd.com
return

; 什么值得买
:*:;zdm::
Run http://www.smzdm.com/
return

; 惠惠购物助手
:*:;hh::
Run http://www.huihui.cn/
return

; vim 中文帮助
:*:;vih::
Run http://vimcdoc.sourceforge.net/doc/help.html
return

; 图说中国数据库表说明
:*:;faq::
Run http://faq.comsenz.com/library/database/x25/x25_index.htm
return

; 虎牙直播
:*:;hy::
Run http://www.huya.com/g/war3
return

; Hibernate 参考文档
:*:;hibr::
Run file:///C:/Users/JiaMingSheng/Documents/me/lib/hibernate/hibernate-distribution-3.6.10.Final-dist/hibernate-distribution-3.6.10.Final/documentation/manual/zh-CN/html_single/index.html
return

; AHK 中文帮助文档
:*:;ahkr::
Run C:\Program Files\AutoHotkey\AutoHotkey_CN.chm
return

; 清空回收站
:*:;fre:: 
FileRecycleEmpty
return

; 计算器
:*:;cal::
Run calc
return

; 系统配置
:*:;msc::
Run msconfig
return

; 系统信息
:*:;msi::
Run msinfo32
return

; 屏幕键盘
:*:;osk::
Run osk
return

; Downloads 文件夹
:*:;dl::
Run C:\Users\JiaMingSheng\Downloads
WinMaximize, A
return

; lib 文件夹
:*:;lib::
Run C:\Users\JiaMingSheng\Documents\me\lib
WinMaximize, A
return

