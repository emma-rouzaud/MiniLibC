section .text
    global read

read:
    push rbp
    mov rbp, rsp

    mov rax, 0
    syscall

    leave
    ret
