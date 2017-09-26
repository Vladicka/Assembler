code segment
start:
    mov ah, 0
    mov al, 10h
    int 10h
    push es
    xor ax, ax
    mov es, ax
    mov ah, 6
    mov al, 0
    mov bh, 15
    xor cx, cx
    mov dh, es:[484h]
    mov dl, es:[44Ah]
    dec dl
    int 10h
    pop es
    mov ax, 4c00h
    int 21h
code ends
end start
