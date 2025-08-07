.model small
.stack 100h
.data 
p db "Enter a number:$"
a db 53                                                  
b db ?
.code

main proc
    mov ax,@data
    mov ds,ax
      
    mov ah,9         ;It's show the string p
    mov dx, offset p
    int 21h
    
    
    mov ah,1
    int 21h             ;input
    mov b,al                  
    
    mov ah,2
    mov dl,a       ;output a
    int 21h       
    
    mov ah,2
    mov dl,b         ;output b
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main