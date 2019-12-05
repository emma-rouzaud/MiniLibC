section .text
    global putstr
    global strcpy
    global strcat
    global strlen

strlen:
    push rbp
    mov rbp, rsp

    mov rax, 0
    start_strlen:
    cmp byte [rdi], 0
    je end_strlen
    add rax, 1
    add rdi, 1
    jmp start_strlen

    end_strlen:
    leave
    ret

putstr:
    push rbp
    mov rbp, rsp

    mov rsi, rdi
    mov rdi, 1
    mov rdx, 1

    start_putstr:

    cmp byte [rsi], 0
    je end_putstr
    mov rax, 1
    syscall
    add rsi, 1
    jmp start_putstr

    end_putstr:
    leave
    ret

strcpy:
    push rbp
    mov rbp, rsp

    start_strcpy:

    cmp byte [rsi], 0
    je end_strcpy
    mov al, byte [rsi]
    mov byte [rdi], al
    add rsi, 1
    add rdi, 1
    jmp start_strcpy

    end_strcpy:
    mov byte [rdi], 0

    leave
    ret

strcat:
    push rbp
    mov rbp, rsp

    call strlen
    call strcpy

    leave
    ret
