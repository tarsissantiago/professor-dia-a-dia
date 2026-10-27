# Professor Dia a Dia

Um professor particular de programação que mora dentro do seu editor. Você digita **`/curso`** e ele te ensina
C# e .NET **construindo um projeto real** do zero: a **LabStore**, uma API de loja que começa com um "Olá, mundo" e
termina com banco de dados, testes, cache, filas, busca e inteligência artificial.

Funciona com **Antigravity, Claude Code, Codex, Cursor, Gemini CLI** e qualquer ferramenta compatível com o padrão
aberto [Agent Skills](https://agentskills.io) (`SKILL.md`).

## Como funciona

- **Você digita, ele ensina.** Cada aula explica o problema, a ideia (com analogia) e o código para você digitar,
  passo a passo. Ele não escreve o projeto por você.
- **Sem perguntas chatas no começo.** O `/curso` olha o seu repositório e o arquivo de progresso e sabe exatamente
  onde você parou. Repositório vazio? Ele se apresenta e começa a primeira aula.
- **Ele confere de verdade.** Ao rodar `/curso` de novo, o professor verifica o checkpoint da aula (compila, roda,
  chama a API) antes de liberar a próxima.
- **Avaliação no fim de cada módulo**, num arquivo que você responde com suas palavras. O professor corrige ali
  mesmo, com feedback embaixo de cada resposta, e ajusta o ritmo: se precisar, passa uma aula de reforço.
- **Tudo fica no seu repositório**, na pasta `curso/`:

```text
curso/
├── progresso.md        # onde você está, notas, pontos fortes e a reforçar
├── aulas/              # cada aula salva: no fim, é a sua apostila
└── avaliacoes/         # provas de fim de módulo com o feedback do professor
```

## O que você vai aprender

| Módulo | Assunto |
| --- | --- |
| 0 | Ambiente, terminal, Git e o primeiro programa |
| 1 | C# essencial (tipos, classes, listas, LINQ, exceções, async) |
| 2 | HTTP, REST e a primeira API com Swagger |
| 3 | Banco de dados com PostgreSQL e Entity Framework Core |
| 4 | Organizando o código: injeção de dependência, camadas, validação |
| 5 | Testes de unidade com xUnit e mocks |
| 6 | MediatR e CQRS |
| 7 | Dapper e relatórios em SQL |
| 8 | Cache com Redis |
| 9 | Mensageria com RabbitMQ e um Worker |
| 10 | Busca com Elasticsearch |
| 11 | Inteligência artificial com LLM via OpenRouter |
| 12 | MCP: sua API como ferramenta para agentes de IA |
| 13 | Juntando tudo: Docker, health checks, logs |

Público: quem está começando. Se você já sabe parte disso e o repositório já tem código, o professor detecta e
começa no ponto certo.

## Instalação

Crie (ou escolha) a pasta onde você vai programar. A skill é instalada **dentro do projeto**, junto com o comando
`/curso`.

### Opção 1 — script (recomendado)

```bash
git clone https://github.com/tarsissantiago/professor-dia-a-dia.git
```

**Windows (PowerShell):**

```powershell
.\professor-dia-a-dia\scripts\install.ps1 -Ferramenta antigravity -Projeto C:\projetos\labstore
```

**Linux / macOS:**

```bash
./professor-dia-a-dia/scripts/install.sh antigravity ~/projetos/labstore
```

Troque `antigravity` por `claude`, `codex`, `cursor`, `gemini` ou `todas`.

| Ferramenta | Skill vai para | Comando `/curso` vai para |
| --- | --- | --- |
| Antigravity | `.agent/skills/` | `.agent/workflows/curso.md` |
| Claude Code | `.claude/skills/` | `.claude/commands/curso.md` |
| Codex | `.agents/skills/` | `~/.codex/prompts/curso.md` (use `/prompts:curso`) |
| Cursor | `.cursor/skills/` | `.cursor/commands/curso.md` |
| Gemini CLI | `.gemini/skills/` | `.gemini/commands/curso.toml` |

### Opção 2 — `npx skills` (só a skill)

```bash
npx skills add tarsissantiago/professor-dia-a-dia
```

Instala a skill nas ferramentas detectadas. Depois é só pedir "começar o curso do professor dia a dia" ou copiar
o comando `/curso` da pasta `integrations/` da sua ferramenta.

### Opção 3 — plugin do Claude Code

```text
/plugin marketplace add tarsissantiago/professor-dia-a-dia
/plugin install professor-dia-a-dia@professor-dia-a-dia
```

## Começando

1. Abra a pasta do projeto na sua ferramenta.
2. Digite **`/curso`**.
3. Siga a aula, faça o commit e digite **`/curso`** de novo. Repita todo dia um pouquinho.

Dica: faça commit da pasta `curso/` também. Ela é a memória do curso e permite continuar em outra máquina.

## Estrutura do repositório

```text
skills/professor-dia-a-dia/     # a skill (padrão Agent Skills)
├── SKILL.md                    # comportamento do professor e fluxo do /curso
├── references/                 # método de ensino, currículo, formato dos arquivos de controle
└── assets/                     # modelos de progresso, aula e avaliação
commands/curso.md               # comando /curso do plugin do Claude Code
integrations/                   # comando /curso para Antigravity, Codex, Cursor e Gemini CLI
.claude-plugin/                 # manifesto de plugin e marketplace do Claude Code
scripts/                        # instaladores (bash e PowerShell)
```

## Contribuindo

Ideias de aulas, correções no currículo e relatos de uso são bem-vindos em issues e pull requests.
O currículo fica em `skills/professor-dia-a-dia/references/curriculo.md`.

## Licença

[MIT](LICENSE)
