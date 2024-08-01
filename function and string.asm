.model small
.stack 100h 
.data
 a db 'Hello World $'
 
.code
main proc
    
    mov ax,@data
    mov ds,ax 
    
    mov ah,9;character string output
    lea dx,a
    int 21h
            
            
            
    mov ah,1;single key input
    int 21h
    mov bl,al 
    
    mov ah,2;single character output
    mov dl,bl
    int 21h
     
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
