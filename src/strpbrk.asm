section .text
    global strpbrk

strpbrk:
    push rbp
    mov rbp, rsp
    mov r9, 0

    jmp start_strpbrk

    increment_strpbrk:
    add r9, 1

    start_strpbrk:

    cmp byte [rdi], 0
    je not_in_str

    mov r8b, byte [rsi + r9]
    cmp byte [rdi], r8b
    je end_strpbrk

    cmp r8b, 0
    jne increment_strpbrk

    mov r9, 0

    add rdi, 1
    jmp start_strpbrk

    end_strpbrk:
    mov rax, rdi
    leave
    ret

    not_in_str:
    mov rax, 0
    leave
    ret
