                                ; Add two number
.model small
.stack 100h
.data
p db "Enter two numbers: $" 
q db "Enter three numbers: $"
.code

main proc 
    mov ax,@data
    mov ds,ax
    
    
    mov ah,9
    mov dx,offset p      ; alternate 'lea dx,p'
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,1
    int 21h
    mov bh,al
    
    add bl,bh    ;bl=bl+bh
    
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    mov ah,2
    mov dl,bl
    sub dl,48   ; Because in ASCII code 0=48
    int 21h
    
    mov ah,2
    mov dl,0Ah     ; for new line
    int 21h
    mov dl,0Dh
    int 21h
            
            
            
                       ; Add three number
    mov ah,9
    lea dx,q
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    int 21h
    mov bh,al            ; No need to call 'mov ah,1' once initialize then we just call int 21h
    
    int 21h
    mov cl,al
    
    add bl,bh
    sub bl,48
    
    add bl,cl
    sub bl,48
    
    mov ah,2
    mov dl,0Ah     ; for new line
    int 21h
    mov dl,0Dh
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h 
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main