data segment
    message db 'Hello!', 10, 13, 'My name is Vlad.', 10, 13, 'Bye!$'
data ends
         
code segment
start:
    assume cs:code, ds: data
    mov ax, data
    mov ds, ax 
    mov ah, 9
    mov dx, offset message
    int 21h       
    mov ax, 4c00h
    int 21h
code ends
end start
