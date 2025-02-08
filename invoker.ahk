#NoEnv
SendMode Input
#SingleInstance force
#IfWinActive Dota 2
Menu, Tray, Icon, %A_ScriptDir%/icons/invoker.jpg

#Include %A_ScriptDir%/utility.ahk

; === CONFIGURATION ===
global eee_after_casts := 1
global aghanim := 0
invokeKey := "R"
spellSlot1 := "D"
spellSlot2 := "F"
quas := "Q"
wex := "W"
exort := "E"
item1 := "1"  ; Urn
item2 := "2"  ; Eul
item3 := "3"  ; Blink
selectHero := "F1" ; Change to your hero select key

; === TOGGLE ===
ScrollLock::Suspend

; === CORE FUNCTIONALITY ===
; Quick Triple Spheres
space & q:: SendPlay, qqq
space & w:: SendPlay, www
space & e:: SendPlay, eee

; Aghanim's Toggle
alt & 1:: aghanim := !aghanim

; === ITEM MANAGEMENT ===
; Buy Aghanim (Quick Buy)
alt & 1::
    SendInput, {Enter}aghanim`s scepter{Enter}
    KeyWait, 1
return

; === COMBO MACROS ===
; Meteor + Blast
space & s::
    invokeCombo("eew", "d")
    invokeCombo("qwe", "f")
    postCastActions()
return

; Meteor+Blast+Tornado+Sunstrike
space & d::
    invokeCombo("wwq", "d")
    invokeCombo("eew", "f")
    invokeCombo("qwe", "d")
    invokeCombo("eee", "f")
    postCastActions()
return

; Forge + Alacrity
space & z::
    invokeCombo("eeq", "d")
    invokeCombo("wwe", "f")
    postCastActions()
return

; EMP + Tornado
space & x::
    invokeCombo("www", "d")
    invokeCombo("wwq", "f")
    postCastActions()
return

; Forge + Coldsnap
space & a::
    invokeCombo("qqq", "d")
    invokeCombo("eeq", "f")
    postCastActions()
return

; === ESCAPE MECHANICS ===
; Run Out (Blink + Ghost Walk)
space & f::
    useItem(item3)
    invokeCombo("qqw", "d")
    SendPlay, {%selectHero%}
return

; TP Out (Blink + Ghost Walk + TP)
space & g::
    useItem(item3)
    invokeCombo("qqw", "d")
    tpBase()
    SendPlay, {%selectHero%}
return

; === CASTING SYSTEMS ===
; Instant Cast (Alt + [key])
alt & a:: invokeCombo("qqq", "d") ; Cold Snap
alt & s:: invokeCombo("qqw", "d") ; Ghost Walk
alt & d:: invokeCombo("qqe", "d") ; Ice Wall
alt & f:: invokeCombo("www", "d") ; EMP
alt & g:: invokeCombo("wwq", "d") ; Tornado
alt & z:: invokeCombo("wwe", "d") ; Alacrity
alt & x:: invokeCombo("eee", "d") ; Sun Strike
alt & c:: invokeCombo("eeq", "d") ; Forge Spirit
alt & v:: invokeCombo("eew", "d") ; Chaos Meteor
alt & b:: invokeCombo("qwe", "d") ; Deafening Blast

; Prepare Cast (MButton + [key])
MButton & a:: SendPlay, qqqr ; Cold Snap Prep
MButton & s:: SendPlay, qqwr ; Ghost Walk Prep
MButton & d:: SendPlay, qqer ; Ice Wall Prep
MButton & f:: SendPlay, wwwr ; EMP Prep
MButton & g:: SendPlay, wwqr ; Tornado Prep
MButton & z:: SendPlay, wwer ; Alacrity Prep
MButton & x:: SendPlay, eeer ; Sun Strike Prep
MButton & c:: SendPlay, eeqr ; Forge Spirit Prep
MButton & v:: SendPlay, eewr ; Meteor Prep
MButton & b:: SendPlay, qwer ; Blast Prep

; === CORE FUNCTIONS ===
invokeCombo(orbs, slot) {
    SendPlay, %orbs%%invokeKey%
    Sleep 30
    SendPlay, %slot%
    if (eee_after_casts) {
        Sleep 50
        SendPlay, eee
    }
}

postCastActions() {
    Sleep % aghanim ? 2000 : 6000
    SoundBeep, 500, 100
}

useItem(item) {
    SendInput, {Alt down}%item%{Alt up}
    Sleep 50
}

tpBase() {
    SendInput, {Enter}tpbase{Enter}
    Sleep 100
}

castAll(urn := 0) {
    if urn {
        SendPlay, %item1%
        Sleep 55
    }
    SendPlay, d
    Sleep 55
    SendPlay, f
}