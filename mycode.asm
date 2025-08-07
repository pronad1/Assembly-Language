               ;
.model small
.stack 100h
.code

main proc
    mov ah,1
    int 21h               ;input
    mov bl,al
    
    mov ah,2             ;for new line 
    mov dl,0Ah 
    int 21h
           
    mov dl,oDh        ;crarage return
    int 21h
    
    mov ah,2
    mov dl,bl    ;output
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main