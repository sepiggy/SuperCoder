; 设置 CapsLock 状态永远为关闭
SetCapsLockState, AlwaysOff

; 1. CapsLock
; CapsLock ---> Esc
; CapsLock + y ---> 模拟鼠标右键
; CapsLock + u ---> PgUp 
; CapsLock + i ---> Home
; CapsLock + o ---> End
; CapsLock + p ---> PgDn
; CapsLock + [ ---> WheelUp
; CapsLock + ] ---> WheelDown
;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CapsLock + h ---> Left
; CapsLock + j ---> Down
; CapsLock + k ---> Up
; CapsLock + l ---> Right
; CapsLock + ; ---> 进入到Vrapper的命令模式 
;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CapsLock + n ---> New
; CapsLock + m ---> BackSpace
; CapsLock + , ---> 
; CapsLock + . --->
; CapsLock + / --->
CapsLock:: Send, {Esc}

CapsLock & t:: return
CapsLock & r:: return
CapsLock & e:: return
CapsLock & w:: return
CapsLock & q:: return

CapsLock & g:: return
CapsLock & f:: return
CapsLock & d:: return
CapsLock & s:: return
CapsLock & a:: return

CapsLock & b:: return
CapsLock & v:: return
CapsLock & c:: return
CapsLock & x:: return
CapsLock & z:: return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CapsLock & y:: Send, {AppsKey}

CapsLock & u:: Send, {PgUp}

CapsLock & i::                                                       
if GetKeyState("control") = 0                                        
{                                                                    
    if GetKeyState("alt") = 0                                        
        Send, {Home}                                                 
    else                                                             
        Send, +{Home}                                                
    return                                                           
}                                                                    
else 
{                                                               
    if GetKeyState("alt") = 0                                        
        Send, ^{Home}                                                
    else                                                             
        Send, +^{Home}                                               
    return                                                           
}                                                                    
return                                                               
                                
CapsLock & o::                                                       
if GetKeyState("control") = 0                                        
{                                                                    
    if GetKeyState("alt") = 0                                        
        Send, {End}                                                  
    else                                                             
        Send, +{End}                                                 
    return                                                           
}                                                                    
else 
{                                                               
    if GetKeyState("alt") = 0                                        
        Send, ^{End}                                                 
    else                                                             
        Send, +^{End}                                                
    return                                                           
}                                                                    
return                 

CapsLock & p:: Send, {PgDn}

CapsLock & [:: Send, {WheelUp}

CapsLock & ]:: Send, {WheelDown}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CapsLock & h::                                                       
if GetKeyState("control") = 0                                        
{                                                                    
    if GetKeyState("alt") = 0                                        
        Send, {Left}                                                 
    else                                                             
        Send, +{Left}                                                
    return                                                           
}                                                                    
else 
{                                                               
    if GetKeyState("alt") = 0                                        
        Send, ^{Left}                                                
    else                                                             
        Send, +^{Left}                                               
    return                                                           
}                                                                    
return                                                               
                                
CapsLock & j::                                                       
if GetKeyState("control") = 0                                        
{                                                                    
    if GetKeyState("alt") = 0                                        
        Send, {Down}                                                 
    else                                                             
        Send, +{Down}                                                
    return                                                           
}                                                                    
else 
{                                                               
    if GetKeyState("alt") = 0                                        
        Send, ^{Down}                                                
    else                                                             
        Send, +^{Down}                                               
    return                                                           
}                                                                    
return                                                               
                             
CapsLock & k::                                                       
if GetKeyState("control") = 0                                        
{                                                                    
    if GetKeyState("alt") = 0                                        
        Send, {Up}                                                   
    else                                                             
        Send, +{Up}                                                  
    return                                                           
}                                                                    
else 
{                                                               
    if GetKeyState("alt") = 0                                        
        Send, ^{Up}                                                  
    else                                                             
        Send, +^{Up}                                                 
    return                                                           
}                                                                    
return                                                               
                            
CapsLock & l::                                                       
if GetKeyState("control") = 0                                        
{                                                                    
    if GetKeyState("alt") = 0                                        
        Send, {Right}                                                
    else                                                             
        Send, +{Right}                                               
    return                                                           
}                                                                    
else 
{                                                               
    if GetKeyState("alt") = 0                                        
        Send, ^{Right}                                               
    else                                                             
        Send, +^{Right}                                              
    return                                                           
}                                                                    
return

CapsLock & `;:: Send, {Esc}{:}                         
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CapsLock & n:: Send, !+{n}

CapsLock & m:: Send, {BS}

CapsLock & ,:: Send, ^{PgUp}

CapsLock & .:: Send, ^{PgDn}

; 2. Enter
; Enter + t ---> Open Type
; Enter + r ---> Open Resource
; Enter + e ---> Active Editor
; Enter + w ---> Move as [vim: w]
; Enter + q ---> Copy Qualified Name
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Enter + g ---> 使用谷歌搜索选中内容
; Enter + f ---> Show Package View
; Enter + d ---> Delete
; Enter + s ---> Show Server View
; Enter + a ---> Next Annotation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Enter + b ---> Move as [vim: b]
; Enter + v 
; Enter + c ---> Show Console View
; Enter + x
; Enter + z
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Enter & y:: return
Enter & u:: return
Enter & i:: return
Enter & o:: return
Enter & p:: return

Enter & h:: return
Enter & j:: return
Enter & k:: return
Enter & l:: return
Enter & `;:: return

Enter & n:: return
Enter & m:: return
Enter & ,:: return
Enter & .:: return
Enter & /:: return

$Enter:: Send, {Enter}
Enter & t:: Send, ^+{t}

Enter & r:: Send, ^+{r}

Enter & e:: Send, {F12}

Enter & w:: Send ^{Right}

Enter & q:: Send, !{e}{y}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Enter & g::
pressEnterGOnce() {
    Send, ^c
    Run http://www.google.com/search?q=%clipboard%
}

Enter & f:: Send, Send, !+{q}{p}

Enter & d:: Send, {Delete}

Enter & s:: Send, !+{q}{r}

Enter & a:: Send, ^{.}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Enter & b:: Send ^{Left}

Enter & c:: Send, !+{q}{c}

; 3. Space
; Space + 1 ---> Quick Fix
; Space + 2 ---> Focus
; Space + 3 ---> Open Declaration
; Space + 5 ---> Step Into
; Space + 6 ---> Step Over
; Space + 7 ---> Step Return
; Space + 8 ---> Resume
; Space + , ---> Previous Member
; Space + . ---> Next Member
; Space + a ---> Content Assist
; Space + b ---> Toggle Breakpoint
; Space + c ---> Toggle Comment
; Space + d ---> Debug As
; Space + f ---> Format
; Space + h ---> Back
; Space + j ---> Add Javadoc Comment
; Space + l ---> Forward
; Space + m ---> Move
; Space + o ---> Organize Imports
; Space + q ---> Last Edit Location
; Space + r ---> Rename
; Space + s ---> Source
; Space + v ---> Assign to Local Variable
; Space + w ---> Show In
; Space + x ---> Run As
; Space + z ---> Sourround With
$Space:: Send, {Space}
Space & 1:: Send, ^{1}
Space & 2:: Send, {F2}
Space & 3:: Send, {F3}
Space & 5:: Send, {F5}
Space & 6:: Send, {F6}
Space & 7:: Send, {F7}
Space & 8:: Send, {F8}
Space & ,:: Send, ^+{Up}
Space & .:: Send, ^+{Down}
Space & a:: Send, !{/}
Space & b:: Send, ^+{b}
Space & c:: Send, ^+{c}
Space & d:: Send, {AppsKey}{d}
Space & f:: Send, ^+{f}
Space & h:: Send, !{Left}
Space & j:: Send, !+{0}
Space & l:: Send, !{Right}
Space & m:: Send, !+{v}
Space & o:: Send, ^+{o}
Space & q:: Send, ^{q}
Space & r:: Send, !+{r}
Space & s:: Send, !+{s}
Space & v:: Send, ^{2}{l}
Space & w:: Send, !+{w}
Space & x:: Send, {AppsKey}{r}
Space & z:: Send, !+{z}

; 4. Tab
; Tab + h ---> 选中左边一字
; Tab + j ---> 选中下边一行
; Tab + k ---> 选中上边一行
; Tab + l ---> 选中右边一字
; Tab + ; ---> 选中当前行
;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Tab + u ---> 选中上一页
; Tab + i ---> 选中从当前字符到行开头的文字
; Tab + o ---> 选中从当前字符到行结束的文字
; Tab + p ---> 选中下一页
$Tab:: Send, {Tab}
Tab & h:: Send, +{Left}
Tab & j:: Send, +{Down}
Tab & k:: Send, +{Up}
Tab & l:: Send, +{Right}
Tab & `;:: Send, {Home}+{End}

;;;;;;;;;;;;;;;;;;;;;;;
Tab & u:: Send, +{PgUp}
Tab & i:: Send, +{Home}
Tab & o:: Send, +{End}
Tab & p:: Send, +{PgDn}

; 5. \
; \ + w ---> 选中右边的一个词
; \ + b ---> 选中左边的一个词
;$\:: Send, {\}
;\ & w:: Send, ^+{Right}
;\ & b:: Send, ^+{Left}
