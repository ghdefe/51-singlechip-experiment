ORG 00H
MAIN:
		MOV A,#0FEH		; 1111_1110B,��0λ����
LOOP:	
		MOV P1,A			; �������ź������P1��
LCALL DELAY				; ��ʱһ��ʱ��
RL A						; �����ַ�����һλ������һ������
AJMP LOOP				; ѭ��
DELAY:
		MOV R3,#20
D1: MOV R4,#50
D2: MOV R5,#250
DJNZ R5,$
DJNZ R4,D2
DJNZ R3,D1
RET
END
