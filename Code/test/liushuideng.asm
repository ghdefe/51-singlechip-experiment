START:
CLR           P1.0
ACALL         DELAY
SETB          P1.0
CLR           P1.1
ACALL         DELAY
SETB          P1.1
CLR           P1.2
ACALL         DELAY
SETB          P1.2
CLR           P1.3
ACALL         DELAY
SETB          P1.3
CLR           P1.4
ACALL         DELAY
SETB          P1.4
CLR           P1.5
ACALL         DELAY
SETB          P1.5
CLR           P1.6
ACALL         DELAY
SETB          P1.6
CLR           P1.7
ACALL         DELAY
SETB          P1.7
CLR           P1.6
ACALL         DELAY
SETB          P1.6
CLR           P1.5
ACALL         DELAY
SETB          P1.5
CLR           P1.4
ACALL         DELAY
SETB          P1.4
CLR           P1.3
ACALL         DELAY
SETB          P1.3
CLR           P1.2
ACALL         DELAY
SETB          P1.2
CLR           P1.1
ACALL         DELAY
SETB          P1.1
CLR           P1.0
ACALL         DELAY
SETB          P1.0
ACALL         DELAY
AJMP          START
DELAY:
MOV           R5,#10
LOOP1:
MOV           R6,#200
LOOP2:
MOV           R7,#250
DJNZ          R7,$
DJNZ          R6,LOOP2
DJNZ          R5,LOOP1
RET
END
