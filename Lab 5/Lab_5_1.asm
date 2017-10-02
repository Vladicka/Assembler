print   macro
    pop ax
    add ah, 48
    mov dl, ah
    mov ah, 02h
    int 21h
endm

print_str   macro string
    mov ah, 09h
    mov dx, offset string
    int 21h
endm
    
data segment
    empty_str db 10, 13, '$'
    msg_1 db 'Letters: $'
    msg_2 db 'Words: $'
    divider db 10
data ends

code segment
start:
    assume cs:code, ds:data
    mov ax, data
    mov ds, ax
    mov ah, 01h
    
space_count:
    inc bl   
    
step_1:
    int 21h
    inc bh
    cmp al, 32
    je space_count
    cmp al, 13
    jne step_1
    
step_2_prep:
    sub bh, 1
    mov ax, 0
    mov al, bh
    
step_2:
    div divider
    push ax
    inc ch
    mov ah, 0
    cmp al, 0
    jne step_2
    
step_3_prep:
    print_str msg_1    
    
step_3:
    print
    dec ch
    cmp ch, 0
    jne step_3
    
step_4_prep:
    print_str empty_str
    mov ah, 0
    mov al, bl
    
step_4:
    div divider
    push ax
    inc ch
    mov ah, 0
    cmp al, 0
    jne step_4
    
step_5_prep:
    print_str msg_2
 
step_5:    
    print
    dec ch
    cmp ch, 0
    jne step_5
    
stop:
    mov ax, 4c00h
    int 21h
    
code ends
end start
