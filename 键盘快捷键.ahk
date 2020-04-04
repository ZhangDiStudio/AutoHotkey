!j::send {Down}
!k::send {Up}
!h::send {Left}
!l::send {Right}

CapsLock & j::send {Down}{Down}{Down}{Down}{Down}
CapsLock & k::send {Up}{Up}{Up}{Up}{Up}
CapsLock & h::send {Home}
CapsLock & l::send {End}

;向下换行
CapsLock & n::send {End}{Enter}
;向上换行
CapsLock & o::send {Up}{End}{Enter}

;删除一整行
CapsLock & d::   ;alt+d
Send {Home}   
Send +{End}   ;输入shitf键+end键
Send {delete}{backspace}
return 
;复制一整行
CapsLock & y::
send {home}
send +{end}
send ^c   ;输出ctrl+c,复制一整行
return
;另起一行粘贴内容                                                                   
CapsLock & p::                                                                                        
send {end}                                                                                  
send {enter}                                                                                
send %clipboard%    ;将剪贴板的内容输出                                                  
return  

!+c::
    MouseGetPos, mouseX, mouseY
    ; 获得鼠标所在坐标，把鼠标的 X 坐标赋值给变量 mouseX ，同理 mouseY
    PixelGetColor, color, %mouseX%, %mouseY%, RGB
    ; 调用 PixelGetColor 函数，获得鼠标所在坐标的 RGB 值，并赋值给 color
    StringRight color,color,6
    ; 截取 color（第二个 color）右边的6个字符，因为获得的值是这样的：#RRGGBB，一般我们只需要 RRGGBB 部分。把截取到的值再赋给 color（第一个 color）。
    clipboard = %color%
    ; 把 color 的值发送到剪贴板
return  