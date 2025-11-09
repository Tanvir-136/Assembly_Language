; This is a simple program for beginners in the .MODEL SMALL format.
.MODEL SMALL   
.STACK 100H     

.CODE           
MAIN PROC       

    ; We will calculate the 7th fibonacci number (1, 1, 2, 3, 5, 8, 13)
    ; The result will be 13 (0DH)

    ; We will use:
    ; BX = The "current" number (fib N-1), starts at 1
    ; DX = The "next" number (fib N), starts at 1
    ; AX = A temporary register for swapping
    ; CX = The loop counter
    
    mov bx, 1h  
    mov dx, 1h  
    mov cx, 5h 

; This is the start of our loop
FIB_LOOP:
    ; --- The Fibonacci Swap --
    mov ax, dx
    add dx, bx
    mov bx, ax
    loop FIB_LOOP

; --- Exit the Program ---
    ; This is the standard way to exit a .MODEL SMALL program
    MOV AH, 4CH
    INT 21H

MAIN ENDP      
END MAIN   