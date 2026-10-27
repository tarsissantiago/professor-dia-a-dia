# Currículo — LabStore, do zero ao profissional

O projeto final é a **LabStore**, uma API de loja (produtos, categorias, pedidos, avaliações). O código cresce junto
com o aluno: começa num arquivo só, "feio de propósito", e é reorganizado quando a dor aparece (Módulo 4).

Cada aula tem um **ID** (`MXX-AYY`), uma **entrega** (o que passa a existir no repositório) e um **checkpoint**
(como o professor confirma, sozinho, que a entrega funciona). Use o checkpoint literalmente no Caso C do `SKILL.md`.

Pré-requisitos instalados ao longo do Módulo 0: .NET SDK (LTS), Git, conta no GitHub, um editor com agente de IA
(Antigravity, Claude Code, Codex, Cursor ou similar) e, a partir do Módulo 3, Docker.

## Modo de cada módulo: da mão para o agente

| Módulos | Modo | Como funciona |
| --- | --- | --- |
| 0 a 2 | `mao` | O aluno digita tudo. O agente só é usado para tirar dúvida e explicar código (a partir da `M00-A05`). |
| 3 a 5 | `misto` | A primeira vez de cada conceito é na mão (parte ✍️); o resto da entrega é pedido ao agente (parte 🤖). |
| 6 a 13 | `agente` | O agente escreve; o aluno especifica no pedido, confere, revisa e responde pelo código. |

Uma aula pode sobrescrever o modo do módulo quando a tabela indicar (coluna **Modo**, quando presente).
Em aulas `misto`, a coluna **Entrega** descreve a entrega completa; a aula decide qual parte é ✍️: sempre a menor
parte que contém o conceito novo (ex.: o primeiro endpoint com `DbContext` na mão; os outros três pelo agente).

---

## Módulo 0 — Ambiente e primeiro programa

**Modo:** `mao`

| ID | Aula | Entrega | Checkpoint |
| --- | --- | --- | --- |
| M00-A01 | O que é programar e o que vamos construir | Git instalado e configurado (`user.name`, `user.email`); **primeiro passo:** conferir a pasta (`pwd`), `git init -b main` e commit do `curso/` que o professor acabou de criar; depois `.gitignore` do .NET (`dotnet new gitignore`) e novo commit | `git log` mostra o commit inicial; `.gitignore` existe |
| M00-A02 | GitHub: seu código na nuvem | Conta no GitHub; repositório remoto vazio criado no site; `git remote add origin` e `git push -u origin main` | `git remote -v` mostra `origin`; `git status` diz que está em dia com `origin/main` |
| M00-A03 | Instalando o .NET e o primeiro "Olá" | `src/LabStore.Console` criado com `dotnet new console` imprimindo uma mensagem; commit por passo e push no fim | `dotnet run --project src/LabStore.Console` imprime a mensagem; commits da aula no `origin` |
| M00-A04 | Terminal e Git sem medo | Navegar pastas no terminal; `git status`, `git diff`, `git log --oneline`; desfazer uma mudança com `git restore` | Aluno escreve `curso/anotacoes-git.md` com os comandos e para que serve cada um; commit e push feitos |
| M00-A05 | Programando com um agente de IA | O que um agente faz e não faz; `AGENTS.md` criado a partir do modelo e personalizado pelo aluno; primeiro pedido em `curso/prompts/M00-A05.md`: pedir ao agente para explicar o `Program.cs` e acrescentar uma segunda mensagem; aluno roda, lê o diff e desfaz com `git restore` para ver a rede de segurança funcionando; depois refaz e faz o commit | `AGENTS.md` na raiz com as seções preenchidas; pedido e respostas de revisão no arquivo; commit `M00-A05` no `origin` |

## Módulo 1 — C# essencial, usando a loja como exemplo

**Modo:** `mao`

| ID | Aula | Entrega | Checkpoint |
| --- | --- | --- | --- |
| M01-A01 | Variáveis e tipos | Programa que calcula o total de 3 itens com `decimal`, `int`, `string` | Saída do total correta para os valores da aula |
| M01-A02 | Decisões e repetições | `if`, `switch`, `for`/`foreach` aplicando desconto por quantidade | Saída correta para os 3 cenários da aula |
| M01-A03 | Classes e objetos | Classe `Produto` (Id, Nome, Preco, Estoque) com um método `TemEstoque(qtd)` | Compila; o programa cria produtos e imprime o resultado do método |
| M01-A04 | Listas e LINQ | Lista de produtos em memória; filtrar, ordenar e somar com LINQ | Saída mostra filtro por preço e total do estoque |
| M01-A05 | Métodos, erros e exceções | Método de baixa de estoque que lança exceção se não houver estoque; `try/catch` | Saída mostra a mensagem amigável do `catch` |
| M01-A06 | Introdução a `async`/`await` | Método assíncrono simulando uma consulta lenta com `Task.Delay` | Compila e imprime antes/depois na ordem esperada |

## Módulo 2 — A web e a primeira API

**Modo:** `mao`

| ID | Aula | Entrega | Checkpoint |
| --- | --- | --- | --- |
| M02-A01 | Como a web funciona: HTTP, URL, JSON, verbos | Arquivo `curso/anotacoes-http.md` escrito pelo aluno com os verbos e status codes com suas palavras | Arquivo existe e cita GET, POST, PUT, DELETE, 200, 201, 400, 404 |
| M02-A02 | Primeira Minimal API | `src/LabStore.Api` com `GET /` e `GET /produtos` (lista em memória) | `dotnet run` e `GET /produtos` retorna JSON |
| M02-A03 | Swagger e o arquivo `.http` | Swagger habilitado; `LabStore.Api.http` com as chamadas | `/swagger` abre; arquivo `.http` tem os requests |
| M02-A04 | CRUD em memória | `GET /produtos/{id}`, `POST`, `PUT`, `DELETE` com status codes certos | POST retorna 201; GET de id inexistente retorna 404 |
| M02-A05 | Validação básica | POST/PUT rejeitam nome vazio e preço ≤ 0 com 400 e mensagem clara | Request inválido retorna 400 com a mensagem |

## Módulo 3 — Banco de dados com Entity Framework Core

**Modo:** `misto`

| ID | Aula | Entrega | Checkpoint |
| --- | --- | --- | --- |
| M03-A01 | O que é banco de dados e SQL | Docker instalado; `docker-compose.yml` com PostgreSQL; aluno roda um `SELECT` no terminal | `docker compose ps` mostra o Postgres rodando |
| M03-A02 | EF Core e o `DbContext` | `LabStoreDbContext` com `DbSet<Produto>`; connection string em `appsettings.Development.json` | `dotnet build` passa; pacote Npgsql do EF instalado |
| M03-A03 | Migrations | Primeira migration aplicada | `dotnet ef migrations list` mostra a migration; tabela existe no banco |
| M03-A04 | CRUD no banco | Endpoints do Módulo 2 trocam a lista em memória pelo `DbContext` | POST grava e o GET seguinte lê do banco (dados sobrevivem a reiniciar a API) |
| M03-A05 | Relacionamentos | Entidade `Categoria` (1:N com Produto), migration nova, `GET /categorias/{id}/produtos` | Endpoint retorna produtos da categoria |
| M03-A06 | Seed e consultas melhores | Seed de dados com Bogus; paginação em `GET /produtos?pagina=&tamanho=`; `AsNoTracking` nas leituras | GET paginado retorna o tamanho pedido |

## Módulo 4 — Organizando o código (quando o arquivo único começa a doer)

**Modo:** `misto`

| ID | Aula | Entrega | Checkpoint |
| --- | --- | --- | --- |
| M04-A01 | Por que organizar: sentindo a dor | Aluno lista em `curso/anotacoes-organizacao.md` 3 problemas do `Program.cs` atual | Arquivo existe com 3 itens |
| M04-A02 | Injeção de dependência | Interface `IProdutoRepository` + implementação registrada no DI | Endpoints usam a interface; build passa |
| M04-A03 | Camadas | Solução `LabStore.sln` com `Domain`, `Application`, `Infrastructure`, `Api` e referências corretas | `dotnet build LabStore.sln` passa; Domain não referencia Infrastructure |
| M04-A04 | Controllers ou endpoints agrupados | Rotas organizadas por recurso (controllers ou `MapGroup`) | Todas as rotas antigas continuam respondendo |
| M04-A05 | Validação com FluentValidation e erros padronizados | Validators + `ProblemDetails` para erros | Request inválido retorna `application/problem+json` |
| M04-A06 | Configuração e segredos | Options pattern para uma configuração; User Secrets para a connection string | Nenhuma senha no git (`git grep` não encontra a senha) |

## Módulo 5 — Testes de unidade

**Modo:** `misto`

| ID | Aula | Entrega | Checkpoint |
| --- | --- | --- | --- |
| M05-A01 | Por que testar e o primeiro teste | `tests/LabStore.UnitTests` (xUnit) com um teste da classe `Produto` | `dotnet test` passa |
| M05-A02 | Arrange, Act, Assert e `[Theory]` | Testes de regras de estoque e desconto com vários casos | `dotnet test` com ≥ 5 testes passando |
| M05-A03 | Mocks | Teste de um serviço/handler com o repositório mockado (NSubstitute) | `dotnet test` passa; mock verificado com `Received()` |
| M05-A04 | Testes de validação | Testes dos validators | `dotnet test` passa |

## Módulo 6 — MediatR e CQRS

**Modo:** `agente`

| ID | Aula | Entrega | Checkpoint |
| --- | --- | --- | --- |
| M06-A01 | O problema dos controllers gordos | `CreateProdutoCommand` + handler; endpoint só despacha | POST continua funcionando via handler |
| M06-A02 | Queries | `GetProdutoByIdQuery`, `ListProdutosQuery` | GETs funcionando via handlers |
| M06-A03 | Pipeline behaviors | `ValidationBehavior` e `LoggingBehavior` | Request inválido barrado pelo behavior; log mostra tempo do handler |
| M06-A04 | Pedidos | Entidades `Pedido` e `ItemPedido`; `CreatePedidoCommand` que baixa estoque em transação | Pedido criado e estoque reduzido no banco; teste de unidade do handler passando |

## Módulo 7 — Dapper e relatórios

**Modo:** `agente`

| ID | Aula | Entrega | Checkpoint |
| --- | --- | --- | --- |
| M07-A01 | SQL na mão com Dapper | `GET /relatorios/vendas-por-categoria` com Dapper e parâmetros | Retorna totais por categoria |
| M07-A02 | Multi-mapping e `QueryMultiple` | `GET /pedidos/{id}/detalhes` trazendo pedido, itens e produto | JSON com os itens aninhados |
| M07-A03 | EF ou Dapper? | Mesma consulta nos dois; anotação do aluno comparando em `curso/anotacoes-ef-vs-dapper.md` | Os dois endpoints retornam o mesmo resultado; anotação existe |

## Módulo 8 — Cache com Redis

**Modo:** `agente`

| ID | Aula | Entrega | Checkpoint |
| --- | --- | --- | --- |
| M08-A01 | O que é cache e quando usar | Redis no `docker-compose.yml`; `IDistributedCache` configurado | `docker compose ps` mostra o Redis |
| M08-A02 | Cache-aside | `GET /produtos/{id}` usa cache com TTL; escrita invalida a chave | Segunda chamada não vai ao banco (log mostra "cache hit") |
| M08-A03 | Idempotência | Header `Idempotency-Key` no POST de pedidos guardado no Redis | Dois POSTs com a mesma chave criam só 1 pedido |

## Módulo 9 — Mensageria com RabbitMQ

**Modo:** `agente`

| ID | Aula | Entrega | Checkpoint |
| --- | --- | --- | --- |
| M09-A01 | Por que filas existem | RabbitMQ no compose; painel em `localhost:15672` | Painel acessível |
| M09-A02 | Publicando um evento | `PedidoCriado` publicado ao criar pedido (MassTransit) | Mensagem aparece na fila/exchange no painel |
| M09-A03 | O Worker | Projeto `LabStore.Worker` consumindo `PedidoCriado` e logando "e-mail enviado" | Log do worker mostra o consumo |
| M09-A04 | Retry e dead-letter | Retry com 3 tentativas e fila de erro | Uma falha forçada vai para a fila `_error` após as tentativas |

## Módulo 10 — Busca com Elasticsearch

**Modo:** `agente`

| ID | Aula | Entrega | Checkpoint |
| --- | --- | --- | --- |
| M10-A01 | Busca de verdade vs `LIKE` | Elasticsearch e Kibana no compose; índice `produtos` com mapeamento | Índice existe (`GET /produtos/_mapping` no Kibana) |
| M10-A02 | Indexando por evento | Worker indexa produto quando ele é criado/alterado | Produto novo aparece no índice |
| M10-A03 | Endpoint de busca | `GET /busca/produtos?q=` com tolerância a erro de digitação e filtro de preço | Busca com uma letra trocada ainda encontra o produto |

## Módulo 11 — Inteligência artificial com LLM (OpenRouter)

**Modo:** `agente`

| ID | Aula | Entrega | Checkpoint |
| --- | --- | --- | --- |
| M11-A01 | O que é um LLM e como chamar por API | Conta no OpenRouter; chave em User Secrets; `ILlmClient` com SDK OpenAI apontando para `https://openrouter.ai/api/v1` | Endpoint de teste retorna uma resposta do modelo |
| M11-A02 | Avaliações e resumo | Entidade `Avaliacao`; `GET /produtos/{id}/resumo-avaliacoes` gerado pelo LLM | Retorna prós, contras e sentimento |
| M11-A03 | Resposta estruturada | Resumo retornado em JSON com formato fixo, validado no código | JSON desserializa no tipo C# esperado |
| M11-A04 | Custo e resiliência | Cache do resumo no Redis; timeout e retry; log de tokens usados | Segunda chamada vem do cache; log mostra tokens |

## Módulo 12 — MCP: a API como ferramenta para agentes

**Modo:** `agente`

| ID | Aula | Entrega | Checkpoint |
| --- | --- | --- | --- |
| M12-A01 | O que é MCP | `curso/anotacoes-mcp.md` do aluno explicando tool e resource com suas palavras | Arquivo existe |
| M12-A02 | Primeiro MCP server em C# | `LabStore.McpServer` com a tool `buscar_produtos` chamando a API | Server sobe e lista a tool |
| M12-A03 | Usando no seu agente | MCP server conectado no editor/agente do aluno; tool `criar_pedido` | O agente cria um pedido pela tool e ele aparece no banco |

## Módulo 13 — Juntando tudo

**Modo:** `agente`

| ID | Aula | Entrega | Checkpoint |
| --- | --- | --- | --- |
| M13-A01 | Tudo com um comando | `docker compose up` sobe toda a infraestrutura; README do projeto explicando como rodar | Seguindo o README do zero, a API sobe |
| M13-A02 | Logs e health checks | Serilog estruturado; `/health` checando banco, Redis, RabbitMQ e Elastic | `/health` retorna Healthy |
| M13-A03 | Dockerfile da API | Dockerfile multi-stage; API rodando como container no compose | `docker compose up` sobe a API e `/health` responde |
| M13-A04 | Retrospectiva | `curso/retrospectiva.md` do aluno: o que aprendeu, o que foi mais difícil, o que quer estudar depois | Arquivo existe |

Ao concluir o M13-A04 e a avaliação do Módulo 13, o estado vira `concluido`.

---

## Trilha avançada (apresentar no Caso G)

Sugestões para depois do curso, uma frase cada, sem gerar aulas automaticamente:

- Testes de integração com Testcontainers.
- Outbox pattern e saga de pedido com MassTransit.
- Autenticação com Keycloak (OAuth2/OIDC).
- RAG: busca semântica com embeddings (pgvector ou Elasticsearch).
- SignalR para status de pedido em tempo real; gRPC interno.
- Observabilidade com OpenTelemetry.
- Extração para microsserviços com .NET Aspire e YARP.

Se o aluno pedir uma dessas, crie um módulo extra `M14`, `M15`... no mesmo formato e registre no progresso.
