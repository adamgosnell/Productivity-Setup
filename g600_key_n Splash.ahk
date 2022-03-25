;-----------------------
;                       
;    On script start    
;                       
;-----------------------

	;----AHK Recommended Settings----
		#NoEnv                                                  ; For performance and compatibility with future AutoHotkey releases.
		SendMode Input                                          ; For new scripts due to its superior speed and reliability.
		SetWorkingDir %A_ScriptDir%                             ; Ensures a consistent starting directory.

	;----Settings----
		#SingleInstance force                                   ; On script's reload, kill the first instance.
		SetNumLockState, AlwaysOn                               ; NumLock always on.
		#Hotstring, SI                                          ; Send hotstrings using "SendInput," faster.




		
		SplashImage, C:\Users\Adam Salter Gosnell\OneDrive\Hotkeys_and_Keyboards\g600_key_n.png, B
		Sleep, 2000
		SplashImage, Off
		ExitApp