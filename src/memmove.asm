section .text
    global memmove

memmove:
    push rbp
    mov rbp, rsp
    mov rax, 0

    get_start:

    cmp al, dl
    je get_start_stop

    add rsi, 1
    add al, 1
    jmp get_start

    get_start_stop:
    sub rsi, 1

    start_copy:

    cmp al, 0
    je end_copy

    mov r10, 0
    mov r10b, byte [rsi]
    push r10

    sub rsi, 1
    sub al, 1
    jmp start_copy

    end_copy:

    mov bl, 0

    start_memmove:

    cmp bl, dl
    je end_memmove
    pop r8
    mov byte [rdi], r8b

    add rdi, 1
    add rsi, 1
    add bl, 1

    jmp start_memmove

    end_memmove:
    mov rax, rcx
    leave
    ret
