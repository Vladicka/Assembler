code segment
start:
    assume cs:code
    mov ah, 0
    mov al, 10h
    int 10h
    mov ah, 0ch
    mov al, 15
    mov cx, 60
    mov dx, 5
    
for_1:
    int 10h
    inc dx
    cmp dx, 40
    jne for_1
    
for_2:
    mov dx, 5
    inc cx
    int 10h
    cmp cx, 75
    jne for_2
    
for_3:
    mov dx, 20
    dec cx
    int 10h
    cmp cx, 60
    jne for_3
    mov ax, 4c00h
    int 21h
code ends
end start
