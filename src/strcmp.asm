section .text
    global strcmp

strcmp:
    push rbp
    mov rbp, rsp

    start_strcmp:

    cmp byte [rdi], 0
    je end_strcmp

    cmp byte [rsi], 0
    je end_strcmp

    mov al, byte [rdi]
    cmp byte [rsi], al
    jne end_strcmp

    add rsi, 1
    add rdi, 1

    jmp start_strcmp

    end_strcmp:
    mov rax, 0
    mov rbx, 0
    mov al, byte [rdi]
    mov bl, byte [rsi]
    sub rax, rbx
    leave
    ret
