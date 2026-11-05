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

## Comece aqui

Peça pro seu agente ativar a skill:

```text
Instale e ative as skills de https://github.com/SR-Consulting/sr-skills neste projeto.
```

Pronto. O agente lê este README, instala a skill certa e já começa a usar.

## Instalação manual

Para o agente (ou para quem preferir fazer na mão):

- **Repositório de cliente (time todo):** copie as pastas de `skills/` para `.claude/skills/` do repositório e faça commit.
- **Pessoal (todos os seus projetos):** copie as pastas de `skills/` para `~/.claude/skills/`.
- **claude.ai / Cowork:** faça upload de cada pasta como skill nas configurações da conta.
- **Hook opcional:** copie `hooks/sr-dev-flow-start.sh` para `~/.claude/hooks/` e acrescente `hooks/settings-snippet.json` ao `~/.claude/settings.json`. Ao abrir uma sessão, ele carrega `sr-dev-flow-sf` em repositório Salesforce e `sr-dev-flow` nos demais. No Windows, roda pelo Git Bash.

## Como contribuir

Mudanças no núcleo (P0 a P14) entram por PR e precisam de aprovação do dono do programa de IA. Forks por plataforma podem endurecer regras da base, nunca afrouxar.
