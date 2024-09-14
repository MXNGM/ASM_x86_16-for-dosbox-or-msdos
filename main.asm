org 0x100                        ;program mode for ms-dos


start:
    mov ax, 0x0011               ;Move 00 to ah, and 12 to al. Set graphic mode to 640x480, B/W
    int 10h                      ;sys interupt for graphic mode
    mov ax, welcome
    call print_string
    call newline
    call rand
    mov cl, al
    xor dx, dx
    mov [score], dx
    jmp main    
        
main:
    mov dx, [score]
    inc dl
    mov [score], dx
    mov ax, in
    call print_string
    call read_input_wait
    call print_char
    call newline
    cmp al, cl
    jne main
    je exit

exit:
    mov ax, end
    call print_string
    xor ax, ax
    mov al, " "
    call print_char
    mov dx, [score]
    mov al, dl 
    call print_digit
    xor ax, ax                  ;set ax to 0
    int 20h                     ;exit program
    %include "inoutlib.asm"

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