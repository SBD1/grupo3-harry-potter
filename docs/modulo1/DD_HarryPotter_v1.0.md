## Histórico de Versões
| Versão | Descrição                     | Autor                                                        |
| :----: |  ------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `1.0` |  Criação do documento de Dicionário de Dados             | [André Maia](https://github.com/andre-maia51)                               |
| `1.1` |  Alteração nas tabelas das entidades             | [André Maia](https://github.com/andre-maia51)                               |


## **Personagem**  
**Descrição:** Representa o personagem do jogo, incluindo os NPC e o PC.

| Nome            | Descrição                                    | Tipo de dado | Tamanho | Restrições de domínio                           |
|-----------------|----------------------------------------------|--------------|---------|-------------------------------------------------|
| id_personagem     | Identificador único do personagem               | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**              |
| vida            | Pontuação de vida do personagem                 | int          | 4       | **NOT NULL**, 0 <= vida <= 100                  |
| nivel           | Nível do personagem                             | int          | 4       | **NOT NULL**, 1 <= nivel <= 100                 |
| nome            | Nome do personagem                              | Varchar      | 100     | **NOT NULL**                                    |
| id_inventario   | Relacionamento com a entidade Inventário     | int          | 4       | **FK** para `Inventario(id_inventario)`, **NOT NULL**         |
| id_area         | Relacionamento com a entidade Área           | int          | 4       | **FK** para `Area(id_area)`, **NOT NULL**                     |
| id_habilidade   | Relacionamento com a entidade Habilidade    | int          | 4       | **FK** para `Habilidade(id_habilidade)`        |
| id_missão      | Relacionamento com a entidade Missão       | int          | 4       | **FK** para `Missão(id_missao)`              |

---

## **Jogador (PC)**  
**Descrição:** Representa o jogador no jogo, com atributos relacionados à vida, nível, nome, inventário, casa, área e habilidades.

| Nome            | Descrição                                    | Tipo de dado | Tamanho | Restrições de domínio                           |
|-----------------|----------------------------------------------|--------------|---------|-------------------------------------------------|
| varinha     | Descrição da varinha do jogador            | Text         | 500       | **NOT NULL**              |
| id_casa      | Relacionamento com a entidade Casa     | int          | 4       | **FK** para `Casa(id_casa)`, **NOT NULL**              |

---

## **NPC**  
**Descrição:** Representa um NPC no jogo.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| falas            | Contém as falas do NPC              | Text         | 500       | **NOT NULL**            |

---

### **Professor**
**Descrição**: Atributos específicos de NPCs do tipo **Professor**.

| Nome                | Descrição                                | Tipo de dado | Tamanho  | Restrições de domínio                    |
|---------------------|------------------------------------------|--------------|----------|------------------------------------------|
| vantagens   | Informa quais as vantagens que o professor possui      | Text        | 500        | **NOT NULL**               |
| disciplina       | Nome da disciplina que o professor ministra | Varchar | 50       | **NOT NULL** |
| id_casa      | Relacionamento com a entidade Casa     | int          | 4       | **FK** para `Casa(id_casa)`, **NOT NULL**              |
---

### **Aluno** 
**Descrição**: Atributos específicos de NPCs do tipo **Aluno**.

| Nome                | Descrição                                | Tipo de dado | Tamanho  | Restrições de domínio                    |
|---------------------|------------------------------------------|--------------|----------|------------------------------------------|
| vantagens       | Vantagens do aluno                       | Text        | 500        |  **NOT NULL**   |
| id_casa      | Relacionamento com a entidade Casa     | int          | 4       | **FK** para `Casa(id_casa)`, **NOT NULL**              |

---

## **Fred e Jorge**  
**Descrição:** Representa o Fred e Jorge.

| Nome            | Descrição                                    | Tipo de dado | Tamanho | Restrições de domínio                           |
|-----------------|----------------------------------------------|--------------|---------|-------------------------------------------------|
| id_casa      | Relacionamento com a entidade Casa     | int          | 4       | **FK** para `Casa(id_casa)`, **NOT NULL**              |

---

### **Inimigo**
**Descrição**: Não possui nenhum atributo exclusivo.

---

## **Inventário**  
**Descrição:** Armazena os itens do jogador, incluindo a capacidade total do inventário.

| Nome            | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|-----------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_inventario   | Identificador único do inventário          | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**            |
| id_item       | Identificador do item no inventário               | int         | 4     | **FK** para `Item(id_item)`                                |
| tamanho         | Capacidade total do inventário             | int          | 4       | **NOT NULL**, 1 <= tamanho <= 100             |
| id_personagem      | Relacionamento com a entidade Personagem     | int          | 4       | **FK** para `Personagem(id_personagem)`, **NOT NULL**             |

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
| id_regiao      | Relacionamento com a entidade Região   | int          | 4       | **FK** para `Região(id_regiao)`, **NOT NULL**              |

---

## **Região**  
**Descrição:** Representa uma região geográfica do jogo, com uma descrição detalhada.

| Nome                | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|---------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_regiao           | Identificador único da região              | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**            |
| descricao_regiao    | Descrição detalhada da região              | Text         | 500     | **NOT NULL**                                  |
| id_mapa      | Relacionamento com a entidade Mapa     | int          | 4       | **FK** para `Mapa(id_mapa)`, **NOT NULL**              |

---

## **Mapa**  
**Descrição:** Representa o mapa do jogo, vinculado a uma região.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_mapa            | Identificador único do mapa                | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**            |

---

## **Feitiço**  
**Descrição:** Representa feitiços disponíveis no jogo, com o tipo e habilidade necessária para usá-los.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_feitico         | Identificador único do feitiço             | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**            |
| tipo_feitico       | Tipo do feitiço                            | Varchar      | 100     | **NOT NULL**                                  |
| habilidade-requerida    | Tipo da habilidade requerida | int          | 4       | **FK** para `Habilidade(id_habilidade)`, **NOT NULL**      |

---

## **Habilidade**  
**Descrição:** Representa as habilidades do jogador, como Inteligência, Coragem, Lealdade e Ambição, com os respectivos níveis.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_habilidade      | Identificador único da habilidade          | int         | 4      | **PK**, **IDENTITY**, **NOT NULL**            |
| nivel              | Nível da habilidade                        | int          | 4      | **NOT NULL**, 1 <= nivel <= 100               |

---

## **Item**  
**Descrição:** Representa um item no jogo, que pode ser um tipo de poção ou livro, com atributos específicos.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_item            | Identificador único do item                | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**            |

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
| nome-feitico            | Nome do feitiço ensinado pelo livro               | Varchar      | 50       | **NOT NULL**         |

---

## **Missão**  
**Descrição:** Representa uma missão no jogo, com recompensas e participantes.

| Nome               | Descrição                                  | Tipo de dado | Tamanho | Restrições de domínio                         |
|--------------------|--------------------------------------------|--------------|---------|-----------------------------------------------|
| id_missao          | Identificador único da missão              | int          | 4       | **PK**, **IDENTITY**, **NOT NULL**            |
| recompensa       | Recompensas obtidas ao completar a missão  | Text         | 500     | **NOT NULL**                                  |
| participante      | Lista de participantes da missão           | Text         | 500     | **NOT NULL**                                  |
