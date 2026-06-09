# API Pública (Assembly)

Contratos das rotinas exportadas pela biblioteca `src/lib.asm`.

- `print(ptr, len)`
  - Inputs: `rsi=ptr`, `rdx=len`
  - Returns: `rax=bytes_written`
  - Clobbers: `rax`, `rcx`, `rdx` (documentar preservados)

- `read_input(buf, maxlen)`
  - Inputs: `rsi=buf`, `rdx=maxlen`
  - Returns: `rax=bytes_read`

- `atoi(ptr)`
  - Input: `rsi=ptr`
  - Returns: `rax=value`

- `itoa(dest, value)`
  - Inputs: `rdi=dest`, `rax=value`
  - Returns: `rbx=len` (length written)

Notas:
- Todas as rotinas usam convenção System V AMD64.
- Documente qualquer registro preservado ou usado pela função em comentários sobre a função.
