.MODEL SMALL 
.STACK 100H
.DATA 
    BCD_NUM1 DW 1234H
    BCD_NUM2 DW 5678H
    RESULT DW ?
.CODE   
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AX, 0H
    MOV AL, BYTE PTR BCD_NUM1   ; low byte of num1
    ADD AL, BYTE PTR BCD_NUM2   ; add num1(low byte) + num2(low byte)
    DAA   
    MOV BYTE PTR RESULT, AL     ; store result of low byte
    
    MOV AL, BYTE PTR BCD_NUM1 + 1 ; high byte of num1
    ADC AL, BYTE PTR BCD_NUM2 + 1 ; add with carry num1(high byte) + num2(high byte)
    DAA   
    MOV BYTE PTR RESULT + 1, AL 
    MOV AX, 4CH
    INT 21H   
MAIN ENDP
END MAIN