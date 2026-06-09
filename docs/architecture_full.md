# Arquitetura Completa — Nasm_Counter

Objetivo
-- Fornecer uma arquitetura modular e escalável para o projeto `Nasm_Counter`, permitindo evolução para múltiplas plataformas, integração com outras linguagens (C/Python), testes automatizados e pipelines de CI/CD.

Princípios de design
- Modularidade: separar lógica reutilizável (biblioteca) do binário de exemplo.
- Simplicidade: interfaces pequenas e bem documentadas para facilitar testes.
- Portabilidade: projetar com camadas para suportar outras ABIs/arquiteturas.
- Testabilidade: cada componente deve ser testável isoladamente.
- Observabilidade: facilitar logs e saídas para debugging durante desenvolvimento.

Estrutura de diretórios proposta

```
/
├─ .github/workflows/    # CI (build + testes + releases)
├─ build/                # makefile específicos
├─ include/              # headers/incs (syscalls.inc)
├─ src/
│  ├─ main.asm           # entrypoint/example binary
│  ├─ lib.asm            # biblioteca pública (print/atoi/itoa/read_input)
│  ├─ constants.asm      # strings, buffers, dados globais
│  └─ arch/              # arquitetura-specific code (x86_64, x86, arm)
│     ├─ x86_64/
│     └─ arm64/
├─ tests/                # scripts de integração + fixtures
├─ docs/                 # documentação (esta pasta)
├─ examples/             # exemplos de uso e integrações (C shim)
├─ tools/                # utilitários de desenvolvimento (benchmarks, formatters)
└─ README.md
```

Componentes e responsabilidades

- `src/lib.asm` — API pública em Assembly:
  - Símbolos exportados (global): `print(ptr, len)`, `read_input(buf, maxlen)`, `atoi(ptr) -> rax`, `itoa(dest, value) -> len`.
  - Regras: documentar clobbered registers e pré-condições.

- `src/main.asm` — exemplo de uso e fluxo de aplicação; mínimo de lógica.

- `src/arch/*` — código específico por arquitetura: syscalls, convenções, e otimizações.

- `include/` — arquivos `%include` reutilizáveis: `syscalls.inc`, `macros.inc` (macros utilitárias), `abi.inc`.

- `tests/` — organização:
  - `unit/` — pequenos snippets que montam `lib.asm` e testam funções isoladas via harnesss.
  - `integration/` — scripts que constroem e executam binários (ex.: `run_tests.sh`).
  - `fixtures/` — entradas/saídas esperadas.

Interface pública (contrato)

- `print(ptr, len)`:
  - Entradas: `rsi=ptr`, `rdx=len`.
  - Retorno: `rax=bytes_written` ou `-1` em erro.
  - Preserva: `rbx`, `rbp`, `r12-r15`.

- `read_input(buf, maxlen)`:
  - Entradas: `rsi=buf`, `rdx=maxlen`.
  - Retorno: `rax=bytes_read`.

- `atoi(ptr)`:
  - Entrada: `rsi=ptr`.
  - Retorno: `rax=value`.

- `itoa(dest, value)`:
  - Entradas: `rdi=dest`, `rax=value`.
  - Retorno: `rbx=len` (ou usar `rax` para consistência com ABI).

Build e toolchain

- Manter `build/makefile` para build local simples.
- Adicionar um `Makefile` na raiz com targets: `all`, `build`, `run`, `test`, `clean`, `fmt`.
- Suporte cross-build ( variável `ARCH` ou `TARGET` ) que escolhe `src/arch/$(ARCH)`.

Testes e Quality Gate

- Unit tests: pequenos harnesses em Assembly ou pequenos executáveis C que chamem a biblioteca.
- Integration tests: `tests/run_tests.sh` (já criado).
- CI: GitHub Actions (build + run tests + optional fuzzing).

Extensibilidade e integração com C/Python

- C shim (exemplo em `examples/c_shim/`): compilar `lib.o` em formato objeto e linkar com um pequeno `main.c` para testar.
- Python: usar `ctypes`/`cffi` carregando biblioteca compartilhada (requer criar um `.so` com a convenção certa).

Versionamento e Releases

- Adotar SemVer (MAJOR.MINOR.PATCH).
- Releases via GitHub Actions: build artifacts (binários) e changelog gerado automaticamente a partir de PRs/commits com `Conventional Commits`.

Segurança e robustez

- Buffer sizes: garantir validação de limites em `read_input` e `atoi`.
- Input validation: mensagens de erro e códigos de saída consistentes.
- Avoid UB: preservar registradores esperados e documentar side-effects.

Observabilidade e debug

- Adicionar uma opção `DEBUG` no Makefile para compilar com símbolos e prints adicionais (via `print`).
- Ferramenta de execução passo-a-passo: `gdb` scripts e instruções em `docs/debug.md`.

Documentação e onboarding

- `docs/architecture_full.md` (este arquivo)
- `docs/developer_setup.md` — passos para configurar ambiente (nasm, ld, gdb).
- `docs/release_process.md` — como criar uma release e atualizar changelog.

Roadmap recomendado (próximos 6–12 meses)

1. Consolidar API pública e testes unitários.
2. Criar C shim e exemplos em `examples/`.
3. Adicionar suporte a outra arquitetura (ARM64) no diretório `src/arch/arm64`.
4. Automatizar releases (artifacts + checksums).
5. Adicionar benchmarks e perf regressions.

Diagrama de alto nível

```mermaid
flowchart LR
  A[stdin] --> B[main.asm]
  B --> C[lib.asm]
  C --> D[syscall(write)]
  C --> E[syscall(read)]
  subgraph Arch-specific
    F[src/arch/x86_64]
    G[src/arch/arm64]
  end
  B --> F
```

Checklist para alterações compatíveis

- Atualizar documentação (`docs/`) quando mudar interface pública.
- Adicionar um teste que reproduza o caso de uso novo.
- Manter backward compatibility na API por padrão; se mudança breaking, aumentar MAJOR.

Conclusão

Esta arquitetura equilibra simplicidade e escalabilidade, permitindo que o projeto cresça para suporte multi-arquitetura, integração com linguagens de alto nível, e pipelines de CI/CD robustos.
