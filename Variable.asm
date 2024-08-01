.model small
.stack 100h

.data
 hlw db 5
 hlw1 db ?
 
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,2 
    add hlw,48
    mov dl,hlw
    int 21h 
    
    mov ah,1
    int 21h
    mov hlw1,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,hlw1
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main