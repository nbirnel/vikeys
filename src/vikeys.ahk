#InstallKeybdHook

CapsOn=false

Capslock::
;suspend to prevent calling esc
Suspend on
Send, {ESC}
Suspend off
return

Esc::
;use global variable to keep track of state
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

LAlt::LCtrl
RAlt::RCtrl
LCtrl::LAlt
RCtrl::RAlt

