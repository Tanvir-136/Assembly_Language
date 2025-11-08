.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AH, 02H
    MOV DL, 'H'
    INT 21H
    MOV AH, 02H
    MOV DL, 'E'
    INT 21H
    MOV AH, 02H
    MOV DL, 'L'
    INT 21H
    MOV AH , 02H
    MOV DL, 'L'
    INT 21H
    MOV AH, 02H
    MOV DL, 'O'
    INT 21H
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
    