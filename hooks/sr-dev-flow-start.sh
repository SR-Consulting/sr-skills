#!/bin/bash
# Hook de SessionStart do Claude Code, no modelo do Superpowers (using-superpowers):
# injeta no início da sessão a regra de carregar a skill SR antes de responder.
# Instalação: copie para ~/.claude/hooks/ e registre em ~/.claude/settings.json (ver settings-snippet.json).
dir="${CLAUDE_PROJECT_DIR:-$PWD}"
git -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0
branch=$(git -C "$dir" branch --show-current 2>/dev/null)
if [ -f "$dir/sfdx-project.json" ] || [ -d "$dir/force-app" ]; then
  skill="sr-dev-flow-sf"; tipo="Salesforce"
else
  skill="sr-dev-flow"; tipo="de cliente"
fi
cat <<EOF
Este é um repositório ${tipo} da SR Consulting (branch: ${branch:-sem branch}).
Regra da sessão: antes de responder a qualquer pedido sobre tarefa, demanda, bug, melhoria, código, PR ou deploy neste repositório, carregue a skill ${skill} com a ferramenta Skill e siga-a. Se houver qualquer chance de ela se aplicar, carregue-a; não responda de memória.
A Veleiro é a fonte da verdade: sem tarefa na Veleiro, nada vai para produção.
EOF
exit 0
