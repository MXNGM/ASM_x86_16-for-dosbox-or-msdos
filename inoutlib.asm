print_char:
    push ax
    push bx
    mov ah, 0x0e
    mov bx, 0x000f
    int 10h
    pop bx
    pop ax
    ret

print_digit:
    push ax
    add al, 0x30
    call print_char
    pop ax
    ret

newline:
    push ax
    mov al, 0x0a
    call print_char
    mov al, 0x0d
    call print_char
    pop ax
    ret

read_input_wait:
    mov ah, 0x00
    int 0x16
    ret

print_string:
    push ax
    push bx
    mov bx, ax
    jmp in1
in1:
    mov al, [bx]
    test al, al
    jz in2
    call print_char
    inc bx
    jmp in1
in2:
    pop bx
    pop ax
    ret

rand:
    push bx
    push cx
    push dx
    in al, (0x40)       
    and al, 0x07        
    add al, 0x30
    pop dx
    pop cx
    pop bx
    ret