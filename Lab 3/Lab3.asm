fate segment
    buff db (?)
fate ends

servents segment
archer:
    assume cs:servents, ds:fate
    mov ax, fate
    mov ah, 1
    mov dx, 0
    mov cx, 0
    int 21h
    mov bh, al
    sub bh, 48
    int 21h
    cmp al, 13 
    je assassin
    mov ch, al
    sub ch, 48
    int 21h
    cmp al, 13
    je berserker
    mov dh, al
    sub dh, 48
    int 21h
    jmp caster
    
assassin:
    xchg dh, bh
    jmp caster
   
berserker:
    xchg dh, ch
    xchg ch, bh
    jmp caster

caster:
    int 21h
    mov bl, al
    sub bl, 48
    int 21h
    cmp al, 13
    je lancer
    mov cl, al
    sub cl, 48
    int 21h
    cmp al, 13
    je rider
    mov dl, al
    sub dl, 48
    int 21h
    jmp saber
    
lancer:
    xchg dl, bl
    jmp saber
    
rider:
    xchg dl, cl
    xchg cl, bl
    jmp saber

saber:
    mov ah, 0
    mov al, dh
    add al, dl
    mov dh, 10
    div dh
    add ah, 48
    mov buff[3], ah
    add ch, al
    mov ax, 0
    mov al, ch
    add al, cl
    div dh
    add ah, 48
    mov buff[2], ah
    add bh, al
    mov ax, 0
    mov al, bh
    add al, bl
    div dh
    add ah, 48
    add al, 48
    mov buff[1], ah
    mov buff[0], al
    mov ax, 0
    mov ah, 9
    mov buff[4], '$'
    mov dx, offset buff
    int 21h
    mov ax, 4c00h
    int 21h
end archer
servents ends
