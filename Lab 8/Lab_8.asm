data segment
    filename db 'file.txt',0h
    buff db 512 dup(01h)
data ends

code segment
start:
    assume cs:code, ds:data
    mov ax, data
    mov ds, ax
    mov ah, 3dh
    mov al, 2
    lea dx, filename
    int 21h
    mov bx, ax
    mov ah, 3fh
    mov cx, 512
    lea dx, buff
    int 21h
    xor cx, cx

crypt:
    xor buff[si], 'A'
    inc si
    xor buff[si], 'R'
    inc si
    xor buff[si], 'C'
    inc si
    xor buff[si], 'H'
    inc si
    xor buff[si], 'E'
    inc si
    xor buff[si], 'R'
    inc si
    cmp si, ax
    jl crypt
    
write:
    mov cx, ax
    mov ah, 40h
    lea dx, buff
    int 21h

stop:
    mov ax, 4c00h
    int 21h
code ends
end start
