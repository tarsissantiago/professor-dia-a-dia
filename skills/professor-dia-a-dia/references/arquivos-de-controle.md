# Arquivos de controle

Tudo o que o professor precisa para saber "onde estamos" fica na pasta `curso/` na raiz do projeto do aluno.
Esses arquivos **devem ir para o git** junto com o código: são a memória do curso.

```text
curso/
├── progresso.md              # estado atual (o professor lê e escreve)
├── aulas/                    # a apostila do aluno, uma aula por arquivo
│   ├── M00-A01-o-que-e-programar.md
│   └── ...
├── avaliacoes/               # provas de fim de módulo + feedback
│   ├── modulo-00.md
│   └── ...
└── anotacoes-*.md            # textos que o próprio aluno escreve em algumas aulas
```

## `curso/progresso.md`

Modelo inicial em `assets/progresso.md`. O frontmatter YAML é a fonte da verdade do estado; o corpo é legível
para o aluno.

### Frontmatter

| Campo | Valores | Uso |
| --- | --- | --- |
| `curso` | `professor-dia-a-dia` | identifica o arquivo |
| `versao_curriculo` | `1` | versão do `curriculo.md` usada |
| `aluno` | nome ou vazio | do `git config user.name`, se existir |
| `sistema` | `windows`, `linux`, `macos` | define os comandos mostrados |
| `iniciado_em` | `AAAA-MM-DD` | |
| `ultima_atualizacao` | `AAAA-MM-DD` | atualize a cada `/curso` |
| `modulo_atual` | número | |
| `aula_atual` | ID, ex. `M02-A03` ou `M02-R1` | |
| `estado` | `aula-em-andamento`, `avaliacao-pendente`, `reforco`, `concluido` | escolhe o caso no `SKILL.md` |

### Corpo

1. **Resumo** — 2 ou 3 linhas para o aluno: em que módulo está, quantas aulas concluiu, próxima ação.
2. **Aulas** — tabela: `ID | Aula | Estado | Tentativas | Concluída em`.
   Estados: `pendente`, `em andamento`, `concluída`, `pulada (já existia)`.
   Só liste as aulas do módulo atual e dos anteriores; as futuras não aparecem.
3. **Avaliações** — tabela: `Módulo | Arquivo | Nota | Data`.
4. **Pontos fortes** — bullets curtos, atualizados após cada avaliação.
5. **Pontos a reforçar** — bullets curtos; remova um item quando o aluno mostrar que dominou.
6. **Diário** — uma linha por evento, a mais recente no topo: `AAAA-MM-DD — evento`.
   Exemplos: aula iniciada/concluída, checkpoint falhou e por quê, destravou no degrau 2 da escada de dicas,
   avaliação corrigida com nota, aluno pediu para o professor fazer o código.

## Arquivo de aula — `curso/aulas/MXX-AYY-titulo-curto.md`

Modelo em `assets/aula.md`. Nome em minúsculas, sem acento, com hífens. Aula de reforço: `MXX-R1-...`.
Uma vez gerada, a aula **não é reescrita** (é a apostila). Correções vão numa seção `Nota do professor` no fim.

## Avaliação — `curso/avaliacoes/modulo-XX.md`

Modelo em `assets/avaliacao.md`.

### Como montar

- **5 a 7 perguntas**, cobrindo as aulas do módulo, misturando os tipos:
  - **Conceito:** "Explique com suas palavras o que é uma migration e por que ela existe."
  - **Leitura de código:** um trecho curto; "o que este código imprime?" ou "qual o bug aqui?"
  - **Situação:** "A API retorna 500 quando o produto não existe. O que deveria retornar e por quê?"
  - **Prática no projeto (1 por avaliação):** uma pequena mudança no repositório, ex.: "crie o endpoint
    `GET /produtos/mais-caros` que retorna os 5 produtos mais caros". O professor verifica no código.
- Inclua 1 pergunta que revisita um item de `Pontos a reforçar` de módulos anteriores, se houver.
- Nada de múltipla escolha: o aluno sempre escreve com as próprias palavras.
- Cada pergunta vale pontos (total 100). Prática vale mais (20 a 30).

### Como corrigir

- Não altere o texto do aluno. Abaixo de cada resposta, acrescente:

  ```markdown
  > **Feedback do professor** — ✅ Certo | 🟡 Parcial | ❌ Ainda não · X/Y pontos
  > O que ficou bom e o que faltou, com o porquê, em 2 a 5 linhas.
  ```

- Para a pergunta prática, verifique o código de verdade (leia o arquivo, rode o build, chame o endpoint).
- No fim, preencha `## Resultado`: nota total, 2 a 3 pontos fortes, 2 a 3 pontos a reforçar e a próxima ação
  (próximo módulo ou aula de reforço).
- Parcial vale metade dos pontos, a seu critério, sempre justificando.
- Abaixo de 60 pontos: estado `reforco` e aula `MXX-R1`. A partir de 60: próximo módulo.
