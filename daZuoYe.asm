ORG 00H
;������
AJMP MAIN

ORG 0003H
AJMP IR0

ORG 0040H
MAIN:
		;�жϳ�ʼ��
		SETB EA
		SETB EX0
		SETB IT0



		MOV R0,#20H		;��ʾ��λ������#20��һλ����λ��ÿһλҪ��ʾ������
		MOV @R0,#00H

;����
/*
		MOV R0,#20H
		MOV @R0,#02H
		MOV R0,#21H
		MOV @R0,#06H
		MOV R0,#22H
		MOV @R0,#07H
*/

;ѭ��ȡ�벢��ʾ
	
DISPLAY:
		;����ɨ��
		MOV P0,#00H
		/*
		MOV DPTR,#DIS_DATA
		MOV A,#00H
		MOVC A,@A+DPTR
*/
		MOV R0,#20H
		MOV A,@R0
		MOV R0,A

		JZ DISPLAY
		MOV R3,#020H
		;��̬ɨ��
		S1:
				
				MOV A,R0
				MOV R1,A
				MOV A,#20H
				ADD A,R1
				MOV R1,A
				MOV A,@R1		;ȡ����ʾ��
				
				MOV DPTR,#TABLE
				MOVC A,@A+DPTR	

				;������
				MOV P0,#00H
				MOV P1,A		;p1�ڷ���ʾ����
				MOV P0,R3	;P0��λѡ��
				MOV A,R3
				RR A
				MOV R3,A

				ACALL DELAY

				DJNZ R0,S1
				JMP DISPLAY

;�жϷ������
IR0:
		;�ж��ӳ����ʼ��
		CLR EA
		PUSH ACC
		PUSH PSW
		PUSH 00H;PUSH R0;
		PUSH 01H;PUSH R1;
		PUSH 03H;PUSH R3;
		

		MOV R1,#0FEH
		MOV R4,#00H	;R4��ŵ�ǰɨ����

KEY:	;��ɨ��
		MOV P0,R1
		MOV A,P2
		ANL A,#0FH
		CJNE A,#0FH,L1	;�ж��Ƿ��а�������
		INC R4
		MOV A,R1
		RL A
		MOV R1,A
		CJNE R1,#0EFH,KEY	;ɨ��������
		RETI

L1:	
		MOV R3,#00H ;R3���������
SAO2:		
		JNB ACC.0,SAO1
		RR A
		INC R3
		JMP SAO2

SAO1:
		MOV A,R3
		MOV B,#4
		MUL AB
		ADD A,R4
		MOV R4,A		;��ֵ�ŵ�R4

/*
		MOV A,#00H
		MOV DPTR,#DIS_DATA
		MOVC A,@A+DPTR
		INC A
		MOVX @DPTR,A

				
		MOV R3,A
H:
		INC DPTR
		DJNZ R3,H
		MOV A,R4
		MOVX @DPTR,A
*/
				
	
		
		MOV R0,#20H
		MOV A,@R0

		CJNE A,#06H,AAA		;�Ѿ���6λ�����ˣ���������������
		MOV A,#00H
AAA:
		INC A
		MOV @R0,A		;���ݷŵ�R0�ݴ�
		
		
		ADD A,#20H
		MOV R0,A
		MOV A,R4
		MOV @R0,A		;�����ʾ��


		POP 03H;POP R3;
		POP 01H;POP R1;
		POP 00H;POP R0;
		POP PSW
		POP ACC
		;����
		JNB P3.2,$
		ACALL DELAY60
		SETB EA



JIESHU:	RETI
		





	
		
		
DELAY:
MOV		R7, #2
DELAYLOOP1:
MOV		R6, #2
DELAYLOOP2:
MOV		R5, #10
DELAYLOOP3:
NOP
DJNZ	R5, DELAYLOOP3
DJNZ	R6, DELAYLOOP2
DJNZ	R7, DELAYLOOP1
RET
	
DELAY60: ;��ʱ60ms��� 0us
MOV R7,#07H
DL1:
MOV R6,#0A8H
DL0:
MOV R5,#18H
DJNZ R5,$
DJNZ R6,DL0
DJNZ R7,DL1
RET


TABLE:
		DB	0C0H,0F9H,0A4H,0B0H,099H,092H,082H,0F8H,080H,090H,088H,083H,0C6H,0A1H,086H,08EH

/*DIS_DATA:
		DB 02H,03H,04H	;��һλ����ʾλ��*/



END
