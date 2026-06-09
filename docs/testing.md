# Testes

Estrutura de testes existente:

- `tests/run_tests.sh` — teste de integração que constrói e valida a saída.

Recomendações para ampliar a suíte:

- `tests/unit/` — small harnesses that exercise `atoi`/`itoa` directly.
- `tests/integration/` — multiple scenario scripts and fixtures.
- CI: garantir que `tests/run_tests.sh` rode em `ubuntu-latest`.

Adicionar novos testes:

1. Criar fixture em `tests/fixtures/input1.txt` e `tests/fixtures/output1.txt`.
2. Adicionar script que executa `./contador_bshasm < fixture` e compara com expected output.
