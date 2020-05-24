ORG 00H
MAIN:
		MOV A,#0FEH		; 1111_1110B,即0位亮灯
LOOP:	
		MOV P1,A			; 将控制信号输出到P1口
LCALL DELAY				; 延时一段时间
RL A						; 控制字符左移一位，即下一个灯亮
AJMP LOOP				; 循环
DELAY:
		MOV R3,#20
D1: MOV R4,#50
D2: MOV R5,#250
DJNZ R5,$
DJNZ R4,D2
DJNZ R3,D1
RET
END
