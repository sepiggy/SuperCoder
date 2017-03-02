; 设置 CapsLock 状态
SetCapsLockState, AlwaysOff
$Space:: Send, {Space}

; 函数
CtrlShiftAltCompatible(keyname)
{
    if GetKeyState("Ctrl") = 0
    {
        if GetKeyState("Alt") = 0
        {
            if GetKeyState("Shift") = 0
            {
                return keyname
            }
            else
            {
                return "+" . keyname
            }
        }
        else
        {
            if GetKeyState("Shift") = 0
            {
                return "!" . keyname
            }
            else
            {
                return "!" . "+" . keyname
            }
        }
    }
    else
    {
        if GetKeyState("Alt") = 0
        {
            if GetKeyState("Shift") = 0
            {
                return "^" . keyname
            }
            else
            {
                return "^" . "+" . keyname
            }
        }
        else
        {
            if GetKeyState("Shift") = 0
            {
                return "^" . "!" . keyname
            }
            else
            {
                return "^" . "!" . "+" . keyname
            }
        }
    }
}

CapsLock & q:: Send !{F4}
CapsLock & w:: Send % CtrlShiftAltCompatible("#{Up}")

CapsLock:: Send, {Esc}
CapsLock & a:: Send % CtrlShiftAltCompatible("#{Left}")
CapsLock & s:: Send % CtrlShiftAltCompatible("#{Down}")
CapsLock & d:: Send % CtrlShiftAltCompatible("#{Right}")
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

CapsLock & m:: Send % CtrlShiftAltCompatible("{BS}")
CapsLock & n:: Send % CtrlShiftAltCompatible("{Del}")
CapsLock & ,:: ShiftAltTab
CapsLock & .:: AltTab

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




