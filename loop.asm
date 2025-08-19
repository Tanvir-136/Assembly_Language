.model small
.stack 100h


.data
tanvir db 'this is loop',13,10, '$' 

.code
main:

    mov ax,@data 
    mov ds,ax
    
    mov cx, 5; print the 'tanvir' string 5 times
    
    
 print_loop: 
    
    mov ah,9
    mov dx, offset tanvir
    int 21h
    
    loop print_loop ; CX = CX - 1,
    
    
    mov ah,4ch
    int 21h
    
end main
