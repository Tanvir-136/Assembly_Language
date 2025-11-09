.MODEL SMALL
.STACK 100H

.DATA
    DECIMAL_NUM DW 53932 
    ; Variable to store the final binary result.
    ; The result will be 1101001010101100b,(D2ACH) in hex.
    BINARY_RESULT DW ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; --- Decimal to Binary Conversion ---
    MOV AX, DECIMAL_NUM     ; AX = 53932 (D2ACH)
    
    ; Set our divisor to 2.
    MOV BX, 2
    
    ; Set our loop counter to 16 (for 16 bits).
    MOV CX, 16

PUSH_LOOP:
    ; Clear DX. This is CRITICAL for 16-bit division,
    ;    as the processor divides DX:AX by BX.
    MOV DX, 0
    
    ; Divide DX:AX by BX.
    DIV BX
    PUSH DX
    DEC CX
    JNZ PUSH_LOOP 
       
    MOV CX, 16
    MOV BX, 0

POP_LOOP:
    SHL BX, 1
    POP DX
    
    ; OR the bit from DX into our result (BX).
    ;     e.g., if BX = 1100b and DX = 1,
    ;     OR BX, DX makes BX = 1101b.
    OR BX, DX
    DEC CX
    JNZ POP_LOOP
    
    MOV BINARY_RESULT, BX
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN