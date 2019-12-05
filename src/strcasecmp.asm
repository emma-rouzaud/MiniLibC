section .text
    global strcasecmp

set_to_maj:
    push rbp
    mov rbp, rsp

    cmp bl, 'A'
    jl second_check

    cmp bl, 'Z'
    jg second_check

    add bl, 32

    second_check:

    cmp al, 'A'
    jl end_to_maj

    cmp al, 'Z'
    jg end_to_maj

    add al, 32

    end_to_maj:
    leave
    ret


strcasecmp:
    push rbp
    mov rbp, rsp

    start_my_strcasecmp:

    cmp byte [rsi], 0
    je end_my_strcasecmp

    cmp byte [rdi], 0
    je end_my_strcasecmp

    mov al, byte [rdi]
    mov bl, byte [rsi]
    call set_to_maj
    cmp bl, al
    jne end_my_strcasecmp

    add rsi, 1
    add rdi, 1

    jmp start_my_strcasecmp

    end_my_strcasecmp:

    mov rax, 0
    mov rbx, 0
    mov al, byte [rdi]
    mov bl, byte [rsi]
    sub rax, rbx
    leave
    ret
