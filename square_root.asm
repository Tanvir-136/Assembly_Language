.MODEL SMALL
.STACK 100h

.DATA
    NUM DW 64
    ANS DW ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, NUM       ; AX := value to take sqrt of
    MOV BX, 1         ; odd number sequence start
    XOR CX, CX        ; CX := 0  (clear counter)

SQRT_LOOP:
    CMP AX, BX
    JB  DONE          ; if AX < BX (unsigned), done
    SUB AX, BX
    ADD BX, 2
    INC CX
    JMP SQRT_LOOP

DONE:
    MOV ANS, CX     ; store result
    MOV AX, 4C00h     ; AH=4Ch (terminate), AL=0 (exit code)
    INT 21h
MAIN ENDP
END MAIN