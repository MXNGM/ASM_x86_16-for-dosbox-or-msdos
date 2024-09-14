org 0x100                        ;program mode for ms-dos


start:
    mov ax, 0x0011               ;Move 00 to ah, and 12 to al. Set graphic mode to 640x480, B/W
    int 10h                      ;sys interupt for graphic mode
    mov ax, welcome
    push ax
    push bx
    mov bx, ax
    jmp in3
in3:
    mov al, [bx]
    test al, al
    jz in4
    push ax
    push bx
    mov ah, 0x0e
    mov bx, 0x000f
    int 10h
    pop bx
    pop ax
    inc bx
    jmp in3
in4:
    pop bx
    pop ax
    push ax
    mov al, 0x0a
    mov ah, 0x0e
    mov bx, 0x000f
    int 10h
    mov al, 0x0d
    mov ah, 0x0e
    mov bx, 0x000f
    int 10h
    pop ax
    push bx
    push cx
    push dx
    in al, (0x40)       
    and al, 0x07        
    add al, 0x30
    pop dx
    pop cx
    pop bx
    mov cl, al
    xor dx, dx
    mov [score], dx
    jmp main    
        
main:
    mov dx, [score]
    inc dl
    mov [score], dx
    mov ax, in
    push ax
    push bx
    mov bx, ax
    jmp in1
in1:
    mov al, [bx]
    test al, al
    jz in2
    push ax
    push bx
    mov ah, 0x0e
    mov bx, 0x000f
    int 10h
    pop bx
    pop ax
    inc bx
    jmp in1
in2:
    pop bx
    pop ax
    mov ah, 0x00
    int 0x16
    push ax
    mov ah, 0x0e
    mov bx, 0x000f
    int 10h
    mov al, 0x0a
    mov ah, 0x0e
    mov bx, 0x000f
    int 10h
    mov al, 0x0d
    mov ah, 0x0e
    mov bx, 0x000f
    int 10h
    pop ax
    cmp al, cl
    jne main
    je exit

exit:
    mov ax, end
    push ax
    push bx
    mov bx, ax
    jmp in5
in5:
    mov al, [bx]
    test al, al
    jz in6
    push ax
    push bx
    mov ah, 0x0e
    mov bx, 0x000f
    int 10h
    pop bx
    pop ax
    inc bx
    jmp in5
in6:
    pop bx
    pop ax
    xor ax, ax
    mov al, " "
    push ax
    push bx
    mov ah, 0x0e
    mov bx, 0x000f
    int 10h
    pop bx
    pop ax
    mov dx, [score]
    mov al, dl 
    add al, 0x30
    push ax
    push bx
    mov ah, 0x0e
    mov bx, 0x000f
    int 10h
    pop bx
    pop ax
    xor ax, ax                  ;set ax to 0
    int 20h                     ;exit program

welcome:
    db "Welcome!, Guess the number!", 0x00

in:
    db "Number: ", 0x00

end:
    db "Correct, Tries number:", 0x00

score:
    db 0

sign:
    db "hof"