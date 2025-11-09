.MODEL SMALL
.STACK 100H

.DATA

    NUM1 DW 1234H
    NUM2 DW 5678H
    RESULT_LOW  DW ? 
    RESULT_HIGH DW ?

.CODE
MAIN PROC
    ; --- Setup Data Segment ---
    MOV AX, @DATA
    MOV DS, AX
    MOV AX, NUM1    ; AX = 1234H
    MOV BX, NUM2    ; BX = 5678H
    MUL BX
    
    ; 4. Store the 32-bit result
    MOV RESULT_LOW, AX    ; Store the low part
    MOV RESULT_HIGH, DX   ; Store the high part

    ; --- Exit the Program ---
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN