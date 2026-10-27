# Programando com o agente

O objetivo não é o aluno "usar IA". É ele virar alguém que **conduz** um agente: sabe o que pedir, pede em partes
pequenas, confere tudo e consegue explicar e defender cada linha que entrou no projeto.

## Os quatro hábitos que o curso inteiro treina

1. **Entender antes de pedir.** Se ele não sabe o que é um endpoint, não sabe pedir um nem revisar um.
2. **Pedir pequeno e claro.** Um pedido = uma mudança que dá para conferir em poucos minutos.
3. **Nunca aceitar sem rodar e ler.** Compilou não é funcionou; funcionou não é correto.
4. **Responder pelo código.** Se entrou no repositório, é dele. Ele precisa saber explicar.

## O `AGENTS.md` do projeto

Criado na aula `M00-A05` a partir de `assets/AGENTS.md`. É o arquivo de regras que o agente executor lê antes de
trabalhar (Antigravity, Claude Code, Codex, Cursor e outros reconhecem `AGENTS.md` na raiz).

Ele cresce com o curso. Sugira acréscimos quando fizer sentido, e o aluno escreve:

| Quando | Sugestão de regra |
| --- | --- |
| Módulo 2 | "Endpoints retornam os status codes corretos (201 ao criar, 404 quando não existe)." |
| Módulo 3 | "Toda mudança de banco vira migration; nunca altere o banco na mão." |
| Módulo 4 | "Respeite as camadas: Domain não referencia Infrastructure." |
| Módulo 5 | "Toda regra nova vem com teste de unidade." |
| Módulo 8+ | "Configuração e segredos nunca no código; use Options e User Secrets." |

Se o agente desrespeitar uma regra que está no `AGENTS.md`, isso é ótimo para ensinar: o aluno aponta a regra no
pedido de correção.

## Revisando o pedido (etapa `pedir`)

Escreva na seção "Revisão do professor do pedido" do arquivo. Confira:

| Critério | Pergunta que você faz | Exemplo de retorno |
| --- | --- | --- |
| Objetivo | Dá para entender o que deve existir no final? | "Diga qual rota e qual verbo." |
| Tamanho | Cabe numa conferência de poucos minutos? | "Peça só o POST agora; o PUT fica para o próximo pedido." |
| Contexto | Cita o que já existe e onde mexer? | "Diga que a entidade `Produto` já existe em `Domain/`." |
| Regras | Diz o que **não** fazer? Lembra o `AGENTS.md`? | "Peça para não instalar pacote novo sem avisar." |
| Critério de pronto | Diz como ele vai conferir? | "Inclua: 'POST com preço negativo deve retornar 400'." |
| Explicação | Pede para o agente explicar o que mudou? | "Peça um resumo do que foi alterado em cada arquivo." |

Elogie o que está bom antes do que falta. Não reescreva o pedido por ele: aponte e deixe ele ajustar.
No começo (Módulo 3), aceite pedidos simples; a partir do Módulo 6, cobre os seis critérios.

## Quando o agente erra (etapa `executar`)

É parte da aula, não um problema. Ensine a dar retorno como a um colega:

- Descrever o que aconteceu, não só "não funcionou": o erro, a saída, o comportamento esperado.
- Apontar a regra ou o critério de pronto que não foi atendido.
- Se o agente bagunçou muito: `git restore .` (ou `git reset --hard` para o último commit da aula) e um pedido menor.

Use a escada de dicas no **pedido de correção**: primeiro "o que exatamente aconteceu quando você rodou?", depois
"qual parte do pedido o agente pode ter entendido diferente?", e só então um exemplo de pedido de correção.

## Revisando o código gerado (etapa `executar`, quando passou)

Leia o diff da aula como um revisor sênior e escreva no arquivo do pedido:

**Perguntas de revisão (2 ou 3)** sobre o código que **o agente** gerou, para o aluno responder com as próprias
palavras. Bons tipos:

- "Por que o agente usou `X` aqui? O que aconteceria sem ele?"
- "Siga uma requisição `POST /produtos`: por quais arquivos e métodos ela passa?"
- "O que acontece se `Y` vier vazio/negativo/inexistente?"
- "Esse trecho poderia ser mais simples? Como?"

**Ajustes a pedir** (só problemas reais), para o aluno pedir ao agente e você conferir no `revisar`:
regra de negócio faltando, tratamento de erro ausente, código que não foi pedido, pacote desnecessário, segredo no
código, violação do `AGENTS.md`, nome confuso.

## Pegadinhas (para treinar a desconfiança)

Uma a cada duas ou três aulas do modo `agente`, inclua nas perguntas de revisão um caso que agentes costumam esquecer,
sem dizer se o agente acertou ou errou: "Confira: o que a API faz se dois pedidos tentarem comprar o último item do
estoque ao mesmo tempo?". O aluno precisa ir no código ver. Se o agente tratou, ótimo, ele aprende a confirmar; se
não tratou, vira ajuste.

Outros temas bons: valores nulos, listas vazias, paginação sem limite, `async` sem `await`, exceção engolida,
validação só no front, dados de um usuário vazando para outro.

## Na avaliação de módulo (modo `misto` e `agente`)

Inclua ao menos uma pergunta de cada tipo:

- **Explique o código gerado:** um trecho real do repositório que o agente escreveu, "explique o que faz e por quê".
- **Revise:** um trecho com um problema plantado (escrito por você na avaliação, não no projeto), "o que você pediria
  para o agente corrigir e como escreveria esse pedido?".

As avaliações são feitas **sem o agente**.

## O que registrar no progresso

- No Diário: quantas rodadas de pedido foram necessárias e se ele achou sozinho problemas no código gerado.
- Em `Pontos fortes`: "pede em partes pequenas", "pega casos de borda na revisão", etc.
- Em `Pontos a reforçar`: "aceita o código sem rodar", "pedidos vagos", "não consegue explicar o fluxo da requisição".
