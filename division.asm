.model small
.stack 100h
.data
p db "Enter two numbers: $"
s db "The static multiplication result is: $"
q db "The multiplication result is: $"
a db ?
b db ?

.code 

main proc  
    
    
    
    ; Multiply two number with static
    
    mov al,3
    mov bl,2
    
    mul bl
    
    mov ah,2
    mov dl,al
    add dl,48
    int 21h
    
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,p
    int 21h
                 
    mov ah,1
    int 21h
    sub al, 48 
    mov a,al
    
    mov ah,1
    int 21h
    sub al, 48
    
    
    mul a  ;al=al*a
    
    aam  ; adjust the multiplication after multiplication
    
    mov bx,ax     ; if the ans is more than 8 bits
    
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    mov ah,9
    lea dx,q
    int 21h
    
    
    mov ah,2
    mov dl,bh
    add dl,48     ; show higher portion 
    int 21h 
    
    mov ah,2
    mov dl,bl     ; show the lower portion
    add dl,48
    int 21h
    
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main