.model small
.stack 100h
.data
.code
main proc
    mov dh,0ABh
    mov si,1234h
    mov 43h[si], dh
    mov bl,43h[si] 
    
    mov ah,2
    mov dl,bl
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
    
end main