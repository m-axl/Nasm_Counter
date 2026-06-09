# SDLC do projeto Nasm_Counter

Este repositório segue um ciclo de vida de desenvolvimento simples e padronizado para projetos pequenos em Assembly.

Fases principais:

- Requisitos: objetivo e restrições (ver README).
- Design/Arquitetura: `docs/architecture_full.md`.
- Implementação: código em `src/` separado em biblioteca (`lib.asm`) e binário (`main.asm`).
- Testes: scripts em `tests/` que constroem e validam saídas esperadas.
- Integração/CI: workflow em `.github/workflows/ci.yml` para build + testes.
- Deploy/Release: criar release GitHub com artefatos binários (`contador_bshasm`).
- Manutenção: usar issues/PRs com a checklist de `docs/CONTRIBUTING.md`.

Recomendações:

- Pequenas PRs com um objetivo claro.
- Inclua testes automáticos para regressões.
- Documente mudanças significativas em `docs/`.
# SDLC do projeto Nasm_Counter

Este repositório segue um ciclo de vida de desenvolvimento simples e padronizado para projetos pequenos em Assembly.

Fases principais:

- Requisitos: documento leve descrevendo objetivo e restrições (ver README).
- Design/Arquitetura: [docs/architecture.md](docs/architecture.md).
- Implementação: código em `src/` separado em biblioteca (`lib.asm`) e binário (`main.asm`).
- Testes: scripts em `tests/` que constroem e validam saídas esperadas.
- Integração/CI: workflow em `.github/workflows/ci.yml` para build + testes.
- Deploy/Release: criar release GitHub com artefatos binários (`contador_bshasm`).
- Manutenção: usar issues/PRs com a checklist de `CONTRIBUTING.md`.

Recomendações:

- Pequenas PRs com um objetivo claro.
- Inclua testes automáticos para regressões.
- Documente mudanças significativas na `docs/`.
