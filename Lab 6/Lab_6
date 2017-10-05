dividing macro
    xor dl, dl
    div cx
    add dl, 48
endm

data segment
    sum dw 2
    buff db ?
data ends

Serial_Experiments segment
Masami:
    assume cs:Serial_Experiments, ds:data
    mov ax, data
    mov ds, ax
    xor ax, ax
    mov ah, 2
    mov dx, 1
    mov cx, 1
    
Lain:
    call f_number_calc
    call f_number_sum
    xchg cx, dx
    cmp ax, 0f05h
    jne Lain
    xor dh, dh
    mov ax, sum
    mov cx, 10
    dividing
    mov buff[4], dl
    dividing
    mov buff[3], dl
    dividing
    mov buff[2], dl
    dividing
    mov buff[1], dl
    dividing
    mov buff[0], dl
    mov buff(5), '$'
    mov dx, offset buff
    xor ax, ax
    mov ah, 09h
    int 21h
    mov ax, 4c00h
    int 21h
    
f_number_calc   proc
f_n_c_start:
    add cx, dx
    mov bx, cx
    ret
    
f_number_calc   endp

f_number_sum   proc
f_n_s_start:
    and bx, 1
    cmp bx, 0
    je even_number
    
odd_number:
    cmp ah, 15
    je f_n_s_stop
    inc ah
    add sum, cx
    jmp f_n_s_stop
    
even_number:
    cmp al, 5
    je f_n_s_stop
    inc al
    add sum, cx

f_n_s_stop:
    ret    
    
f_number_sum   endp 
    
Serial_Experiments ends
end Masami
