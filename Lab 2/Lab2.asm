data segment
    x db 17
    y db 25
    divider db 10
    buff db (?)
data ends

code segment
start:
    assume cs:code, ds: data
    mov ax, data
    mov ds, ax 
    mov bh, x
    add bh, y
    mov al, bh;
    div divider
    mov buff[2], '$'
    add ah, 48
    mov buff[1], ah
    div divider
    add ah, 48
    mov buff[0], ah
    mov ah, 9
    lea dx, buff
    int 21h
    mov ax, 4c00h
    int 21h    
code ends
end start
