section .text
    global strstr

strstr:
    push rbp
    mov rbp, rsp
    mov r9, 0

    jmp start_strstr

    increment:
    add r9, 1

    start_strstr:

    cmp byte [rsi + r9], 0
    je end_strstr

    cmp byte [rdi + r9], 0
    je was_not_found

    mov r8b, byte [rsi + r9]
    cmp byte [rdi + r9], r8b
    je increment

    add rdi, 1
    mov r9, 0
    jmp start_strstr

    end_strstr:
    mov rax, rdi
    leave
    ret

    was_not_found:
    mov rax, 0
    leave
    ret
