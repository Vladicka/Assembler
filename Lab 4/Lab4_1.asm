data segment
    mes db 10,13,'$'
data ends

code segment
start:
    assume cs:code, ds:data
    mov bx, data
    mov ds, bx
    mov dx, offset mes
    mov ah, 1
    int 21h
    cmp al, 13
    je stop
    sub al, 48
    mov ch, al
    int 10h
    mov ah, 9
    int 21h
    jmp start

stop:
    mov ax, 4c00h
    int 21h
code ends
end start
