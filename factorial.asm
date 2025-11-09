.MODEL SMALL
.STACK 100H

.DATA
    NUM DW 5
    RESULT DW ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; --- Factorial Calculation ---
    MOV CX, NUM  ; CX = 5
    MOV AX, 1    ; AX = 1
    
; Start the loop
FACTORIAL_LOOP:
    CMP CX, 1
    JBE DONE
    MUL CX  ; 1 * 5 -> 5 * 4 -> 20 * 3 -> 60 * 2 -> 120 * 1
    DEC CX  ; CX = 5 -> 4 -> 3 -> 2    
    JMP FACTORIAL_LOOP

DONE:
    MOV RESULT, AX
    ; --- Exit the Program ---
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN