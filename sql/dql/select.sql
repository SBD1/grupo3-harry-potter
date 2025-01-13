-- listar todas as casas
SELECT * FROM Casa;

-- Buscar descrição de um mapa especifico 
SELECT descricaoMapa FROM Mapa WHERE nome = 'Hogwarts';

-- Listar regiões de um mapa especifico
SELECT nome, descricaoRegiao FROM Regiao WHERE idMapa = 1;

-- Listar todas as áreas de  uma região especifica

SELECT nome, areaNorte, areaSul, areaLeste, areaOeste FROM Area WHERE idRegiao = 1;

-- Listar todos os inimigos

SELECT P.nome
FROM Inimigo I
JOIN Personagem P ON I.idPersonagem = P.idPersonagem;

-- Listar todos os personagens e suas áreas

SELECT nome, idArea FROM Personagem;


