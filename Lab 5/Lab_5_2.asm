dividing macro
    idiv divider_2
    push ax
    inc counter
    mov ah, 0
endm

print   macro
    pop ax
    add ah, 48
    mov dl, ah
    mov ah, 02h
    int 21h
endm

print_str   macro string
    mov ah_buff, ah
    mov w_buff, dx
    mov ah, 09h
    mov dx, offset string
    int 21h
    mov ah, ah_buff
    mov dx, w_buff
endm

data segment
    b_buff_1 db 0
    b_buff_2 db 0
    w_buff dw 0
    ah_buff db 0
    counter db 0
    x db 5
    y db 3
    z db -4
    divider db 2
    divider_2 db 10
    msg_1 db 'First number is bigger.',10,13,'$'
    msg_2 db 'Second number is bigger.',10,13,'$'
    msg_3 db 'They are equal.',10,13,'$'
    sign_flag_2 db 0
    sign_flag_1 db 0
data ends

Gothic segment
Knorinis:
    assume cs:gothic, ds:data
    mov ax, data
    mov ds, ax
    mov al, x
    mov bl, z
    mov cl, y
    imul bl
    add ax, cx
    idiv divider
    mov b_buff_1, al
    js set_flag_1
    jmp Jharkendar
    
set_flag_1:
    mov sign_flag_1, 1  
    mov dl, 255
    sub dl, al
    xor al, al
    mov al, dl
    inc al
    cmp ah, 0
    je Jharkendar
    add ah, 2
    
Jharkendar:
    push ax
    mov bl, x
    mov bh, y
    sub bl, bh
    mov bh, z
    add bl, bh
    mov b_buff_2, bl
    js set_flag_2
    jmp Mine_valley

set_flag_2:
    mov sign_flag_2, 1
    mov dl, 255
    sub dl, bl
    mov bl, dl
    inc bl

Mine_valley:
    pop cx
    mov dh, ch
    xor ax, ax
    mov al, cl
    jmp on_screen_1
    
compare:
    mov ah, 02h
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    mov cl, b_buff_1
    mov bl, b_buff_2
    cmp cl, bl
    je equal
    jg first_is_bigger
    jmp second_is_bigger

equal:
    cmp dh, 0
    jne not_rly
    print_str msg_3
    jmp Irdorath
    
not_rly:
    cmp ax, 0
    jg first_is_bigger
    jmp second_is_bigger
    jmp Irdorath
    
first_is_bigger:
    print_str msg_1
    jmp Irdorath
    
second_is_bigger:
    print_str msg_2
    jmp Irdorath
    
on_screen_1:
    dividing
    cmp al, 0
    jne on_screen_1
    cmp sign_flag_1, 0
    je on_screen_2
 
on_screen_sign_1:
    mov ah, 02h
    mov dl, 45
    int 21h
    
on_screen_2:
    print
    dec counter
    cmp counter, 0
    jne on_screen_2
    
on_screen_3:
    mov ah, 02h
    mov dl, 46
    int 21h
    mov ah, 0
    mov al, dh
    mov dl, 5
    mul dl

on_screen_4:
    dividing
    cmp al, 0
    jne on_screen_4

on_screen_5:
    print
    dec counter
    cmp counter, 0
    jne on_screen_5

on_screen_6:
    mov ah, 02h
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    xor ax, ax
    mov al, bl
    cmp sign_flag_2, 0
    je on_screen_7
    
on_screen_sign_2:
    xor bx, bx
    mov bl, al
    mov ah, 02h
    mov dl, 45
    int 21h
    xor ax, ax
    mov al, bl

on_screen_7:
    dividing
    cmp al, 0
    jne on_screen_7
    
on_screen_8:
    print
    dec counter
    cmp counter, 0
    jne on_screen_8
    jmp compare
    
Irdorath:
    mov ax, 4c00h
    int 21h
end Knorinis
Gothic ends
