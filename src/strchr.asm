section .text
    global strchr

strchr:
    push rbp
    mov rbp, rsp
    start_strchr:

    cmp byte [rdi], sil
    je end_strchr
    cmp byte [rdi], 0
    je not_found

    add rdi, 1
    jmp start_strchr

    end_strchr:
    mov rax, rdi
    leave
    ret

    not_found:
    mov rax, 0
    leave
    ret
