# Developer Setup

Passos rápidos para configurar um ambiente de desenvolvimento local.

1. Instale dependências (Ubuntu/Debian):

```bash
sudo apt-get update
sudo apt-get install -y nasm build-essential pkg-config gdb
```

2. Build do projeto:

```bash
make -f build/makefile
```

3. Executar testes:

```bash
chmod +x tests/run_tests.sh
./tests/run_tests.sh
```

4. Ambiente com Docker (opcional):

Crie um `Dockerfile` simples com `nasm` e `build-essential` para builds reproduzíveis.
