
-- casa
INSERT INTO Casa (idCasa, nomeCasa) 
VALUES 
(1, 'Grifinória'), 
(2, 'Sonserina'), 
(3, 'Corvinal'), 
(4, 'LufaLufa');

-- mapa 
INSERT INTO Mapa (idMapa, descricaoMapa, nome) 
VALUES 
(1, 'Hogwarts é uma escola de magia icônica localizada em um castelo imponente, escondido nas montanhas da Escócia. A escola é cercada por mistério e magia, com torres majestosas, escadarias que mudam de lugar, salões encantados e terrenos vastos.', 'Hogwarts'),
(2, 'O Beco Diagonal é uma rua mágica e movimentada localizada no coração de Londres. Ao entrar, o visitante é imediatamente imerso em um mundo de magia e encantamento. As lojas são espalhadas ao longo da rua, todas com fachadas encantadas e vitrines repletas de itens mágicos, como varinhas, poções, livros de feitiçaria e vestuários.', 'Beco Diagonal'),
(3, 'A estação de trem em Londres, se torna um local mágico e cheio de mistério quando os bruxos e bruxas se dirigem para Hogwarts. A plataforma 9 ¾ é o ponto de partida para a jornada para a escola de magia.', 'Estacao');  


-- regioes 
INSERT INTO Regiao (idMapa,idRegiao,nome,descricaoRegiao) 
VALUES 
(1,1,'Escola','escola de magia e bruxaria da Hogwarts'),
(1,2,'Exterior de Hogwarts','cercado por uma paisagem encantadora e cheia de mistérios.'),
(3,3,'Estacao 9 3/4','Estacao de trem secreta que leva para a escola de bruxaria de Hogwarts');

-- Area 
INSERT INTO Area (idArea, idRegiao, nome, areaNorte, areaSul, areaLeste, areaOeste) 
VALUES
(1, 1, 'Nada', 1, 1, 1, 1),
(2, 2, 'Portao de Hogwarts', 3, 4, 5, 6),
(4, 2, 'Patio exterior', 2, 1, 1, 1),
(5, 1, 'Salao Principal', 12, 11, 13, 2),
(6, 1, 'Clareira', 1, 6, 1, 1),
(7, 1, 'Torre leste', 5, 1, 22, 23),
(8, 1, 'Torre oeste', 1, 5, 20, 21),
(9, 1, 'Corredor', 14, 15, 16, 5),
(10, 1, 'Refeitorio', 1, 13, 1, 1),
(11, 1, 'Biblioteca', 13, 1, 1, 1),
(12, 1, 'Primeiro andar', 17, 18, 19, 13),
(13, 1, 'Sala de aula 1', 1, 16, 1, 1),
(14, 1, 'Sala de aula 2', 16, 1, 1, 1),
(15, 1, 'Sala de aula 3', 1, 1, 1, 16),
(16, 1, 'Dormitório: Grifinória', 1, 1, 1, 12),
(17, 1, 'Dormitório: Cornival', 1, 1, 12, 1),
(18, 1, 'Dormitório: Sonserina', 1, 1, 1, 11),
(19, 1, 'Dormitório: Lufa-lufa', 1, 1, 11, 1),
(20, 2, 'Floresta Negra', 2, 7, 14, 2),
(21, 2, 'Campo de Quadribol', 3, 6, 12, 3);


-- Personagem 
INSERT INTO Personagem (idPersonagem,idArea,vida,nivel,nome) 
VALUES                                                                         
(1,5,100,10,'Albus Dumbledore'), 
(2,13,100,10,'Severus Snape'), 
(3,2,100,10,'Minerva McGonagall'), 
(4,12,100,10,'Hermione Granger'),
(5,4,100,10,'Ron Weasley'),
(6,18,100,10,'Draco Malfoy'),
(7,20,100,2,'Lobo'),
(8,20,100,5,'Dementador'),
(9,10,100,10,'Neville Longbottom'), 
(10,14,100,10,'Fílio Flitwick'),                                                
(11,6,100,10,'Pomona Sprout');


-- Vantagens 
INSERT INTO Vantagem (idVantagem,nome,descricao) 
VALUES                                                                          
(1,'Resistencia a Feitiços',' O personagem tem uma resistência a feitiços, tornando-o menos vulnerável a maldições e encantamentos lançados contra ele.'),      
(2,'Afinidade com as Artes das Trevas','O personagem tem um entendimento profundo das Artes das Trevas e pode usá-las para manipular ou derrotar inimigos'),    
(3,'Defesa de Criaturas Mágicas','O personagem é especializado na defesa e proteção de criaturas mágicas, sendo capaz de acalmar ou conter até as mais perigosas delas sem se ferir');


-- NPC


INSERT INTO NPC (idPersonagem,falas)                             
VALUES                                                                          
(1,'Bem vindo à Hogwards'),                                                     
(2,'Saia do meu caminho!'),                                                     
(3,'Bem vindo à Hogwards'),                                                     
(10,'Para aprender um feitiço é preciso assistir as aulas!'),                   
(11,'Nessa floresta há sempre monstros a espreita cuidado!'),
(6,'Você realmente acha que é digno de estar no mesmo lugar que eu?'),          
(5,'Você sabe, quando eu pensei que minha vida na escola de magia poderia ficar mais estranha, eu não imaginava que estaríamos lutando contra dragões e... bom, enfrentando coisas ainda mais bizarras. Só mais um dia com os amigos, né?'),    
(4,'Vocês sabem, não é apenas sobre ser corajoso. A verdadeira chave é usar a inteligência para resolver os problemas. Se pararmos para pensar e estudar as coisas com atenção, não há nada que não possamos enfrentar.'),
(7,'huuuu'), 
(8,'haaa'), 
(9,'Eu sei que nunca fui o mais forte ou o mais esperto, mas aprendi que a verdadeira coragem não é não ter medo... é enfrentá-lo, mesmo quando tudo dentro de você diz para correr.'); 

-- Professor
INSERT INTO Professor (idPersonagem,idCasa,disciplina)
VALUES                                                                          
(1,1,'Defesa Contra as Artes das Trevas'),                                    
(2,2,'Poções'),                                                               
(3,1,'Transfiguração'),                                                       
(10,4,'Feitiços'),                                                            
(11,3,'Herbologia');


-- Alunos 
INSERT INTO Aluno (idPersonagem,idCasa,idVantagem)               
VALUES                                                                          
(6,2,2),                                                                        
(5,1,3),                                                                        
(4,1,1);

-- ProfessorCordenaCasa
INSERT INTO ProfessorCoordenaCasa (idCasa,idProfessor)           
VALUES                                                                          
(2,2),                                                                          
(1,3),                                                                          
(4,10),                                                                         
(3,11);

-- AlunosPorCasa
INSERT INTO AlunoPorCasa (idAluno,idCasa)                        
VALUES                                                                          
(6,2),                                                                          
(5,1),                                                                          
(4,1);

--PersonagemPossuiVantagem 
INSERT INTO PersonagemPossuiVantagem (idPersonagem,idVantagem)   
VALUES                                                                          
(1,1),                                                                          
(2,1),                                                                          
(11,3);


--Inimigo
INSERT INTO Inimigo (idPersonagem)                               
VALUES                                                                          
(7), 
(8);








