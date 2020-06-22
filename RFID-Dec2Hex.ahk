;; Necessary to prevent the default keyboard action
#InstallKeybdHook
;; Limits the execution to one instance
#SingleInstance force

;; Start the action without waiting for the hotkey
Goto, Start

;; DEFINE THE HOTKEY HERE
!F1::

Start:

;; Asking the user to add the decimal number via the RFID reader
;; The RFID reader has to be a virtual keyboard, though.
;; The program checks, whether the input is a digit or not.
;; If the input is a digit, it gets converted to a hex number and copied to clipboard.
InputBox, num_input, Dec2Hex, Bitte scanne den RFID-Chip mit deinem Leser.
if ErrorLevel
  Return
else {

  if num_input is not digit
  {
     Soundbeep
     MsgBox, Der eingegebene Text ist keine Zahl.
     Return
  }
  SetFormat, integer, hex
  num_input += 0
  SetFormat, integer, d
  StringTrimLeft, newnum_input, num_input, 2
  clipboard := newnum_input

  ;; Checks it the Access Commander is running in a browser window.
  ;; If Access Commander is running, it brings the window to front.
  IfWinExist, 2N Access Commander
  {
    WinActivate ; use the window found above
  }
  ;; Message, that the hex number has been copied.
  MsgBox, 48 , Hex-Zahl-Umrechnung, % "Die Hex-Zahl " . newnum_input . " wurde in die Zwischenablage kopiert. Erneut ausfuehren mit Alt + F1", 5



}
Return
