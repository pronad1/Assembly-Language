.model small           
.stack 100h

.data
a db  0Dh,0Ah,"This number is Non-negative $" ; Message if number >= 0
b db  0Dh,0Ah,"This number is Negative $"     ; Message if number < 0
p db  "Enter a number: $"                      ; Input prompt
num dw ?                                       ; To store final 16-bit number
negFlag db 0                                   ; Flag to mark negative numbers

.code
main proc
    mov ax,@data       ; Load data segment address
    mov ds,ax          ; Initialize DS with it (so we can access variables in .data)

    mov ah,9           ; DOS function: print string
    lea dx,p           ; Load offset of prompt string
    int 21h            ; Call DOS interrupt to print


    mov negFlag,0      ; negFlag = 0 ? not negative yet


    mov ah,1           ; DOS function: read character (echoed to screen)
    int 21h            ; Waits for user input ? AL = key pressed

    cmp al,'-'         ; Was it a minus sign?
    jne first_digit    ; If not, go process digit normally
    mov negFlag,1      ; If yes, mark as negative (negFlag = 1)

    mov ah,1
    int 21h            ; Get next key into AL

first_digit:
    sub al,'0'         ; Convert ASCII digit ? numeric value (e.g. '5' -> 5)
    mov cx,ax          ; CX = first digit value

read_loop:
    mov ah,1
    int 21h            ; Read next char
    cmp al,0Dh         ; Is it Enter (Carriage Return)?
    je done_input      ; If Enter, stop reading
    sub al,'0'         ; Convert ASCII digit to number
    mov bx,ax          ; BX = current digit
    mov ax,cx          ; AX = number so far
    mov dx,10
    mul dx             ; AX = AX * 10
    add ax,bx          ; AX = AX + new digit
    mov cx,ax          ; Store updated result in CX
    jmp read_loop      ; Repeat for next digit


done_input:
    mov ax,cx          ; Move result into AX
    cmp negFlag,0      ; Was there a '-' sign?
    je check           ; If not, keep as positive
    neg ax             ; If yes, negate the value (make AX negative)

check:
    mov num,ax         ; Store final signed number in "num"

    cmp num,0          ; Compare with 0
    jl isneg           ; If less than 0, jump to negative branch

    mov ah,9
    lea dx,a
    int 21h
    jmp exit

isneg:

    mov ah,9
    lea dx,b
    int 21h

exit:
    mov ah,4Ch         ; DOS function: terminate program
    int 21h

main endp
end main
