# Debugging

Dicas para depuração de código Assembly do projeto.

1. Compile com símbolos (adicionar flag de debug no Makefile se necessário).

2. Usar `gdb` para inspecionar `_start` e registradores:

```bash
gdb -q ./contador_bshasm
(gdb) start
(gdb) disassemble _start
(gdb) layout asm
```

3. Para ver syscalls e arguments, use `strace -e trace=read,write ./contador_bshasm`.

4. Para dumps de memória, use `x/32bx $rsp` dentro do gdb.
