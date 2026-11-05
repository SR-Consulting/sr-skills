# sr-skills

Skills de IA da SR Consulting para o fluxo de desenvolvimento com a Veleiro como fonte da verdade.

## Skills

| Skill | Pasta | Quando ativa |
| --- | --- | --- |
| `sr-dev-flow` | `skills/sr-dev-flow/` | Base para qualquer demanda de cliente da SR, em qualquer plataforma |
| `sr-dev-flow-sf` | `skills/sr-dev-flow-sf/` | Fork Salesforce: carrega a base e acrescenta org, Apex, Flows, sf CLI e agentes Salesforce da Veleiro |

Regras centrais:

- **P0:** sem tarefa na Veleiro, nada vai para produção.
- Estimativa, classe da demanda, horas e KPI vivem só na Veleiro; nunca no board do cliente sem pedido explícito.
- Nunca deduzir: contexto do cliente primeiro, depois perguntas.
- Onboarding na etapa 0: reconhece máquina, projeto na Veleiro, repositório e onde vivem as tarefas do cliente.

## Instalação

**Num repositório de cliente (recomendado para o time):** copie as pastas de `skills/` para `.claude/skills/` do repositório e faça commit. Todo dev que clonar recebe as skills no Claude Code.

**Pessoal (todos os seus projetos):** copie as pastas de `skills/` para `~/.claude/skills/`.

**claude.ai / Cowork:** faça upload de cada pasta como skill nas configurações da conta.

## Hook opcional de SessionStart

`hooks/sr-dev-flow-start.sh` segue o modelo do Superpowers: ao abrir uma sessão num repositório, injeta a regra de carregar a skill certa (`sr-dev-flow-sf` em repositório Salesforce, `sr-dev-flow` nos demais) antes de responder.

1. Copie o script para `~/.claude/hooks/`.
2. Acrescente o conteúdo de `hooks/settings-snippet.json` ao seu `~/.claude/settings.json`.

No Windows, o Claude Code roda o hook pelo Git Bash.

## Como contribuir

Mudanças no núcleo (P0 a P14) entram por PR e precisam de aprovação do dono do programa de IA. Forks por plataforma podem endurecer regras da base, nunca afrouxar.
