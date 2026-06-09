# CLI — Interface de Linha de Comando

O projeto inclui um script CLI para facilitar build e execução: `bin/cli.sh`.

Instalação

Torne executável (se necessário):

```bash
chmod +x bin/cli.sh
```

Comandos

- `build`: compila o projeto usando `build/makefile`.
- `run`: executa o binário. Opções:
  - `-i, --input "TEXT"`: passa texto via stdin.
  - `-f, --file FILE`: passa conteúdo de arquivo como stdin.
- `clean`: remove artefatos de build.

Exemplos

```bash
bin/cli.sh build
bin/cli.sh run -i "3"
bin/cli.sh run -f tests/fixtures/input1.txt
```
