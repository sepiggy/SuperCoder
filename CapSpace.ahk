; 初始化
$Space:: Send, {Space}

RCtrl & F10::
suspend
TrayTip, AutoHotKey, Suspend... 
return

RCtrl & F11:: 
Edit
return

RCtrl & F12:: 
Reload
TrayTip, AutoHotKey, Reload...
return

SetCapsLockState, AlwaysOff

; 函数
; 匹配的快捷键依次为：
; key, Shift+key, Alt+key, Alt+Shift+key, Ctrl+key, Ctrl+Shift+key，Ctrl+Alt+key, Ctrl+Alt+Shift+key。
CtrlShiftAltCompatible(keyname, keyarray*) {
    if GetKeyState("Ctrl") = 0
    {
        if GetKeyState("Alt") = 0
        {
            if GetKeyState("Shift") = 0
            {
                if StrLen(keyarray.MaxIndex()) = 0
                    return keyname               
                else
                    return keyname
            }
            else
            {
                if StrLen(keyarray.MaxIndex()) = 0
                    return "+" . keyname
                else
                    return keyarray[1]
            }
        }
        else
        {
            if GetKeyState("Shift") = 0
            {
                if StrLen(keyarray.MaxIndex()) = 0
                    return "!" . keyname
                else
                    return keyarray[2]
            }
            else
            {
                if StrLen(keyarray.MaxIndex()) = 0
                    return "!" . "+" . keyname
                else
                    return keyarray[3]
            }
        }
    }
    else
    {
        if GetKeyState("Alt") = 0
        {
            if GetKeyState("Shift") = 0
            {
                if StrLen(keyarray.MaxIndex()) = 0
                    return "^" . keyname
                else
                    return keyarray[4]
            }
            else
            {
                if StrLen(keyarray.MaxIndex()) = 0
                    return "^" . "+" . keyname
                else
                    return keyarray[5]
            }
        }
        else
        {
            if GetKeyState("Shift") = 0
            {
                if StrLen(keyarray.MaxIndex()) = 0
                    return "^" . "!" . keyname
                else
                    return keyarray[6]
            }
            else
            {
                if StrLen(keyarray.MaxIndex()) = 0
                    return "^" . "!" . "+" . keyname
                else
                    return keyarray[7]
            }
        }
    }
}

CapsLock & Tab:: Send % CtrlShiftAltCompatible("^{Tab}")
CapsLock & q:: Send !{F4}
CapsLock & w:: Send % CtrlShiftAltCompatible("#{Up}")
CapsLock & e:: Send #{`;}
CapsLock & r:: Send #^!+{r}
CapsLock & t:: 
pressCapsLockEOnce() {
    IfWinExist, ahk_class TTOTAL_CMD
    {
        IfWinActive, ahk_class TTOTAL_CMD
        {
            WinMinimize ahk_class TTOTAL_CMD
            return
        }
        IfWinNotActive, ahk_class TTOTAL_CMD
        {
            WinMaximize ahk_class TTOTAL_CMD
            return
        }
    }
    IfWinNotExist, ahk_class TTOTAL_CMD
        Run C:\Users\js\AppData\Local\TotalCMD64\Totalcmd64.exe
}

CapsLock:: Send, {Esc}
CapsLock & a:: Send % CtrlShiftAltCompatible("#{Left}")
CapsLock & s:: Send % CtrlShiftAltCompatible("#{Down}")
CapsLock & d:: Send % CtrlShiftAltCompatible("#{Right}")
CapsLock & f::
pressCapsLockFOnce() {
    IfWinExist, ahk_class MozillaWindowClass
    {
        IfWinActive, ahk_class MozillaWindowClass
        {
            WinMinimize ahk_class MozillaWindowClass
            return
        }
        IfWinNotActive, ahk_class MozillaWindowClass
        {
            WinMaximize ahk_class MozillaWindowClass
            return
        }
    }
    IfWinNotExist,
        Run D:\Software\RunningCheese_Firefox_V8\Firefox\firefox.exe
}
CapsLock & g::
pressCapsLockGOnce() {
    Send ^{c}
    Run http://www.google.com/ncr/search?q=%clipboard%
}

CapsLock & v:: Send +{Insert}
CapsLock & b:: Send #b{Space}<Left>

CapsLock & u:: Send % CtrlShiftAltCompatible("{PgUp}")
CapsLock & i:: Send % CtrlShiftAltCompatible("{Home}")
CapsLock & o:: Send % CtrlShiftAltCompatible("{End}")
CapsLock & p:: Send % CtrlShiftAltCompatible("{PgDn}")
CapsLock & [:: Send {WheelUp}
CapsLock & ]:: Send {WheelDown}

CapsLock & h:: Send % CtrlShiftAltCompatible("{Left}")
CapsLock & j:: Send % CtrlShiftAltCompatible("{Down}")
CapsLock & k:: Send % CtrlShiftAltCompatible("{Up}")
CapsLock & l:: Send % CtrlShiftAltCompatible("{Right}")
CapsLock & `;:: Send % CtrlShiftAltCompatible("{Enter}")

CapsLock & n:: Send % CtrlShiftAltCompatible("{Del}")
CapsLock & m:: Send % CtrlShiftAltCompatible("{BS}")
CapsLock & ,:: ShiftAltTab
CapsLock & .:: AltTab
CapsLock & Space:: Send #{Space}

$Tab:: Send % CtrlShiftAltCompatible("{Tab}")
Tab & h:: Send % CtrlShiftAltCompatible("{1}", "{!}", "")
Tab & j:: Send % CtrlShiftAltCompatible("{2}", "{@}", "")
Tab & k:: Send % CtrlShiftAltCompatible("{3}", "{#}", "")
Tab & l:: Send % CtrlShiftAltCompatible("{4}", "{$}", "")
Tab & y:: Send % CtrlShiftAltCompatible("{5}", "{`%}", "")
Tab & u:: Send % CtrlShiftAltCompatible("{6}", "{^}", "")
Tab & i:: Send % CtrlShiftAltCompatible("{7}", "{&}", "")
Tab & o:: Send % CtrlShiftAltCompatible("{8}", "{*}", "")
Tab & n:: Send % CtrlShiftAltCompatible("{9}", "{(}", "")
Tab & m:: Send % CtrlShiftAltCompatible("{0}", "{)}", "")
Tab & f:: Send % CtrlShiftAltCompatible("{-}", "{_}", "")
Tab & g:: Send % CtrlShiftAltCompatible("{=}", "{+}", "")

Space & 1:: Send % CtrlShiftAltCompatible("{F1}")
Space & 2:: Send % CtrlShiftAltCompatible("{F2}")
Space & 3:: Send % CtrlShiftAltCompatible("{F3}")
Space & 4:: Send % CtrlShiftAltCompatible("{F4}")
Space & 5:: Send % CtrlShiftAltCompatible("{F5}")
Space & 6:: Send % CtrlShiftAltCompatible("{F6}")
Space & 7:: Send % CtrlShiftAltCompatible("{F7}")
Space & 8:: Send % CtrlShiftAltCompatible("{F8}")
Space & 9:: Send % CtrlShiftAltCompatible("{F9}")
Space & 0:: Send % CtrlShiftAltCompatible("{F10}")
Space & -:: Send % CtrlShiftAltCompatible("{F11}")
Space & =:: Send % CtrlShiftAltCompatible("{F12}")

#IfWinActive ahk_class SWT_Window0
; Alt+/：Quick Assist
Space & a:: Send % CtrlShiftAltCompatible("!{/}", "", "", "")
; Ctrl+Shift+B：Toggle Breakpoint; Ctrl+Alt+B：Skip All Breakpoints
Space & b:: Send % CtrlShiftAltCompatible("^+{B}", "", "^!{B}", "")
; Ctrl+/：对一（多）行注释或取消注释; Alt+Shift+Q,C：Show Console View
Space & c:: Send % CtrlShiftAltCompatible("^{/}", "", "!+{q}{c}", "")
; Ctrl+D：删除当前行；F3: Open Declaration
Space & d:: Send % CtrlShiftAltCompatible("^{D}", "{F3}", "", "", "")
; F12：Activate Editor
Space & e:: Send % CtrlShiftAltCompatible("{F12}", "", "!+{W}{X}", "", "^{E}")
; Ctrl+Shift+F：Format
Space & f:: Send % CtrlShiftAltCompatible("^+{F}", "", "", "")
; Ctrl+Shift+G：搜索工作区中该类的引用
Space & g:: Send % CtrlShiftAltCompatible("^+{G}", "", "", "")
Space & h:: Send % CtrlShiftAltCompatible("", "", "", "")
; Ctrl+Shift+O：Organize Imports
Space & i:: Send % CtrlShiftAltCompatible("^+{O}", "", "", "")
; Alt+Shift+0：Generate Javadoc; Alt+Shift+X,J：Run As Java Application
Space & j:: Send % CtrlShiftAltCompatible("!+{0}", "", "!+{X}{J}", "")
Space & k:: Send % CtrlShiftAltCompatible("", "", "", "")
; Ctrl+2, L:为本地变量赋值
Space & l:: Send % CtrlShiftAltCompatible("^{2}{L}", "", "", "")
; Ctrl+M：编辑窗口最大化
Space & m:: Send % CtrlShiftAltCompatible("^{M}", "", "", "")
; Alt+Shit+N：New
Space & n:: Send % CtrlShiftAltCompatible("!+{N}", "", "", "")
; Alt+Shift+Q,O：Show Outline View
Space & o:: Send % CtrlShiftAltCompatible("", "", "!+{Q}{O}", "")
Space & p:: Send % CtrlShiftAltCompatible("", "", "", "")
; Ctrl+1：Quick Assist; Ctrl+Q：回到最后一次编辑的地方
Space & q:: Send % CtrlShiftAltCompatible("^{1}", "", "", "", "^{Q}")
; Ctrl+Shift+R：打开资源; Alt+Shift+R：重命名
Space & r:: Send % CtrlShiftAltCompatible("^+{R}", "!+{R}", "", "")
; Alt+Shift+Q,R：Show Server View
Space & s:: Send % CtrlShiftAltCompatible("", "", "!+{Q}{R}", "")
; Ctrl+Shift+T：打开类型
Space & t:: Send % CtrlShiftAltCompatible("^+{T}", "", "", "")
Space & u:: Send % CtrlShiftAltCompatible("", "", "", "")
Space & v:: Send % CtrlShiftAltCompatible("", "", "", "")
Space & w:: Send % CtrlShiftAltCompatible("!+{W}", "", "", "")
Space & x:: Send % CtrlShiftAltCompatible("", "", "", "")
Space & y:: Send % CtrlShiftAltCompatible("", "", "", "")
Space & z:: Send % CtrlShiftAltCompatible("", "", "", "")
#IfWinActive



