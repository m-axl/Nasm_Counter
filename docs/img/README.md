# Diagrams (docs/img)

Contém diagramas do projeto em formato Mermaid (`*.mmd`). Para renderizar em SVG/PNG use `@mermaid-js/mermaid-cli` (`mmdc`) ou plugins do VSCode.

Render example (requires Node.js + mermaid-cli):

```bash
npm install -g @mermaid-js/mermaid-cli
mmdc -i docs/img/flow_overview.mmd -o docs/img/flow_overview.svg
mmdc -i docs/img/flow_build_release.mmd -o docs/img/flow_build_release.svg
```

Arquivos:

- `flow_overview.mmd` — visão geral do fluxo de dados/controle
- `flow_build_release.mmd` — pipeline de build e release
- `flow_tests.mmd` — estratégia de testes
- `flow_lib_api.mmd` — contratos da API pública da biblioteca
