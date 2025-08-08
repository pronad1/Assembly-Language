;XCHG keyword
.model samll
.stack 100h
.code

main proc
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,1
    int 21h
    mov bh,al
    
    xchg bl,bh   ; exchange the value of bl and bh
              
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    
    mov ah,2
    mov dl,bl
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h
    
    
    
    ; beep print
    mov ah,2
    mov dl,07   ;It return beep sound
    int 21h
    
    mov ah,2
    mov dl,07   ;It return beep sound
    int 21h
    
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main