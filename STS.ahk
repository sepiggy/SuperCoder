; 0. 准备工作
; 设置 CapsLock 状态永远为关闭
SetCapsLockState, AlwaysOff

; 1. CapsLock ---> Esc
CapsLock::Send, {ESC}

; 2. CapsLock + h ---> Left
;    CapsLock + j ---> Down
;    CapsLock + k ---> Up
;    CapsLock + l ---> Right
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

; 3. CapsLock + i ---> Home
;    CapsLock + o ---> End
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

; 4. CapsLock + u ---> PageUp
;    CapsLock + p ---> PageDown
CapsLock & u::                                                       
if GetKeyState("control") = 0                                        
{                                                                    
    if GetKeyState("alt") = 0                                        
        Send, {PgUp}                                                 
    else                                                             
        Send, +{PgUp}                                                
    return                                                           
}                                                                    
else {                                                               
    if GetKeyState("alt") = 0                                        
        Send, ^{PgUp}                                               
    else                                                            
        Send, +^{PgUp}                                              
    return                                                          
}                                                                   
return                                                              
                               
CapsLock & p::                                                      
if GetKeyState("control") = 0                                       
{                                                                   
    if GetKeyState("alt") = 0                                       
        Send, {PgDn}                                                
    else                                                            
        Send, +{PgDn}                                               
    return                                                          
}                                                                   
else {                                                              
    if GetKeyState("alt") = 0                                       
        Send, ^{PgDn}                                               
    else                                                            
        Send, +^{PgDn}                                              
    return                                                          
}                                                                   
return                                                              

; 5. CapsLock + w ---> Ctrl + Right
;    CapsLock + b ---> Ctrl + Left
CapsLock & w:: Send, ^{Right}                                       
CapsLock & b:: Send, ^{Left}  

; 6. CapsLock + m ---> BackSpace
;    CapsLock + / ---> Delete
CapsLock & m:: Send, {BS}
CapsLock & /:: Send, {Del} 

; 7. CapsLock + g ---> 使用谷歌搜索选中内容
CapsLock & g:: 
pressCapsLockGOnce() {
    Send, ^c
    Run http://www.google.com/search?q=%clipboard%
}

; 8. CapsLock + [ ---> WheelUp
;    CapsLock + ] ---> WheelDown
CapsLock & [:: Send, {WheelUp}
CapsLock & ]:: Send, {WheelDown}

; 9. CapsLock + , ---> 上一个选项卡
;    CapsLock + . ---> 下一个选项卡
CapsLock & ,:: Send, ^{PgUp}
CapsLock & .:: Send, ^{PgDn}

; 10. 模拟 STS 快捷键
; CapsLock + 1 ---> Quick Fix
; CapsLock + 2 ---> Focus
; CapsLock + 3 ---> Open Declaration
; CapsLock + 5 ---> Step Into
; CapsLock + 6 ---> Step Over
; CapsLock + 7 ---> Step Return
; CapsLock + 8 ---> Resume
; CapsLock + 9 ---> Back
; CapsLock + 0 ---> Forward
; CapsLock + - ---> Previous Member
; CapsLock + = ---> Next Member
; CapsLock + s ---> 打开 Source 菜单
; CapsLock + r ---> Open Resource
; CapsLock + t ---> Open Type
; CapsLock + c ---> Show Console View
; CapsLock + a ---> Next Annotation
; CapsLock + f ---> Format
; CapsLock + n ---> New
; CapsLock + z ---> Surround With
; CapsLock + q ---> Last Edit Location
; CapsLock + e ---> 快速转换编辑器
; CapsLock + x ---> Run As
; CapsLock + d ---> Debug As
; CapsLock + v ---> Assign to Local Variable
; CapsLock + Space ---> Active Editor
; CapsLock + Enter ---> 进入到Vrapper的命令模式
CapsLock & 1:: Send, ^{1}
CapsLock & 2:: Send, {F2}
CapsLock & 3:: Send, {F3}
CapsLock & 5:: Send, {F5}
CapsLock & 6:: Send, {F6}
CapsLock & 7:: Send, {F7}
CapsLock & 8:: Send, {F8}
CapsLock & 9:: Send, !{Left}
CapsLock & 0:: Send, !{Right}
CapsLock & -:: Send, ^+{Up}
CapsLock & =:: Send, ^+{Down}
CapsLock & s:: Send, !+{s} 
CapsLock & r:: Send, ^+{r}
CapsLock & t:: Send, ^+{t}
CapsLock & c:: Send, !+{q}{c}
CapsLock & a:: Send, ^{.}
CapsLock & f:: Send, ^+{f}
CapsLock & n:: Send, !+{n}
CapsLock & z:: Send, !+{z}
CapsLock & q:: Send, ^{q}
CapsLock & e:: Send, ^{e}
CapsLock & x:: Send, {AppsKey}{r}
CapsLock & d:: Send, {AppsKey}{d}
CapsLock & v:: Send, ^2{l}
CapsLock & Space:: Send, {F12}
CapsLock & Enter:: Send, {Esc}{:}