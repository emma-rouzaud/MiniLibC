section .text
    global strncmp

strncmp:
    push rbp
    mov rbp, rsp
    mov bl, 1

    start_my_strncmp:

    cmp bl, dl
    je end_my_strncmp

    cmp byte [rsi], 0
    je end_my_strncmp

    cmp byte [rdi], 0
    je end_my_strncmp

    mov al, byte [rdi]
    cmp byte [rsi], al
    jne end_my_strncmp

    add rsi, 1
    add rdi, 1
    add bl, 1

    jmp start_my_strncmp

    end_my_strncmp:

    mov rax, 0
    mov rbx, 0
    mov al, byte [rdi]
    mov bl, byte [rsi]
    sub rax, rbx
    leave
    ret
