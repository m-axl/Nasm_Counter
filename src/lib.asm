%include "include/syscalls.inc"

section .text
    global print
    global read_input
    global atoi
    global itoa

; print: rsi = ptr, rdx = len
print:
    mov rax, sys_write
    mov rdi, stdout
    syscall
    ret

; read_input: rsi = buffer, rdx = maxlen
read_input:
    mov rax, sys_read
    mov rdi, stdin
    syscall
    ret

; atoi: rsi = ptr -> returns rax = value
atoi:
    push rbp
    mov rbp, rsp
    push rbx
    mov rbx, rsi        ; current pointer
    xor rax, rax        ; result = 0
atoi_loop:
    mov bl, [rbx]
    cmp bl, 0
    je atoi_done
    cmp bl, 10
    je atoi_done
    cmp bl, '0'
    jb atoi_skip
    cmp bl, '9'
    ja atoi_skip
    imul rax, rax, 10
    movzx rdx, bl
    sub rdx, '0'
    add rax, rdx
atoi_skip:
    inc rbx
    jmp atoi_loop
atoi_done:
    pop rbx
    pop rbp
    ret

; itoa: rdi = dest buffer, rax = value -> returns rbx = length
itoa:
    xor rbx, rbx        ; length counter
    mov r10, rax        ; copy value
    cmp r10, 0
    jne .conv
    mov byte [rdi], '0'
    mov rbx, 1
    ret
.conv:
    xor rcx, rcx        ; index
.loop:
    xor rdx, rdx
    mov rax, r10
    mov rsi, 10
    div rsi             ; rax = quotient, rdx = remainder
    add dl, '0'
    mov [rdi + rcx], dl
    inc rcx
    mov r10, rax
    cmp r10, 0
    jne .loop
.    mov rbx, rcx        ; length = rcx
    xor rsi, rsi        ; i = 0
.rev_loop:
    cmp rsi, rbx
    jge .rev_done
    mov al, [rdi + rsi]
    mov r11, rdi
    add r11, rbx
    dec r11
    sub r11, rsi        ; r11 = rdi + rbx - 1 - rsi
    mov dl, [r11]
    mov [rdi + rsi], dl
    mov [r11], al
    inc rsi
    jmp .rev_loop
.rev_done:
    ret
