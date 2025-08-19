.model small
.stack 100h

.code
main proc
    
    mov cx,256
    
    mov ah,2
    mov dl,0
    
    Loop:
        int 21h 
        
        inc dl
        dec cx
        JNZ Loop
    mov ah,4ch
    int 21h
    main endp   