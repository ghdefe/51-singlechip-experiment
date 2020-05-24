ORG 00H
SETB P1.0

START:
	MOV TMOD,#50H
	MOV TH1,#0FFH
	MOV TL1,#0FBH
	SETB TR1

WAIT:
	JNB TF1,WAIT
	CLR TF1
	CLR P1.0
LOOP:
	MOV A,TL1
	CJNE A,#01H,LOOP
	SETB P1.0
	JMP START
END
