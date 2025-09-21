

; Params
script_name := "unlock_win_key_GTAV"
icon := "G:\Codes\PhotoShop\OwnProjects\logo`'s\ico\GTAV.ico"
base := "32"


; Const
user := EnvGet("USERNAME")
ahk := "C:\Users\" user "\AppData\Local\Programs\AutoHotkey\"


; Check'n'Create the 'exe' dir if not exist
if !FileExist("exe\") {
    DirCreate("exe\")
}


; Compiling
RunWait '"' ahk 'Compiler\Ahk2Exe.exe"'
  . ' /in "' script_name '.ahk"'
  . ' /out "exe\' script_name '.exe"'
  . ' /icon "' icon '"'
  . ' /compress 2'
  . ' /base "' ahk 'v2\AutoHotkey' base '.exe"'

