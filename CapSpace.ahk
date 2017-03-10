; 设置 CapsLock 状态
SetCapsLockState, AlwaysOff
$Space:: Send, {Space}

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
Tab & h:: Send % CtrlShiftAltCompatible("{1}", "", "{!}")
Tab & j:: Send % CtrlShiftAltCompatible("{2}", "", "{@}")
Tab & k:: Send % CtrlShiftAltCompatible("{3}", "", "{#}")
Tab & l:: Send % CtrlShiftAltCompatible("{4}", "", "{$}")
Tab & y:: Send % CtrlShiftAltCompatible("{5}", "", "{`%}")
Tab & u:: Send % CtrlShiftAltCompatible("{6}", "", "{^}")
Tab & i:: Send % CtrlShiftAltCompatible("{7}", "", "{&}")
Tab & o:: Send % CtrlShiftAltCompatible("{8}", "", "{*}")
Tab & n:: Send % CtrlShiftAltCompatible("{9}", "", "{(}")
Tab & m:: Send % CtrlShiftAltCompatible("{0}", "", "{)}")
Tab & f:: Send % CtrlShiftAltCompatible("{-}", "", "{_}")
Tab & g:: Send % CtrlShiftAltCompatible("{=}", "", "{+}")

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
Space & a:: Send % CtrlShiftAltCompatible("!{/}", "", "", "!+{q}{p}")
Space & b:: Send % CtrlShiftAltCompatible("^+{b}", "", "", "!+{q}{p}")
Space & c:: Send % CtrlShiftAltCompatible("^{/}", "", "", "!+{q}{p}")
Space & d:: Send % CtrlShiftAltCompatible("^{d}", "", "", "!+{q}{p}")
Space & e:: Send % CtrlShiftAltCompatible("", "", "", "!+{q}{p}")
Space & f:: Send % CtrlShiftAltCompatible("^+{f}", "", "", "!+{q}{p}")
Space & g:: Send % CtrlShiftAltCompatible("^+{g}", "", "", "!+{q}{p}")
Space & h:: Send % CtrlShiftAltCompatible("", "", "", "!+{q}{p}")
Space & i:: Send % CtrlShiftAltCompatible("^+{o}", "", "", "!+{q}{p}")
Space & j:: Send % CtrlShiftAltCompatible("^{j}", "^+{j}", "", "!+{q}{p}")
Space & k:: Send % CtrlShiftAltCompatible("^{k}", "^+{k}", "", "!+{q}{p}")
Space & l:: Send % CtrlShiftAltCompatible("", "", "", "!+{q}{p}")
Space & m:: Send % CtrlShiftAltCompatible("^{m}", "", "", "!+{q}{p}")
Space & n:: Send % CtrlShiftAltCompatible("!+{n}", "", "", "!+{q}{p}")
Space & o:: Send % CtrlShiftAltCompatible("^{o}", "", "", "!+{q}{p}")
Space & p:: Send % CtrlShiftAltCompatible("", "", "", "!+{q}{p}")
Space & q:: Send % CtrlShiftAltCompatible("^{1}", "", "", "!+{q}{p}")
Space & r:: Send % CtrlShiftAltCompatible("^+{r}", "!+{r}", "", "!+{q}{p}")
Space & s:: Send % CtrlShiftAltCompatible("", "", "", "!+{q}{p}")
Space & t:: Send % CtrlShiftAltCompatible("^+{t}", "", "", "!+{q}{p}")
Space & u:: Send % CtrlShiftAltCompatible("", "", "", "!+{q}{p}")
Space & v:: Send % CtrlShiftAltCompatible("", "", "", "!+{q}{p}")
Space & w:: Send % CtrlShiftAltCompatible("!+{w}", "", "", "!+{q}{p}")
Space & x:: Send % CtrlShiftAltCompatible("", "", "", "!+{q}{p}")
Space & y:: Send % CtrlShiftAltCompatible("", "", "", "!+{q}{p}")
Space & z:: Send % CtrlShiftAltCompatible("", "", "", "!+{q}{p}")
#IfWinActive



