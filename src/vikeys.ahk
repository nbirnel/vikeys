#InstallKeybdHook

;use global variable to keep track of state
CapsOn=false

; Work with Synergy server on Windows, 
; Synergy client on X with X already swapped.
Capslock::
;suspend to prevent calling esc
Suspend on
Send, {ESC}
Suspend off
return

; Doesn't work with Synergy server on Windows, 
; Synergy client on X with X already swapped - 
; Esc key still sends Esc. But who cares?
Esc::
if CapsOn = false
{
 CapsOn = true
 SetCapsLockState, on
}
else
{
 CapsOn = false
 SetCapsLockState, off
}
return

; Doesn't work with Synergy server on Windows, 
; Synergy client on X with X already swapped - 
; Alt and Ctrl keys still send their own code. 
;LAlt::LCtrl
;Alt::Ctrl
;Ctrl::Alt
;RCtrl::RAlt

; But this works, and I haven't (yet) found any problem with
; not distinguishing the two.
Alt::Ctrl
Ctrl::Alt
