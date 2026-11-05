---
name: sr-dev-flow-sf
description: Use quando a demanda ou o repositório for Salesforce (sfdx-project.json, force-app, org, sandbox, Apex, trigger, Batch, LWC, Flow, Einstein Bot, Agentforce, Service, Sales ou Marketing Cloud, metadata, package.xml, sf CLI, validate, deploy) e o usuário pegar, refinar, corrigir, implementar, revisar ou entregar uma tarefa de cliente da SR.
---

# sr-dev-flow-sf (fork Salesforce, v1.2)

Esta skill estende a `sr-dev-flow` (base). Siga o fluxo da base inteiro: regra zero, fronteira Veleiro × cliente, "nunca deduzir", etapa 0 de reconhecimento e onboarding, classes, etapas 1 a 6, horas aproximadas e KPI. Se a base não estiver carregada, carregue-a primeiro. Abaixo estão só as especializações para Salesforce. Quando uma regra daqui for mais restritiva que a da base, vale a daqui; nada aqui afrouxa a base.

## Quando se aplica

Repositório com `sfdx-project.json` ou `force-app/`, ou demanda em projeto Salesforce na Veleiro.

## Etapa 0: sinais Salesforce

Além da etapa 0 da base, confira:

- **máquina:** `sf` instalado e org padrão autenticada; a org padrão é sandbox (nunca trabalhe com produção como padrão; se for, avise e pare);
- **projeto:** `sfdx-project.json` (pacotes, API version); na ficha do projeto, os nomes das sandboxes de dev e QA/UAT e o usuário de integração do pipeline;
- **contexto:** threads anteriores do Salesforce Coding Agent ou do Salesforce Expert no projeto sobre o mesmo tema (`list_agent_threads`), para reaproveitar análise.

## Nunca deduzir: a org entra na ordem de busca

No passo 5 da ordem de busca da base, o ambiente do cliente é a org de **sandbox**:

- metadata do repositório primeiro (`force-app/`);
- se faltar, `sf project retrieve` ou leitura de metadata na sandbox autenticada;
- comportamento de plataforma (limites, edições, licenças): agente Salesforce Expert da Veleiro ou a documentação oficial indexada na Veleiro (`search_product_docs`). Nunca de memória.

Se a org, o repositório e a documentação não responderem, pergunte.

## Classes: critério Salesforce

- **Trivial:** até 2h, sem Apex, trigger, Flow novo ou alteração de Flow com lógica, sem carga ou alteração de dados. Ex.: layout, template de e-mail, label, list view, permissão pontual.
- **Crítica:** integração (callout, Platform Event, MuleSoft), Batch ou carga de dados, mudança em objeto com automações de atendimento ou pesquisa, deploy em produção fora do horário.
- **Padrão:** o resto.

A classe continua vivendo só na Veleiro.

## Etapa 3: riscos da org que sempre entram no plano

Para cada objeto afetado, levante (na sandbox ou no repositório) e liste no plano:

- Flows ativos e Process Builders que disparam no objeto;
- triggers e o trigger framework do projeto;
- automações de comunicação ao cliente final: e-mail, SMS, WhatsApp, pesquisa CSAT/NPS (ex.: fechar Case dispara pesquisa?);
- regras de sharing, validações e duplicidade que a mudança pode bater.

Risco encontrado vira item do plano ou pergunta. Risco não verificado não é citado como fato.

## Etapa 4: implementação Salesforce

- **Rota A, Coding Agent da Veleiro:** `create_agent_thread` no projeto com título `<CHAVE> – <resumo>`; entregue a URL e um prompt pronto com brief, critério, plano, padrões do cliente (prefixos, trigger framework, cobertura mínima) e pedido de package.xml. Peça ao agente que confirme no primeiro turno o que consegue editar (metadata XML, Apex, LWC); ele não edita Aura.
- **Rota B, local:** Claude Code + sf CLI, seguindo os padrões do repositório.
- **Apex:** a classe de teste que falha vem antes da classe. Batch com `Database.Stateful` quando precisar contar por grupo; dados em massa sempre com modo dry-run que só relata.
- **Declarativo (Flow, layout, permission set):** sem teste Apex obrigatório, mas com o roteiro de teste manual no PR.
- **Checklist Salesforce**, além do checklist base:
  - testes Apex passando e cobertura ≥ 75% nas classes alteradas (ou o mínimo do projeto, se maior);
  - sem SOQL ou DML dentro de loop; bulk-safe para 200 registros;
  - `with sharing` ou justificativa; FLS e CRUD respeitados (`WITH USER_MODE` ou `Security.stripInaccessible` quando couber);
  - package.xml só com o necessário;
  - Flows e automações levantados na etapa 3 conferidos.

## Etapa 5: deploy Salesforce

- Validação: `sf project deploy validate` com `RunLocalTests` (ou `RunSpecifiedTests` com a lista do projeto) contra a org de destino.
- Produção: pelo pipeline do projeto, ou quick deploy do validate aprovado, sempre com OK explícito no turno.
- **P0.1 Salesforce:** nunca altere produção pela UI, por change set ou por `sf project deploy` fora do pipeline como caminho normal. Se o cliente exigir uma mudança direto na UI, ela precisa de tarefa antes e de retrieve + PR em até 24h.
- Exceções aprovadas do projeto (ex.: macros de e-mail montadas direto em produção) só valem se estiverem registradas na ficha do projeto na Veleiro, com motivo e validade. Sem registro, siga o P0.1 e pergunte.

## Dados (P14 Salesforce)

- `sf data query`, `sf data export` e qualquer leitura de registros: só em sandbox. Nunca contra produção.
- Antes de rodar algo em produção que altere registros, salve IDs e valores originais para rollback e compare a contagem do dry-run com a referência do cliente.
