section .text
    global memset

memset:
    push rbp
    mov rbp, rsp
    mov bl, 0
    mov rcx, rdi

    start_memset:

    cmp bl, dl
    je end_memset
    mov byte [rdi], sil

    add rdi, 1
    add bl, 1

    jmp start_memset

    end_memset:
    mov rax, rcx
    leave
    ret
