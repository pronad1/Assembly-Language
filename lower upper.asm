                                ; Lower to Upper Case
.model small
.stack 100h
.data 
a db 'Enter a lower character: $'
aa db 'The uppr character is : $'
b db 'Enter a upper character: $'
bb db 'The lower character is : $'

.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    sub bl,32 ; Because in ascii a=97 A=65 (97-65)=32
    
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    mov ah,9
    lea dx,aa
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
                                       ; Upper to Lower
    
    
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    
    add bh,32      ; Because in ascii a=97 A=65 (97-65)=32
    
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    mov ah,9
    lea dx,bb
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main