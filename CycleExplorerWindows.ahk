#Requires AutoHotkey v2.0

; Cycle through all active Windows Explorer windows with Alt + `
!`::
{
    ; Get a list of all open Windows Explorer windows
    explorerWindows := WinGetList("ahk_class CabinetWClass")

    ; Check if there are any Explorer windows open
    if (explorerWindows.Length = 0) {
        MsgBox("No Windows Explorer windows are open.")
        return
    }

    ; Activate each window in sequence
    static currentIndex := 0  ; Keep track of the current index across hotkey presses
    currentIndex := Mod(currentIndex + 1, explorerWindows.Length)  ; Increment and wrap around

    ; Activate the next window
    WinActivate(explorerWindows[currentIndex + 1])  ; +1 because arrays are 0-indexed
}
return