;������ ��� �������� ������������ ������ � �������� �������� ������ ��� �������� ������ (�������, ��������, ����������).
;� ������� ���� ���������� ��������, �� ������� ����������� ����� ����� �������������.
;� ������ ���� ������ ����� �� ���� ������ � ����� 
;����� ��������� ����� ������� ������ ���������� ���� ������ � ����� ������� ��������, ��� ���� ���� ����� ������ ��������� (����������� ��������), ���������� ����������� ������ ���������.
;����� ����� ��������� �� �������� ����������, ���� ������ ����� ������� ��������. 
;������ ������� ���� ������������ ������ ����� ����� Ctrl+e. ������ �������� ������ ��-�� ������� ���� ����� ������ ��� ������ �������� ������.

;���� ��������� �������� ��� ��� �����, �������� RELOAD, �������� ����� ��� � ����� � ��������� ������.

;������� ������ - ������� ���� ��� Ctrl+Esc

;�����!!!! ��������� ������, ������� �� ���� ������ ������� ���� � ������ ����� Run with UI Access ��� �� ����� ��������������.



#NoEnv
#SingleInstance force

;Gui, +AlwaysOnTop		; ������ ����� ������ ���� ����, ����� �� ���������� �������������� �� �������������� ������.
Gui, font, s10, Verdana  ; Set 10-point Verdana.
Gui, Add, Text,, �������� ������ `n(�������, ��������, ����������)
Gui, Add, DropDownList, vCriteria w150 Choose2, �������|��������|����������			;Choose3 - ����� ��� ����� �� ���������.
Gui, Add, Text, , �������� �� ���� ������ `n� ����� (���)
Gui, Add, Edit, vDelay  w50, 10 							;����� ����� ��������� ����� �� ���� �� ���������.
Gui, Add, Button, Default w100, ����
Gui, Add, Button, x+100 w100, RELOAD  	
Gui, Show, Autosize y30 xCenter
return

^Esc::
guiclose:
exitapp

ButtonRELOAD:    			       	
Reload

Button����:
Gui, Submit, NoHide

;CB_SELECTSTRING := 0x014d
Template := Criteria
Loop		
{
IfWinExist, ����������� �����
		WinActivate

	WinWaitActive, ����������� �����,, 		;���� ���� ���� ������� ���, �� ���������� �������� �� ���� ������. ���� �� ��������� ���� 1 ���, ����� ��������� �������� � ������� �������.
		if ErrorLevel
		{
;    		MsgBox 64, ���� ���, ���� ������ ���, 1
    		Continue

		}


	Control, ChooseString, %Template% , ComboBox1
	;SendMessage, CB_SELECTSTRING,-1, "����������" , ComboBox1	; �������� �������, ������� ����� �������� ��������, ������ �����-������� ������� ������, ���������������� ������ ����.
	
	Sleep, Delay*1000
	
}
return