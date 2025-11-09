.MODEL SMALL
.STACK 100H

.DATA
    ; 1101 0010 1010 1100 (binary) = D2AC (hex)
    ; This is equal to 53932 in decimal.
    BINARY_NUM DW 0D2ACH 
    DECIMAL_RESULT DW ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; --- Binary to Decimal Conversion ---
    MOV BX, BINARY_NUM  ; BX = D2ACH
    MOV AX, 0           ; AX = 0
    MOV CX, 1           ; CX = 1
    MOV SI, 16

CONVERT_LOOP:
    SHR BX, 1           ; Shift BX right, lowest bit is now in CF
    JNC BIT_IS_ZERO
    ADD AX, CX
    
BIT_IS_ZERO:
    SHL CX, 1           ; CX = 1 -> 2 -> 4 -> 8 ...
    DEC SI
    JNZ CONVERT_LOOP
    MOV DECIMAL_RESULT, AX

    ; --- Exit the Program ---
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN