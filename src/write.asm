section .text
    global write

write:
    push rbp
    mov rbp, rsp

    mov rax, 1
    syscall

    leave
    ret
