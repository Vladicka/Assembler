data segment
    x db 127
    y db 128
    divider db 10
    buff db (?)
data ends

code segment
start:
    assume cs:code, ds: data
    mov bx, data
    mov ds, bx 
    mov al, x
    add al, y
    div divider
    add ah, 48
    mov buff[2], ah
    mov ah, 0
    div divider
    add ah, 48
    mov buff[1], ah
    add al, 48
    mov buff[0], al 
    mov buff[3], '$'
    mov ah, 9
    mov dx, offset buff
    int 21h
    mov ax, 4c00h
    int 21h    
code ends
end start
