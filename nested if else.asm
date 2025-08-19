.model small
.stack 100h
.data
a db 10,13,'Greater than 5 $'   ; we use 10,13 for print new line before print the message
b db 10,13,'Less than 5 $'
c db 10,13,'Equal to 5 $'
p db 10,13,'Enter a number: $'

.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,p
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    cmp bl,53
    
    je L1
    jg L2
    jmp L3
    
    L1:
    mov ah,9
    lea dx,c
    int 21h
    jmp exit:
    
    L2:
    mov ah,9
    lea dx,a
    int 21h
    jmp exit:
    
    L3:
    mov ah,9
    lea dx,b
    int 21h
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main