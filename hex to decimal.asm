.model small
.stack 100h   
.data
p db "Enter a hex digit: $"
q db "The covered decimal digit: $"
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,p
    int 21h
    
                    ;A=10, B=11, C=12, D=13, E=14, F=15  
    
    mov ah,1
    int 21h
    mov bl,al
    
    sub bl,17
    
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    mov ah,9
    lea dx,q
    int 21h
    
    mov ah,2
    mov dl,49    ; 49=1
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h               
    
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
   
    
           
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main