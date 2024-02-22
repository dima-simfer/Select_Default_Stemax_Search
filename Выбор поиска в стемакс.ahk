;Скрипт при открытии Расширенного поиска в Стемаксе выбирает нужный тип критерия поиска (Объекты, Персонал, Устройства).
;В верхнее поле записываем критерий, на который расширенный поиск будет переключаться.
;В нижнее поле ставим время на ввод данных и поиск 
;После истечения этого времени скрипт активирует окно поиска и опять выберет критерий, при этом поле ввода данных очистится (особенность Стемакса), результаты предыдущего поиска останутся.
;Чтобы такое поведение не вызывало неудобства, окно поиска лучше держать закрытым. 
;Быстро открыть окно Расширенного поиска можно через Ctrl+e. Убрать задержку нельзя из-за очистки поля ввода данных при выборе критерия поиска.

;Если требуется изменить тип или время, нажимаем RELOAD, выбираем новый тип и время и запускаем заново.

;Закрыть скрипт - закрыть окно или Ctrl+Esc

;ВАЖНО!!!! Запускать скрипт, щёлкнув по нему правой кнопкой мыши и выбрав пункт Run with UI Access или от имени Администратора.



#NoEnv
#SingleInstance force

;Gui, +AlwaysOnTop		; Окошко будет поверх всех окон, чтобы не переводить Администратора из полноэкранного режима.
Gui, font, s10, Verdana  ; Set 10-point Verdana.
Gui, Add, Text,, Критерий поиска `n(Объекты, Персонал, Устройства)
Gui, Add, DropDownList, vCriteria w150 Choose3, Объекты|Персонал|Устройства			;Choose3 - какой тип будет по умолчанию.
Gui, Add, Text, , Задержка на ввод данных `nи поиск (сек)
Gui, Add, Edit, vDelay  w50, 10 							;Здесь можно выставить время на ввод по умолчанию.
Gui, Add, Button, Default w100, Пуск
Gui, Add, Button, x+100 w100, RELOAD  	
Gui, Show, Autosize y30 xCenter
return

^Esc::
guiclose:
exitapp

ButtonRELOAD:    			       	
Reload

ButtonПуск:
Gui, Submit, NoHide

;CB_SELECTSTRING := 0x014d
Template := Criteria
Loop		
{
IfWinExist, Расширенный поиск
		WinActivate

	WinWaitActive, Расширенный поиск,, 		;Если окна одну секунду нет, то пропускаем задержку на ввод данных. Если не поставить хоть 1 сек, будет постоянно молотить и грузить систему.
		if ErrorLevel
		{
;    		MsgBox 64, Окна нет, Окна поиска нет, 1
    		Continue

		}


	Control, ChooseString, %Template% , ComboBox1
	;SendMessage, CB_SELECTSTRING,-1, "Устройства" , ComboBox1	; Запасной вариант, указать здесь название Критерия, убрать точку-запятую вначале строки, закомментировать строку выше.
	
	Sleep, Delay*1000
	
}
return
