# MXX-AYY — Título da aula

> Módulo X — Nome do módulo · Tempo estimado: 30 a 60 min

## 🎯 Objetivo

Ao final desta aula, você vai ter **[entrega concreta]** funcionando e vai entender **[conceito principal]**.

## 🤔 Por que isso existe

O problema antes da solução, em 3 a 6 linhas, de preferência usando o próprio projeto LabStore.

## 💡 A ideia

O conceito explicado com uma analogia do dia a dia. Palavras novas em **negrito** com a explicação na mesma frase.

> **Como esta aula funciona** (escolha conforme o modo do módulo e apague o que não se aplica):
> - `mao`: só a parte ✍️.
> - `misto`: parte ✍️ com o conceito novo, depois parte 🤖 para o resto da entrega.
> - `agente`: só a parte 🤖.

## ✍️ Na mão

> Digite o código em vez de copiar e colar. É assim que a mão aprende, e é o que vai te permitir revisar o que o
> agente fizer depois.

### Passo 1 — O que vamos fazer

Em qual arquivo, onde dentro dele, e por quê.

```csharp
// código curto, com comentários nas linhas que importam
```

**Rode e veja:**

```bash
comando para executar
```

O que deve aparecer na tela.

**Salve o passo:**

```bash
git add .
git commit -m "MXX-AYY passo 1: descrição curta do que mudou"
```

### Passo 2 — ...

(repita o formato, sempre terminando com "Salve o passo"; no máximo ~25 linhas de código por passo)

## 🤖 Com o agente

Agora o agente digita e você conduz.

**O que precisa passar a existir:** a entrega desta parte, em linguagem de negócio (ex.: "os endpoints de editar e
apagar produto, com os mesmos cuidados do POST que você fez na mão").

**Como é o "bom":** um exemplo pequeno do padrão esperado, para você reconhecer na revisão. Não é a solução.

```csharp
// trecho curto mostrando o padrão, não a entrega completa
```

**Critério de pronto:** o que você vai conferir antes de aceitar (ex.: "DELETE de id inexistente retorna 404").

1. **Salve antes de pedir:** `git add . && git commit -m "MXX-AYY: antes do agente"`. Se der ruim, `git restore .` te
   traz de volta.
2. **Peça:** escreva seu pedido em `curso/prompts/MXX-AYY.md` e digite `/curso` para o professor revisar.
3. **Execute:** com o pedido aprovado, abra uma conversa nova com o agente (sem `/curso`), cole o pedido e acompanhe.
4. **Confira:** rode, teste o critério de pronto, leia o que mudou (`git diff`). Faça o commit:
   `git commit -am "MXX-AYY agente: o que foi pedido"` e digite `/curso`.
5. **Revise:** responda as perguntas que o professor deixar no arquivo do pedido e peça ao agente os ajustes indicados.

## ✅ Checkpoint

Como você sabe que deu certo:

- [ ] Item verificável 1 (ex.: `dotnet build` sem erros)
- [ ] Item verificável 2 (ex.: `GET /produtos` retorna a lista)

- [ ] (parte 🤖) Pedido revisado, perguntas de revisão respondidas e ajustes feitos
- [ ] Todos os passos com commit e o código enviado ao GitHub

Quando tudo estiver ok, envie para o GitHub:

```bash
git status      # deve dizer "nothing to commit"
git push
```

E digite **`/curso`** para o professor conferir e liberar a próxima aula.

## 🐞 Erros comuns

| Se aparecer... | Provavelmente é... | Faça... |
| --- | --- | --- |
| mensagem de erro | causa em linguagem simples | correção |

## 🚀 Desafio (opcional)

Uma pequena extensão para quem quiser ir além. Não conta para o checkpoint.

---

> ⏭️ **Já sabe isso?** É só avisar: digite `/curso pular` (ou escreva "quero pular essa aula") e vamos direto para um
> questionário rápido. Passou, a aula conta como feita. Dá para pular o módulo inteiro do mesmo jeito.
