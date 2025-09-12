-- ====================================
-- SCRIPTS DE UPDATE/DELETE (DML) 
-- ====================================

USE EscolaDeMusica;

-- UPDATEs 
UPDATE Artistas SET salario = 5500.00 WHERE idMusico = 1;
UPDATE Artistas SET salario = 4800.00 WHERE idMusico = 2;
UPDATE Artistas SET salario = 5200.00 WHERE idMusico = 3;
UPDATE Artistas SET status = 'licenca' WHERE idMusico = 4;
UPDATE Artistas SET telefone = '(81) 98888-1234' WHERE idMusico = 1;
UPDATE Artistas SET telefone = '(11) 97777-5678' WHERE idMusico = 2;
UPDATE Artistas SET endereco = 'Rua Nova, 999' WHERE idMusico = 5;
UPDATE Artistas SET endereco = 'Av. Principal, 123' WHERE idMusico = 6;

UPDATE Orquestras SET status = 'suspenso' WHERE idOrquestra = 19;
UPDATE Orquestras SET telefone = '(81) 3421-8888' WHERE idOrquestra = 1;
UPDATE Orquestras SET email = 'novo@email.com' WHERE idOrquestra = 2;
UPDATE Orquestras SET status = 'ativa' WHERE idOrquestra = 3;

UPDATE Sinfonias SET dificuldade = 'muito_alta' WHERE idSinfonia = 6;
UPDATE Sinfonias SET generoMusical = 'Clássico Tardio' WHERE idSinfonia = 1;
UPDATE Sinfonias SET duracao = '00:35:00' WHERE idSinfonia = 2;
UPDATE Sinfonias SET dificuldade = 'alta' WHERE idSinfonia = 3;

UPDATE Instrumentos SET preco = 2800.00 WHERE idInstrumento = 1;
UPDATE Instrumentos SET categoria = 'Sopros de Madeira' WHERE idInstrumento = 1;
UPDATE Instrumentos SET categoria = 'Sopros de Madeira' WHERE idInstrumento = 2;
UPDATE Instrumentos SET preco = 3200.00 WHERE idInstrumento = 3;

UPDATE FuncoesDosMusicos SET salarioBase = 16000.00 WHERE idFuncao = 1;
UPDATE FuncoesDosMusicos SET salarioBase = 4800.00 WHERE idFuncao = 2;
UPDATE FuncoesDosMusicos SET salarioBase = 5200.00 WHERE idFuncao = 3;

UPDATE Executam SET numeroApresentacoes = 6 WHERE idSinfonia = 1 AND idOrquestra = 1;
UPDATE Executam SET numeroApresentacoes = 4 WHERE idSinfonia = 2 AND idOrquestra = 2;
UPDATE Executam SET dataEstreia = '2023-02-01' WHERE idSinfonia = 1 AND idOrquestra = 2;

UPDATE Tocam SET nivelProficiencia = 'expert' WHERE idMusico = 1 AND idInstrumento = 4;
UPDATE Tocam SET nivelProficiencia = 'expert' WHERE idMusico = 5 AND idInstrumento = 7;
UPDATE Tocam SET nivelProficiencia = 'expert' WHERE idMusico = 8 AND idInstrumento = 12;

UPDATE Atuam SET avaliacaoDesempenho = 'excelente' WHERE idMusico = 1 AND idSinfonia = 1 AND idFuncao = 3;
UPDATE Atuam SET avaliacaoDesempenho = 'otimo' WHERE idMusico = 2 AND idSinfonia = 1 AND idFuncao = 3;

UPDATE Desempenham SET observacoes = 'Músico destacado' WHERE idMusico = 10 AND idFuncao = 1;
UPDATE Desempenham SET observacoes = 'Primeira violino' WHERE idMusico = 1 AND idFuncao = 3;

-- DELETEs 
DELETE FROM Tocam WHERE idMusico = 10 AND idInstrumento = 3;
DELETE FROM Tocam WHERE idMusico = 9 AND idInstrumento = 8;

DELETE FROM Atuam WHERE idMusico = 10 AND idSinfonia = 10 AND idFuncao = 1;

DELETE FROM Executam WHERE idSinfonia = 10 AND idOrquestra = 1;

DELETE FROM Desempenham WHERE idMusico = 1 AND idFuncao = 12;