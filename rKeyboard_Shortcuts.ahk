;--------------
;                       
;    Notes 
;                       
;--------------

	; This version is (r)edacted, cf. r- prefix on filename. It removes my personal information for public consumption.

	; # = Windows Key
	; ! = Alt Key
	; ^ = Ctrl Key
	; + = Shift Key
	; ASCII Symbols {ASC nnnn}
	; Unicode Symbols {U+nnnn}   

	; Remember that # in a URL (e.g. Google Docs URLs) will have to be curly-bracketted {} in the Hotstring format
	; e.g. https://docs.google.com/spreadsheets/d/.../edit{#}gid=...

	; CHANGELOG:
	; 25 Mar 2022 (asg+) For a long time I used intercept/interception and multiple external numpads. Now I just use an MMO mouse (Logitech G600).

;-----------------------
;                       
;    On script start    
;                       
;-----------------------
	 
	;----AHK Recommended Settings----
		#NoEnv                                                      ; For performance and compatibility with future AutoHotkey releases.
		SendMode Input                                              ; For new scripts due to its superior speed and reliability.
		SetWorkingDir %A_ScriptDir%                                 ; Ensures a consistent starting directory.

	;----Settings----
		#SingleInstance force                                       ; On script's reload, kill the first instance.
		SetNumLockState, AlwaysOn                                   ; NumLock always on.
		#Hotstring, SI                                              ; Send hotstrings using "SendInput," faster.
                                                                
	;----IF-DESKTOP Toggle----                             		    ; Relocates OneDrive path if I'm on my desktop vs. my laptop.
		If (A_ComputerName = "GOSNELL-DESKTOP") {
			dir := "C:\Users\Adam Salter Gosnell\OneDrive\Hotkeys_and_Keyboards"
			} Else {
			dir := "C:\Users\Adam Gosnell\OneDrive\Hotkeys_and_Keyboards"
		}
		
	;----AHK Startup Image----                              	    ; AHK logo on script start
		SplashImage, %dir%\AutoHotkeyLogoSplash.jpg, B
		Sleep, 800
		SplashImage, Off
		Return

;------------------------------
;                  
;    Persistant Functions    
;                  
;------------------------------
	 
	;----Reload AHK Script on Save----
		#IfWinActive, C:\Users\Adam Salter Gosnell\OneDrive\Hotkeys_and_Keyboards\Keyboard_Shortcuts.ahk - Sublime Text ; Adds a reload if I save with Sublime Text open (second IF to "close" the loop)
		^s::
			Send ^s
			Reload
			Return
 		#IfWinActive
 		; (sometimes I have to click into ST first, or do the hotkey twice, I don't know why)

 	;----Remove Tool Tip----
		RemoveToolTip:                                                  ; Sometimes I add a tooltip popup in a script and then call this function on a timer to remove it. Examples in "Template-Code in case I ever want to revert"
		    SetTimer, RemoveToolTip, Off
		    ToolTip
		    Return 

;------------------
;                  
;    Hotstrings    
;                  
;------------------ 

	;----URLs----
		::.log:: [...]                                                  ; a URL to my Personsal Time Log
		::.read_me:: [...]                                              ; This was my master list of Wi-Fi passwords, etc., before I started using Bit Warden 
		::.clif:: [...]                                                 ; (Cli)ent Intake (F)orm
		::.cli:: [...]                                                  ; (Cli)ent Intake Sheet
		::.afff:: [...]                                                 ; (Aff)iliate Reporting (F)orm
		::.aff:: [...]                                                  ; (Aff)iliate Reporting Sheet
		::.sch:: [...]                                                  ; My Calendly URL
		::.ifmemo:: [...]                                               ; Isaiah Forty's Memo Template

	;----Auto-Correct----
		::amazon.com::                                                  ; Auto-Corrects amazon.com to smile.amazon.com (to support charity)
			Send, {Home}
			Send, smile{.}amazon.com 
			Send, {Delete}{End}
			Sleep, 100
			Send, {Enter}
			Return
	
	;----Symbol Shortcuts---- 
		::.x::{U+2713}                                                  ; Shortcut to ✓ 
		:?*:--::{ASC 0151}                                              ; Auto-Corrects double-hyphen (-) to em-dash (—)
		::.degrees::{ASC 248}{Left}{BackSpace}{Right}					; Shortcut to ° 
		
	;----Personal----
		::.ad:: [...]                                       			; My address
		::.p:: [...]                                                    ; My phone number
		:o:.em:: [...]                                                  ; My personal email
		:o:.emi:: [...]                                                 ; My work email
		::.plate:: [...]                                                ; My license plate number
		::.dl#:: [...]      		                                    ; My drivers' license number
		::.=::Every blessing,                                           ; I use this as a signoff
		::.s::asg{+}                                                    ; My signature
		:o:.ss::(}asg{+}{)}												; My signature in parenthesis
		                                                                ; I use this often for naming files, e.g., YYYYMMDD Title, Organization (asg+)

	;----Common Phrases----
		::.b::Hi{!} Just making sure you saw this.                      ; bump for email
		::.jnst::I'm sorry. I'm just now seeing this.                   
		::.tys::Thank you, sir{!} 
		::.may::May the souls of all the faithful departed, through the mercies of God, rest in peace.
		::.1::One-on-One                                                ; I use this all the time in my log
		::.clo::clockout                                                ; I use this all the time in my log
		::.eom::end-of-month
		::.eoy::end-of-year
		::.mp::Morning Prayer
		::.ep::Evening Prayer
		::.tript::Trip Tomorrow, Don't Schedule Anything                ; I use this all the time in my calendar
		::.tripy::Trip Yesterday, Don't Schedule Anything               ; I use this all the time in my calendar
		::.oc::Of course. I understand entirely. 
		::.gct::There's been no change in the meter read since last month. ; I just got tired of typing it...
		::.back::Thanks for getting back to me{!} I really appreciate it. 
		::.clck::                                                       ; I use this all the time in my log
			SendInput, Click for Details
			SendInput, !{Enter}
			Return
		::.long::It's been a long time{!} I hope you're well. 

	;----Ministry Partner Development (MPD)----
		::.nogive::Of course. I understand entirely. That said, ministry partnership, for us, is about more than financial giving. Some of our partners do support us financially, but others commit to pray for us and help connect us with others that our ministry might speak to. Would you be interested in partnering with us in these other ways? Can I add you to our newsletter list?
		::.partt::Hey,{Enter}{Enter}[how we met?]{Enter}{Enter}I'm planning to be in [location] [dates] to share about a new ministry role I'm starting. I'm pretty excited about it and about what God might do through it.{Enter}{Enter}While I'm there, I'd like it if we could catch up and talk a bit about how you might partner with us.{Enter}{Enter}Would you be up for that?{Enter}{Enter}Let me know{!} ; partnership travel
		::.partr::Hey,{Enter}{Enter}[how we met?]{Enter}{Enter}Could we set up a video call to talk about some of the new ministry work I'm doing? I'm pretty excited about it and about what God might do through it.{Enter}{Enter}I thought we might catch up and talk a bit about how you might partner with us.{Enter}{Enter}Would you be up for that?{Enter}{Enter}Let me know{!} ; partnership remote
		::.ways::There are three ways that people partner with us.{Enter}{Enter}Ministry Partners Pray.{Enter}I'll send a monthly newsletter, in it will be a short "Pray for this" section.{Enter}{Enter}Ministry Partners Give Financially.{Enter}We're 40% to our total goal. Financial giving ranges wildly from $30/quarter to hundreds of dollars a month. The average contribution is about $150/month.{Enter}{Enter}Ministry Partners Connect us with Others.{Enter}
		::.up::I'll add you to the update list{!}
		::.fro::                                                        ; I used this a lot in my MPD Spreadsheet
			SendInput, First reach out
			Sleep, 200
			SendInput, {Tab}In 2 Days, 1 of 2
			Sleep 200
			SendInput, {Enter}
			Return
		
	;----Email Templates----
		::.meet::[N1], meet [N2]{Enter}[Where I met N2][N2 credentials][hook for reason to connect]{Enter}{Enter}[N2], meet [N1]{Enter}[Where I met N1][N1 credentials][hook for reason to connect]{Enter}{Enter}[suggestions about how to connect] 

	;----Coding----	
		::.64-::---------------------------------------------------------------- ; I use this for spacing (like in this script)
		::.for::for (i = 0; i < lastRow; i{+}{+})                                ; I... always forget the format of this. So, I hotstring'd it!

	;----Clients and Companies----
		:o:.if::Isaiah Forty{Space}
		::.ifein:: [...]
		::.iff::The Isaiah 40 Foundation, Inc.
		::.ifusad:: [...]
		::.ifcanad:: [...]
		::.cpp::Cornerstone Anglican Church Portage Park
		::.cppad:: [...]
		::.asac::All Saints Anglican Cathedral

	;----HEADERS----
		::.headj::                                               ; The header I use for journals
			Send, Adam Salter Gosnell{+}{Enter}
			Send, Personal Journal{Enter}
			Send, [LOCATION]{Enter}
			FormatTime, CurrentTime,, h:mm tt
			FormatTime, CurrentShortDate,, dd MMM yyyy
			Send, %CurrentShortDate% @ %CurrentTime%{Enter Enter}
			Return
		::.examen::                                              ; The header I use for examens 
			Send, GRATITUDE{Enter}{Enter}{Enter}
			Send, ASK FOR GRACE{Enter}{Enter}{Enter}
			Send, "DEMAND FROM YOUR SOUL AN ACCOUNT": THOUGHTS, WORDS, ACTIONS{Enter}{Enter}{Enter}
			Send, During this time I thought:{Enter}During this time I said:{Enter}During this time I acted:{Enter}Consolation (under the influence of the good spirit, moving towards God) or Desolation?{Enter}
			Send, ASK FOR FORGIVENESS{Enter}{Enter}{Enter}
			Send, RESOLVE AMENDMENT, WITH GOD'S HELP{Enter}{Enter}{Enter}
			Send, Close with the Our Father.
			Return
		::.headf::                                               ; The header I use for formal letters
			FormatTime, CurrentShortDate,, dd MMMM yyyy
			Send, %CurrentShortDate%{Enter}{Enter}Adam Salter Gosnell{Enter}[ORGANIZATION]{Enter}[ADDRESS1]{Enter}[ADDRESS2]{Enter}[EMAIL]{Enter}[PHONE]{Enter}{Enter}
			Send, [TO]{Enter}[ORGANIZATION]{Enter}[ADDRESS1]{Enter}[ADDRESS2]{Enter}[EMAIL]{Enter}[PHONE]{Enter}{Enter}[TITLE]
			Return
		::.headm::                                               ; The header I use for memos
			FormatTime, CurrentShortDate,, dd MMMM yyyy
			Send To{:}{Tab}{Tab}[NAME]{Enter}{Tab}{Tab}[POSITION{,} ORGANIZATION]{Enter}From{:}{Tab}{Tab}Fr. Adam Salter Gosnell{Enter}{Tab}{Tab}[POSITION{,} ORGANIZATION]{Enter}Date{:}{Tab}{Tab}%CurrentShortDate%{Enter}Subject{:}{Tab}{Tab}[SUBJECT]
			Return
		
	;----Dates and Times----
		::.t::                                                   ; (T)ime
			FormatTime, CurrentTime,, h:mm tt
		    SendInput %CurrentTime%{Space} 
		    Return
		::.d::                                                   ; (D)ate 
		    FormatTime, CurrentShortDate,, dd MMMM yyyy
		    SendInput %CurrentShortDate%{Space} 
		    Return
		::.sd::
		    FormatTime, CurrentShortDate,, dd MMM yyyy           ; (S)hort (D)ate
		    SendInput %CurrentShortDate%{Space} 
		    Return
		::.dy::                                                  ; (D)ate with Leading (Y)ear
		    FormatTime, CurrentFileDate,, yyyyMMdd
		    SendInput %CurrentFileDate%{Space} 
		    Return
		::.dh::                                                  ; (D)ate with (H)yphens
		    FormatTime, CurrentHyphenDate,, MM-dd-yyyy
		    SendInput %CurrentHyphenDate%{Space} 
		    Return
		::.dd::                                                  ; (D) in a Long Format
		    FormatTime, CurrentLongDate,,MMMM d{,} yyyy
		    SendInput, %CurrentLongDate%{Space}
		    Return

;---------------
;               
;    Hotkeys    
;               
;---------------

		#!k::                                                           ; This is a microphone mute that I tinker with sometimes.
		    SoundSet, +1, MASTER, mute, 16
            SoundGet, master_mute, , mute, 16
            ToolTip, Microphone Mute %master_mute% 
            SetTimer, RemoveToolTip, 1000
            Return
        ^!o:: Run https://configure.zsa.io                              ; Shortcut for my Ergodox EZ

	;----Autoformat Times on Numpad---- 
		$NumLock::                                                      ; I use this in my Google Sheets log.
																		; Because numlock is disabled by default (cf. "On script start">Settings)...
																		; I use the numlock shortcut AM or PM.
																		; I type a number, e.g. 800...
																		; ... and I single-tap numlock, it makes it 8:00 AM
																		; ... or if I double-tap numlock, it makes it 8:00 PM.
																		; Unfortunately this only works in that context...
																		; ... but I use it every day, multiple times a day

			KeyWait, NumLock, T0.1
			
			If (ErrorLevel)
			{
					SendInput, {Left}
					SendInput, {Right}
					SendInput, {Enter}
					SendInput, {Left}{Left}
					SendInput, :
					SendInput, {Down}{Right}
					SendInput, {Space} AM
					SendInput, {Tab}
					Return
			} Else {
				KeyWait, NumLock, D T0.1
				If (ErrorLevel)
				{
					SendInput, {Left}
					SendInput, {Right}
					SendInput, {Enter}
					SendInput, {Left}{Left}
					SendInput, :
					SendInput, {Down}{Right}
					SendInput, {Space} AM
					SendInput, {Tab}
					Return
				} Else {
					SendInput, {Left}
					SendInput, {Right}
					SendInput, {Enter}
					SendInput, {Left}{Left}
					SendInput, :
					SendInput, {Down}{Right}
					SendInput, {Space} PM
					SendInput, {Tab}
					Return
				}
			}
			KeyWait, NumLock
		    Return

/*

;----------------------------------------------------
;                              
;    Template-Code in case I ever want to revert    
;                              
;----------------------------------------------------

	;----2nd-Numpad----
		#If (getKeyState("F22", "P"))                           ; If this keystroke was intercepted from the 2nd-keyboard (and now F12 is pressed).
		F22::Return
		Numpad0::                                               ; Standard input, hotkey use of Numpad0 and Numpad00 dealt with above.
		    Run [URL]
		    ToolTip, Read_Me                                    
		    SetTimer, RemoveToolTip, 1000
		    Return

	$Escape::                                               
	    KeyWait, Escape, T0.5                               ; Wait for the Esc key to be released for 0.5 seconds (suppressing auto-repeat).
	   If ErrorLevel 
		{                                                   ; If the key is still down.
	        WinGet, X, ProcessName, A                       ; Get the active process's name.
	        SplashTextOn,,150,,`nRelease button to close %x%`n`nKeep pressing it to NOT close window...
	        KeyWait, Escape, T3                             ; Wait for the Esc Key to be released for 3 seconds.
	        SplashTextOff
	        If !ErrorLevel 
			{                                               ; No timeout, so key was released...
	            PostMessage, 0x112, 0xF060,,, A             ; ... so close window.
	            return
	        }                                               ; Otherwise,
	        KeyWait, Escape                                 ; Wait for button to be released...
	        return                                          ; ... then do nothing, send
	    }
	    Send {Esc}                                          ; ... a regular escape.
	    return                                              ;

*/