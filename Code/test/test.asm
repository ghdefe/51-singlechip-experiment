ORG 00H
LJMP MAIN

ORG 0003H
EX0ISR:	CLR P1.7
			RETI
ORG 0013H
EX1ISR:	SETB P1.7
			RETI

ORG 30H
MAIN:
		SETB EA
		SETB EX0
		SETB IT0
		SETB EX1
		SETB IT1



SKIP:	SJMP $
		END


