section .text
    global strcspn

strcspn:
    push rbp
    mov rbp, rsp
    mov r9, 0
    mov r10, 0

    jmp start_strcspn

    increment_strcspn:
    add r9, 1

    start_strcspn:

    cmp byte [rdi], 0
    je end_strcspn

    mov r8b, byte [rsi + r9]
    cmp byte [rdi], r8b
    je end_strcspn

    cmp r8b, 0
    jne increment_strcspn

    mov r9, 0

    add rdi, 1
    add r10, 1
    jmp start_strcspn

    end_strcspn:
    mov rax, r10
    leave
    ret
