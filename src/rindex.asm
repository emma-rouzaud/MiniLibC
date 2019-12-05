section .text
    global rindex

get_len:
    push rbp
    mov rbp, rsp

    mov rax, 0
    start_strlen:
    cmp byte [rdi], 0
    je end_strlen
    add rax, 1
    add rdi, 1
    jmp start_strlen

    end_strlen:
    leave
    ret


rindex:
    push rbp
    mov rbp, rsp
    mov rax, 0

    call get_len

    start_rindex:

    cmp byte [rdi], sil
    je end_rindex
    cmp al, 0
    je error_found

    sub rdi, 1
    sub al, 1
    jmp start_rindex

    end_rindex:
    mov rax, rdi
    leave
    ret

    error_found:
    mov rax, 0
    leave
    ret
