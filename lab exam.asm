.model small
.stack 100h
.data
    prompt1 db 'Enter first alphabet: $'
    prompt2 db 10, 13, 'Enter second alphabet: $'
    prompt3 db 10, 13, 'Enter third alphabet: $'
    output db 10, 13, 'The correct order is: $'
    ch1 db ?
    ch2 db ?
    ch3 db ?
    result db 4 dup('$') 

.code
main proc
    mov ax, @data
    mov ds, ax

    
    mov ah, 09h
    lea dx, prompt1
    int 21h
    
    mov ah, 01h
    int 21h
    mov ch1, al

    
    mov ah, 09h
    lea dx, prompt2
    int 21h
    
    mov ah, 01h
    int 21h
    mov ch2, al

    
    mov ah, 09h
    lea dx, prompt3
    int 21h   
    
    mov ah, 01h
    int 21h
    mov ch3, al

    
    mov al, ch1
    cmp al, ch2
    jle ch1_ch2_ok
    xchg al, ch2
    mov ch1, al
ch1_ch2_ok:

    
    mov al, ch1
    cmp al, ch3
    jle ch1_ch3_ok
    xchg al, ch3
    mov ch1, al
ch1_ch3_ok:

    
    mov al, ch2
    cmp al, ch3
    jle ch2_ch3_ok
    xchg al, ch3
    mov ch2, al
ch2_ch3_ok:

    
    mov al, ch1
    mov result, al
    mov al, ch2
    mov result+1, al
    mov al, ch3
    mov result+2, al
    mov byte ptr result+3, '$'

   
    mov ah, 09h
    lea dx, output
    int 21h

    
    mov ah, 09h
    lea dx, result
    int 21h

    
    mov ah, 4Ch
    int 21h
main endp
end main