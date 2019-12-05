section .text
    global memcpy

memcpy:
    push rbp
    mov rbp, rsp
    mov bl, 0
    mov rcx, rdi

    start_memcpy:

    cmp bl, dl
    je end_memcpy
    mov r8b, byte [rsi]
    mov byte [rdi], r8b

    add rdi, 1
    add rsi, 1
    add bl, 1

    jmp start_memcpy

    end_memcpy:
    mov rax, rcx
    leave
    ret
