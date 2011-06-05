#InstallKeybdHook
#SingleInstance force
SetTitleMatchMode 2
;#Include Apple Wired Keyboard.ahk
#Include reloader.ahk
SendMode Input

; --------------------------------------------------------------
; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN

; launchy with stupid aero peek which refuses to disable :(
#space::SendInput ^!{Space} ; set launchy to ctrl+alt+space

;;;;;;;;;;;;;;; get key movement right ;;;;;;;;;;;;;;;
Alt & Backspace::SendInput ^{Backspace} ; option delete word

Alt & Left::
If GetKeyState("Shift", "D") = true
	SendInput +^{Left}
Else
	SendInput ^{Left}
Return

Alt & Right::
If GetKeyState("Shift", "D") = true
	SendInput +^{Right}
Else
	SendInput ^{Right}
Return

#left::SendInput {HOME}
#+left::SendInput +{HOME}
#right::SendInput {END}
#+right::SendInput +{END}

#up::SendInput ^{HOME}
#down::SendInput ^{END}
#+up::SendInput +^{HOME}
#+down::SendInput +^{END}

;;;;;;;;;;;;;;; disable some annoying keys ;;;;;;;;;;;;;;;
;LWin::Return ; disable left win key
F1::SendInput {1}	; nothing!

;;;;;;;;;;;;;;; left cmd instead of control ;;;;;;;;;;;;;;;
#LButton::Send ^{LButton} ;#cmd + click

#}::SendInput ^{Tab} ; move between tabs
#{::SendInput ^+{Tab} ; move between tabs

#-::SendInput ^{-} ; decrease font
#=::SendInput ^{=} ; increase font

#a::SendInput ^a	;select all

#h::SendInput ^h	;replace
#f::SendInput ^f	;find
#g::SendInput {F3}	;find next
+#g::SendInput +{F3} ;find previous

#c::SendInput ^c	;copy
#v::SendInput ^v	;paste
#z::SendInput ^z	;undo
#y::SendInput ^y	;redo
#+Z::SendInput ^y	;redo
#x::SendInput ^x	;cut

#t::SendInput ^t 	;new tab
#n::SendInput ^n 	;new window
;#w::SendInput ^w	;or ^{F4} :( close window, will have to slowly append ifwinactive statements when cmd+w doesn't work...
;  
#w:: 
IfWinActive ahk_class Notepad ; Alt+F4
  SendInput !{F4}
Else IfWinActive ahk_class IrfanView
	SendInput {Esc}
Else IfWinActive ahk_class #32770 ; various property dialogs but will not work :(
	SendInput {Esc}
Else IfWinActive ahk_class CabinetWClass ; windows explorer
	SendInput !{F4}
Else IfWinActive ahk_class FM ; decompressed view
	SendInput !{F4}
Else IfWinActive ahk_class HH Parent ; help window
	SendInput !{F4}
Else IfWinActive ahk_class WordPadClass ; 
	SendInput !{F4}    
Else
	SendInput ^w
Return

#q::SendInput !{F4}	;quit program
#o::SendInput ^o 	;open
#s::SendInput ^s    ;save
#p::SendInput ^p 	;print

#b::SendInput ^b 	;bold
#i::SendInput ^i 	;italics
#u::SendInput ^u ; underline

#m::WinMinimize,a 	;minimize window





;;;;;;;;;;;;;;; make chrome work like in mac ;;;;;;;;;;;;;;;
#IfWinActive ahk_class Chrome_WidgetWin_0
#l::SendInput !d 	;address bar in browser (must disable computer lock)
#+j::SendInput ^j 	;show all downloads
#enter::SendInput ^{Enter} 	;open link in new tab
return

; make windows explorer address bar also cmd+l
#IfWinActive ahk_class CabinetWClass
#l::SendInput !d 	;address bar
#k::SendInput !t, n ;map network drive (like cmd+k in finder)
#^g::SendInput !d	;go to address bar for 'go'
return

#!q::SendInput {Control}{Shift}{Esc}

 

;paste in command promt (cmd is still horrible, but powershell at least lets you move between words)
#IfWinActive ahk_class ConsoleWindowClass
^V::
SendInput {Raw}%clipboard%
#v::
SendInput {Raw}%clipboard%
return
#IfWinActive


; media/function keys all mapped to the windows key
; might be nice in vmware? not necessary in boot camp
;#F1::SendInput #{-}
;#F2::SendInput #{+}
;#F3::SendInput {PrintScreen}
;#F10::SendInput {Volume_Mute}
;#F11::SendInput {Volume_Down}
;#F12::SendInput {Volume_Up}