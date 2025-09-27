
#Requires AutoHotkey v2.0

AppTitle := "WIN-key Unlocker for GTAV"
version := "1.0.1"


; # Tray buttons

A_TrayMenu.Add()
A_TrayMenu.Add("Show Info", OpenInfoPage)
Persistent
OpenInfoPage(ItemName := "", ItemPos := "", MyMenu := "") {
    MsgBox(""
        . "* This is a compiled (via ahk2exe) AutoHotKey v2 script`n"
        . "  * And it compiled by reason of detecting it by GTA:O anti-cheat system that causes disconnect from online sessions, when it's saved as usual .ahk-script.`n`n"

        . "* It fixes the WIN-key in the game GTAV (because in Rockstar Games Launcher - this function doesn't works)`n"
        . "  * When WIN-key is pressed in the game, the game window deacticates by selecting the Program Manager as active window.`n"
        . "    * Outside the game, WIN-key works as usual.`n`n"

        . "* This is done to facilitate exiting the game window if the `"Start`" menu is needed immediately`n"
        . "  * With this ahk, you can simply press WIN-key instead of having to use ALT+TAB every time.`n`n"
        . " By the way, you can double-click tray icon to open this menu`n`n"
        . "Author: N3M1X10`n"
        . "Version: " . version,
        AppTitle . " : Info", "Iconi"
        )
}
; Double clicks handler
OnMessage(0x404, TrayEvent)
TrayEvent(wParam, lParam, msg, hwnd) {
    if (lParam = 0x203) { ; WM_LBUTTONDBLCLK
        OpenInfoPage()
    }
}


; Discord button
A_TrayMenu.Add("Open Discord", OpenDiscord)
OpenDiscord(ItemName := "", ItemPos := "", MyMenu := "") {
    Run "https://discord.gg/2jJ3Qn4"
}

; Github button
A_TrayMenu.Add("Open Github", OpenGithub)
OpenGithub(ItemName := "", ItemPos := "", MyMenu := "") {
    Run "https://github.com/N3M1X10/unlock_win_key_GTAV"
}

; on start message
Result := MsgBox(""
    . AppTitle . " has been launched`n`n"
    . "* OK - leave the script running (it will auto-selected in 5 sec)`n"
    . "* Cancel - interrupt the script`n`n"
    . "* You can check additional info in tray menu by pressing button with a similar name",
    AppTitle, "OkCancel T5 Iconi"
    )
if Result = "Cancel" {
    MsgBox("You pressed `"Cancel`"`n`nScript was interrupted!!", AppTitle, "T1 Iconx")
    ExitApp
}
if Result = "Timeout" {
    ; MsgBox("You pressed nothing`n`nScript is continuing its work", AppTitle, "T2 Iconi")
}


; pressing LWin key
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

; release LWin
LWin Up:: {
    Send("{Blind}{LWin up}")
}
