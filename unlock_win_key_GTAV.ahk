
#Requires AutoHotkey v2.0

AppTitle := "WIN-key Unlocker for GTAV"
version := "1.0.0"

A_TrayMenu.Add()  ; Creates a separator line.
A_TrayMenu.Add("Show Info", OpenInfoPage)  ; Creates a new menu item.
Persistent

OpenInfoPage(ItemName, ItemPos, MyMenu) {
    MsgBox(""
        . "* This is a compiled (via ahk2exe) AHKv2 script`n"
        . "  * And it compiled by reason of detecting it by GTA:O anti-cheat system that causes disconnect from online sessions, when it's saved as usual .ahk-script.`n`n"

        . "* It fixes the WIN-key in the game GTAV (because in Rockstar Games Launcher - this function doesn't works)`n"
        . "  * When WIN-key is pressed in the game, the game window deacticates by selecting the Program Manager as active window.`n"
        . "    * Outside the game, WIN-key works as usual.`n`n"

        . "* This is done to facilitate exiting the game window if the `"Start`" menu is needed immediately`n"
        . "  * With this ahk, you can simply press WIN-key instead of having to use ALT+TAB every time.`n`n"
        . " !!!BY THE WAY!!!, you can CTRL+C in this window to copy all of this window content`n`n"
        . "Author: N3M1X10`n"
        . "Version: " . Version,
        AppTitle . " : Info", "Iconi"
        )
}


Result := MsgBox(""
    . AppTitle . " has been launched`n`n"
    . "* OK - leave the script running (it will auto-selected in 5 sec)`n"
    . "* Cancel - interrupt the script`n`n"
    . "* You can check additional info in tray menu by pressing button with a similar name",
    AppTitle, "OkCancel T5 Iconi"
    )
if Result = "Cancel" {
    MsgBox("You pressed `"Cancel`"`n`nScript was interrupted!!", AppTitle, "T1 Iconi")
    ExitApp
}
if Result = "Timeout" {
    ; MsgBox("You pressed nothing`n`nScript is continuing its work", AppTitle, "T2 Iconi")
}


; нажатие Win
LWin:: {
    ; predefined window names array
    gameWindows := [
        "ahk_exe GTA5.exe",
        "ahk_exe GTA5_Enhanced.exe"
    ]

    ; searching for active window in predefined array
    foundActive := false
    for windowTitle in gameWindows {
        if WinActive(windowTitle) {
            foundActive := true
            break
        }
    }

    ; pressing the WIN key correctly
    if (foundActive) {
        Send("{Blind}{LWin down}")
        WinActivate("Program Manager")
    } else {
        Send("{Blind}{LWin down}")
    }
}

; отпускание Win
LWin Up:: {
    Send("{Blind}{LWin up}")
}
