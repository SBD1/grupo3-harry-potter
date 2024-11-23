## Histórico de Versões
| Versão | Descrição                     | Autor                                                        |
| :----: |  ------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `1.0` |  Criação do documento MER             | [Pedro Henrique](https://github.com/PhFariaa)                               |
|`1.1`| Adição do MER no GitHub |[André Maia](https://github.com/andre-maia51) |

# MER - Modelo Entidade Relacionamento
O MER é uma ferramenta usada para representar a estrutura de um banco de dados de forma conceitual, destacando as entidades que o compõem os relacionamentos entre elas.

## 1. Entidades
- **Jogador**
- **Inventário**
- **Casa**
- **Área**
- **Região**
- **Mapa**
- **NPC (Professor / Inimigo / Aluno / Fred e Jorge)**
- **InstanciaNPC**
- **Feitiços**
- **Habilidades (Inteligência / Coragem / Lealdade / Ambição)**
- **Item (Poção / Livros)**
- **Missão**

## 2. Atributos
- **Jogador**: <ins>id-jogador</ins>, vida, nivel, nome, inventario, casa, area, habilidades, feitico;
- **Inventário**: <ins>id-inventario</ins>, itens, tamanho, id-jogador;
- **Casa**: <ins>id-casa</ins>, nome-casa, professor-responsavel, vantagens, alunos;
- **Área**: <ins>id-area</ins>, area-sul, area-norte, area-leste, area-oeste;
- **Região**: <ins>id-regiao</ins>, descricao-regiao;
- **Mapa**: <ins>id-mapa</ins>, regiao;
- **NPC**: <ins>id-NPC</ins>, instancia-NPC;
    - **InstanciaNPC**: nome, tipo-NPC, falas;
        - **Professor**: casa, disciplina, item, vantagens;
        - **Inimigo**: pontos-vida, habilidades;
        - **Aluno**: casa, item, vantagens;
        - **Fred e Jorge**: inventarios, itens, area.
- **Habilidades**: <ins>id-habilidade</ins>, tipo, nível;
- **Item**: <ins>id-item</ins>, instancia-item;
    - **Poção**: tipo, efeito;
    - **Livros**: habilidade, paginas.
- **Missão**: <ins>id-missao</ins>, recompensas, participantes;
- **Feitiços**: <ins>id-feitico</ins>, tipo-feitico, habilidade-requerida.

## 3. Relacionamentos
**Jogador - Inventário**

- Um jogador possui um inventário;
- Cardinalidade: (1, 1).

**Jogador - Casa**

- Um jogador tem uma casa;
- Cardinalidade: (1, 1).

**Jogador - Área**

- Um jogador está em uma área, e uma área pode conter vários jogadores; 
- Cardinalidade: (N, 1).

**Jogador - NPC**

- Um jogador interage com vários NPCs, e um NPC pode interagir com vários jogadores; 
- Cardinalidade: (M, N).

**Jogador - Feitiço**

- Um jogador conjura vários feitiços, e um feitiço pode ser conjurado por vários jogadores;
- Cardinalidade: (M, N).

**Jogador - Habilidade**

- Um jogador tem várias habilidades, e uma habilidade é possuída por vários jogadores;
- Cardinalidade: (M, N).

**Jogador - Itens**

- Um jogador tem vários itens, e um item pode estar com vários jogadores;
- Cardinalidade: (M, N).

**Jogador - Missão**

- Um jogador participa de várias missões, e uma missão está atrelada a um jogador;
- Cardinalidade: (1, N).

**Inventário - NPC**

- Um inventário pode ser possuído por vários NPCs, e um NPC possui um inventário;
- Cardinalidade: (1, N).

**Casa - NPC**

- Uma casa está atrelada a um NPC, e um NPC tem uma casa;
- Cardinalidade: (1, 1).

**Área - NPC**

- Uma área pode conter nários NPCs, e um NPC está em uma área;
- Cardinalidade: (N, 1).

**Área - Área**

- Uma área pode estar conectada a várias outras áreas;
- Cardinalidade: (M, N).

**Área - Região**

- Uma área pertence a uma região, e uma região contém várias áreas;
- Cardinalidade: (N, 1).

**Região - Mapa**

- Uma região está em um mapa, e um mapa possui várias regiões;
- Cardinalidade: (N, 1).

**Professor - Feitiço**

- Um professor ensina vários feitiços, e um feitiço pode ser ensinado vários professores;
- Cardinalidade: (M, N).

**Professor - Jogador**

- Um professor fala com um jogador, e um jogador fala com vários professores;
- Cardinalidade: (N, 1).

**Habilidades - Casa**

- Uma habilidade é influenciada por uma casa, e uma casa influencia várias habilidades;
- Cardinalide: (N, 1).

**Poção - Inventário**

- Uma poção pode estar em vários inventários, e um inventário pode conter várias poções;
- Cardinalidade: (M, N).

**Livro - Feitiço**

- Um livro ensina vários feitiços, e um feitiço pode estar em vários livros;
- Cardinalidade: (M, N).

**Feitiço - Habilidade**

- Um feitiço requer várias habilidades, e uma habilidade é necessária para vários feitiços;
- Cardinalidade: (M, N).