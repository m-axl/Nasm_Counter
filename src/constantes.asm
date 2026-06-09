section .data
    global msg_input
    global len_input
    global msg_output
    global len_output

msg_input: db 'Digite um número: ', 10
len_input: dq $ - msg_input

msg_output: db 'O resultado + 1 é: '
len_output: dq $ - msg_output
; ========================================================================
; msg_error db 'Entrada inválida. Por favor, digite um número válido.', 10
; len_error equ $ - msg_error 
; possivelmente podemos usar essa mensagem de erro para lidar com entradas inválidas
;  mas por enquanto vamos focar no fluxo principal do programa.
; ========================================================================
section .bss
    global buffer
    global result
    buffer resb 32
    result resb 32
; =========================================================================         
; buffer para armazenar a entrada do usuário (tamanho máximo de 32 bytes) 
; seguindo a mesma lógica do comentário 
; no main.asm sobre o tamanho máximo da entrada para evitar overflow.
; =========================================================================
