## **Jogador**  
**Descrição:** Representa o jogador no jogo, com atributos relacionados à vida, nível, nome, inventário, casa, área e habilidades.

| Nome            | Descrição                                    | Tipo de dado | Tamanho | Restrições de domínio                           |
|-----------------|----------------------------------------------|--------------|---------|-------------------------------------------------|
| id_jogador      | Identificador único do jogador               | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**              |
| vida            | Pontuação de vida do jogador                 | int          | 4       | **NOT NULL**, 0 <= vida <= 100                  |
| nivel           | Nível do jogador                             | int          | 4       | **NOT NULL**, 1 <= nivel <= 100                 |
| nome            | Nome do jogador                              | Varchar      | 100     | **NOT NULL**                                    |
| id_inventario   | Relacionamento com a entidade Inventário     | int          | 4       | **FK** para `Inventario(id_inventario)`         |
| id_casa         | Relacionamento com a entidade Casa           | int          | 4       | **FK** para `Casa(id_casa)`                     |
| id_area         | Relacionamento com a entidade Área           | int          | 4       | **FK** para `Area(id_area)`                     |
| id_habilidade   | Relacionamento com a entidade Habilidades    | int          | 4       | **FK** para `Habilidades(id_habilidade)`        |
| id_feitico      | Relacionamento com a entidade Feitiços       | int          | 4       | **FK** para `Feiticos(id_feitico)`              |

---

## **Inventário**  
**Descrição:** Armazena os itens do jogador, incluindo a capacidade total do inventário.

| Nome            | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|-----------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_inventario   | Identificador único do inventário          | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**            |
| id_item           | Identificador do item no inventário               | int         | 4     | **FK** para `Item(id_item)`                                |
| tamanho         | Capacidade total do inventário             | int          | 4       | **NOT NULL**, 1 <= tamanho <= 100             |
| id_jogador      | Relacionamento com a entidade Jogador      | int          | 4       | **FK** para `Jogador(id_jogador)`             |

---

## **Casa**  
**Descrição:** Representa uma casa no jogo, incluindo o professor responsável, vantagens e alunos.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_casa            | Identificador único da casa                | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**            |
| nome_casa          | Nome da casa                               | Varchar      | 100     | **NOT NULL**                                  |
| professor_responsavel | Nome do professor responsável             | Varchar      | 100     | **NOT NULL**                                  |
| vantagens          | Vantagens relacionadas à casa              | Text         | 500     | **NOT NULL**                                  |
| alunos             | Lista de alunos pertencentes à casa        | Text         | 500     | **NOT NULL**                                  |

---

## **Área**  
**Descrição:** Representa uma área geográfica no mapa, com coordenadas para os pontos cardinais.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_area            | Identificador único da área                | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**            |
| area_sul           | Coordenada para a área sul                 | Varchar      | 50      | **NOT NULL**                                  |
| area_norte         | Coordenada para a área norte               | Varchar      | 50      | **NOT NULL**                                  |
| area_leste         | Coordenada para a área leste               | Varchar      | 50      | **NOT NULL**                                  |
| area_oeste         | Coordenada para a área oeste               | Varchar      | 50      | **NOT NULL**                                  |

---

## **Região**  
**Descrição:** Representa uma região geográfica do jogo, com uma descrição detalhada.

| Nome                | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|---------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_regiao           | Identificador único da região              | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**            |
| descricao_regiao    | Descrição detalhada da região              | Text         | 500     | **NOT NULL**                                  |

---

## **Mapa**  
**Descrição:** Representa o mapa do jogo, vinculado a uma região.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_mapa            | Identificador único do mapa                | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**            |
| id_regiao          | Relacionamento com a entidade Região       | int          | 4       | **FK** para `Regiao(id_regiao)`               |

---

## **NPC**  
**Descrição:** Representa um NPC no jogo, com atributos para diferenciar entre professor, inimigo, aluno e Fred/Jorge.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_NPC             | Identificador único do NPC                 | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**            |
| id_instancia_NPC   | Relacionamento com a entidade InstanciaNPC | int          | 4       | **FK** para `InstanciaNPC(id_instancia_NPC)`  |

---

## **InstanciaNPC**  
**Descrição:** Define a instância específica de um NPC, incluindo seu nome, tipo e falas.

| Nome                | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|---------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| nome                | Nome do NPC                                | Varchar      | 100     | **NOT NULL**                                  |
| tipo_NPC            | Tipo do NPC (Professor, Inimigo, Aluno, Fred e Jorge) | Varchar | 50      | **NOT NULL**                                  |
| falas               | Falas atribuídas ao NPC                    | Text         | 500     | **NOT NULL**                                  |

---

### **Professor**
**Descrição**: Atributos específicos de NPCs do tipo **Professor**.

| Nome                | Descrição                                | Tipo de dado | Tamanho  | Restrições de domínio                    |
|---------------------|------------------------------------------|--------------|----------|------------------------------------------|
| id_professor    | Identificador único do Professor         | int          | 4        | **PK, IDENTITY, NOT NULL**               |
| id_npc          | Identificador do NPC (referência a InstanciaNPC) | int | 4       | **FK** para `InstanciaNPC(id_instancia_NPC)`, **NOT NULL** |
| casa            | Casa à qual o professor pertence         | Varchar   | 50        |                                          |
| disciplina      | Disciplina que o professor ensina        | Varchar  | 100        |                                          |
| item            | Item associado ao professor              | int          | 4        | **FK** para `Item(id_item)`               |
| vantagens       | Vantagens do professor                   | Text         | 500        |                                          |

---

### **Inimigo**
**Descrição**: Atributos específicos de NPCs do tipo **Inimigo**.

| Nome                | Descrição                                | Tipo de dado | Tamanho  | Restrições de domínio                    |
|---------------------|------------------------------------------|--------------|----------|------------------------------------------|
| id_inimigo      | Identificador único do Inimigo           | int         | 4        | **PK, IDENTITY, NOT NULL**                 |
| id_npc          | Identificador do NPC (referência a InstanciaNPC) | int | 4        | **FK** para `InstanciaNPC(id_instancia_NPC)`, **NOT NULL** |
| pontos_vida     | Pontos de vida do inimigo                | int          | 4        | **NOT NULL**                                 |
|  id_habilidade   | Relacionamento com a entidade Habilidades    | int          | 4       | **FK** para `Habilidades(id_habilidade)`                                            |

---

### **Aluno** 
**Descrição**: Atributos específicos de NPCs do tipo **Aluno**.

| Nome                | Descrição                                | Tipo de dado | Tamanho  | Restrições de domínio                    |
|---------------------|------------------------------------------|--------------|----------|------------------------------------------|
| id_aluno       | Identificador único do Aluno             | int          | 4        | **PK, IDENTITY, NOT NULL**                    |
| id_npc          | Identificador do NPC (referência a InstanciaNPC) | int | 4        | **FK** para `InstanciaNPC(id_instancia_NPC)`, **NOT NULL** |
| id_casa         | Relacionamento com a entidade Casa           | int          | 4       | **FK** para `Casa(id_casa)`                                       |
| item            | Item associado ao aluno                  | int          | 4        | **FK** para `Item(id_item)`                  |
| vantagens       | Vantagens do aluno                       | Text        | 500        |                                     |

---

### **Fred e Jorge**
**Descrição**: Atributos específicos de **Fred e Jorge**, que são NPCs especiais.

| Nome                | Descrição                                | Tipo de dado | Tamanho  | Restrições de domínio                    |
|---------------------|------------------------------------------|--------------|----------|------------------------------------------|
| id_fred_jorge   | Identificador único de Fred ou Jorge     | int          | 4        | **PK, IDENTITY, NOT NULL**                 |
| id_npc          | Identificador do NPC (referência a InstanciaNPC) | int | 4        | FK, Not Null, Referência a **InstanciaNPC** |
| inventarios     | Inventários de Fred ou Jorge             | Text         | 4        | Pode ser uma lista de IDs ou uma referência para a tabela **Inventário** |
| item            | Item associado ao Fred ou Jorge                  | int          | 4        | **FK** para `Item(id_item)` |
| area            | Área onde Fred ou Jorge se encontra      | Varchar  | 100        |                                          |

---

## **Feitiços**  
**Descrição:** Representa feitiços disponíveis no jogo, com o tipo e habilidade necessária para usá-los.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_feitico         | Identificador único do feitiço             | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**            |
| tipo_feitico       | Tipo do feitiço                            | Varchar      | 100     | **NOT NULL**                                  |
| id_habilidade      | Relacionamento com a entidade Habilidades  | int          | 4       | **FK** para `Habilidades(id_habilidade)`      |

---

## **Habilidades**  
**Descrição:** Representa as habilidades do jogador, como Inteligência, Coragem, Lealdade e Ambição, com os respectivos níveis.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_habilidade      | Identificador único da habilidade          | int         | 4      | **PK**, **IDENTITY**, **NOT NULL**            |
| tipo               | Tipo da habilidade (Inteligência, Coragem, Lealdade, Ambição) | Varchar  | 50      | **NOT NULL**                                  |
| nivel              | Nível da habilidade                        | int          | 4      | **NOT NULL**, 1 <= nivel <= 100               |

---

## **Item**  
**Descrição:** Representa um item no jogo, que pode ser um tipo de poção ou livro, com atributos específicos.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_item            | Identificador único do item                | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**            |
| id_instancia_item  | Relacionamento com a entidade InstanciaItem | int          | 4       | **FK** para `InstanciaItem(id_instancia_item)` |

### **Poção**  
**Descrição:** Representa uma poção no jogo, com tipo e efeito.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| tipo               | Tipo da poção (ex: cura, mana)             | Varchar      | 50      | **NOT NULL**                                  |
| efeito             | Efeito da poção (ex: cura 50 de vida)      | Varchar      | 100     | **NOT NULL**                                  |

### **Livros**  
**Descrição:** Representa um livro no jogo, com a habilidade que oferece e o número de páginas.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| habilidade         | Habilidade que o livro ensina              | Varchar      | 50      | **NOT NULL**                                  |
| paginas            | Número de páginas do livro                 | int      | 4       | **NOT NULL**, 1 <= paginas <= 1000            |

---

## **Missão**  
**Descrição:** Representa uma missão no jogo, com recompensas e participantes.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_missao          | Identificador único da missão              | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**            |
| recompensas        | Recompensas obtidas ao completar a missão  | Text         | 500     | **NOT NULL**                                  |
| participantes      | Lista de participantes da missão           | Text         | 500     | **NOT NULL**                                  |
