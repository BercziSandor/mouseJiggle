#include <Misc.au3>
#include <MsgBoxConstants.au3>



Local $mouseSpeed = 1
Local $dist = 1
Local $waitSec = 60

; If ProcessExists("mouseJiggle.exe") Then
If _Singleton("mouseJiggle.exe", 1) = 0 Then
    MsgBox($MB_SYSTEMMODAL, "Warning", "Only one mouseJiggle.exe process can run at a time.", 2)
    Exit(0)
EndIf

Local $i = 0
While $i <= $i
    Local $origPos = MouseGetPos()
    MouseMove($origPos[0] + $dist, $origPos[1] + $dist, $mouseSpeed) ;
    MouseMove($origPos[0], $origPos[1], $mouseSpeed) ;
    sleep($waitSec * 1000)
    $i = $i + 1
WEnd
