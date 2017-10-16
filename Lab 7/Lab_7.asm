.386

data segment
    divider dw 10
    err_msg db 'Error occured: your string can not be interpreted as hex number.',10,13,'$'
    buff db 6 dup(?)
data ends

code segment use16
start:
    assume cs:code, ds:data
    mov ax, data
    mov ds, ax
    mov cl, 16
    mov ch, 10
    mov buff[5], '$'
    
input_1_1:
    xor ax, ax
    mov ah, 01h
    int 21h
    mov dl, al
    add al, 2
    mov ah, 0
    div ch
    cmp al, 5
    jnz input_1_2
    
deci_1:
    xor ax, ax
    mov al, dl
    sub al, 48
    mul cl
    mov bh, al
    jmp input_2_1
    
input_1_2:    
    xor ax, ax
    mov al, dl
    sub al, 3
    div ch
    cmp al, 9
    jnz error
    
hex_1:
    cmp ah, 4
    jl error
    xor ax, ax
    mov al, dl
    sub al, 87
    mul cl
    mov bh, al

input_2_1:
    xor ax, ax
    mov ah, 01h
    int 21h
    mov dl, al
    add al, 2
    mov ah, 0
    div ch
    cmp al, 5
    jnz input_2_2
    
deci_2:
    sub dl, 48
    add bh, dl
    jmp input_3_1
    
input_2_2:    
    xor ax, ax
    mov al, dl
    sub al, 3
    div ch
    cmp al, 9
    jnz error
    
hex_2:
    cmp ah, 4
    jl error
    sub dl, 87
    add bh, dl

input_3_1:
    xor ax, ax
    mov ah, 01h
    int 21h
    mov dl, al
    add al, 2
    mov ah, 0
    div ch
    cmp al, 5
    jnz input_3_2
    
deci_3:
    xor ax, ax
    mov al, dl
    sub al, 48
    mul cl
    mov bl, al
    jmp input_4_1
    
input_3_2:    
    xor ax, ax
    mov al, dl
    sub al, 3
    div ch
    cmp al, 9
    jnz error
    
hex_3:
    cmp ah, 4
    jl error
    xor ax, ax
    mov al, dl
    sub al, 87
    mul cl
    mov bl, al
    
input_4_1:
    xor ax, ax
    mov ah, 01h
    int 21h
    mov dl, al
    add al, 2
    mov ah, 0
    div ch
    cmp al, 5
    jnz input_4_2
    
deci_4:
    sub dl, 48
    add bl, dl
    jmp input_5
    
input_4_2:    
    xor ax, ax
    mov al, dl
    sub al, 3
    div ch
    cmp al, 9
    jnz error
    
hex_4:
    cmp ah, 4
    jl error
    sub dl, 87
    add bl, dl

input_5:
    xor ax, ax
    mov ah, 01h
    int 21h
    cmp al, 104
    jnz error
    
output:
    int 21h
    mov ax, bx
    xor dx, dx
    div divider
    add dl, 48
    mov buff[4], dl
    mov dl, 0
    div divider
    add dl, 48
    mov buff[3], dl
    mov dl, 0
    div divider
    add dl, 48
    mov buff[2], dl
    mov dl, 0
    div divider
    add dl, 48
    mov buff[1], dl
    mov dl, 0
    div divider
    add dl, 48
    mov buff[0], dl
    lea dx, buff
    mov ah, 09h
    int 21h
    jmp stop
  
error:
    mov ah, 01h
    int 21h
    cmp al, 13
    jnz error
    jmp print_err_msg

print_err_msg:
    xor dx, dx
    lea dx, err_msg
    mov ah, 09h
    int 21h

stop:
    mov ax, 4c00h
    int 21h
    
code ends
end start
