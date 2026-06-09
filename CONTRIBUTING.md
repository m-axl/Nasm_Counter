# Contribuindo — Nasm_Counter

Obrigado por contribuir! Siga estas etapas ao enviar PRs ou issues.

1. Fork e branch
   - Use branches temáticas: `feat/...`, `fix/...`, `doc/...`.

2. Ambiente de desenvolvimento
   - Instale `nasm` e ferramentas de build: `sudo apt-get install nasm build-essential`.

3. Build & testes locais
   ```bash
   make -f build/makefile
   tests/run_tests.sh
   ```

4. PR checklist
   - Código compila e os testes passam.
   - Atualize `README.md` ou `docs/` se necessário.
   - Descreva a mudança e motivo no corpo do PR.

5. Issues
   - Forneça passos para reproduzir e saída esperada.

6. Estilo
   - Prefira clareza e comentários explicativos em Assembly.
