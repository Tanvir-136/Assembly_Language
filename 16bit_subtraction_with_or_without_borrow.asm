.MODEL SMALL
.STACK 100H

.DATA
    ; --- Example 1: No Borrow (5555H > 1234H) ---
    ;NUM1 DW 5555H  ; The number we are subtracting FROM
    ;NUM2 DW 1234H  ; The number we are subtracting
    
    ; --- Example 2: With Borrow (1000H < 2000H) ---
    ; To test this, comment out the lines above (with ';')
    ; and uncomment these three lines:
    NUM1 DW 1000H
    NUM2 DW 2000H
    
    
    RESULT DW ?

.CODE
MAIN PROC
    ; --- Setup Data Segment ---
    MOV AX, @DATA
    MOV DS, AX
    MOV AX, NUM1    

    SUB AX, NUM2   
    MOV RESULT, AX
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN