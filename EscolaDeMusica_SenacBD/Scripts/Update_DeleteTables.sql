-- ====================================
-- SCRIPTS DE UPDATE/DELETE (DML) 
-- ====================================

USE EscolaDeMusica;

-- UPDATEs 
UPDATE Musicos SET salario = 5500.00 WHERE idMusicos = 1;
UPDATE Musicos SET salario = 4800.00 WHERE idMusicos = 2;
UPDATE Musicos SET salario = 5200.00 WHERE idMusicos = 3;
UPDATE Musicos SET status = 'licenca' WHERE idMusicos = 4;
UPDATE Musicos SET telefone = '(81) 98888-1234' WHERE idMusicos = 1;
UPDATE Musicos SET telefone = '(11) 97777-5678' WHERE idMusicos = 2;
UPDATE Musicos SET endereco = 'Rua Nova, 999' WHERE idMusicos = 5;
UPDATE Musicos SET endereco = 'Av. Principal, 123' WHERE idMusicos = 6;

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

UPDATE Tocam SET nivelProficiencia = 'expert' WHERE idMusicos = 1 AND idInstrumento = 4;
UPDATE Tocam SET nivelProficiencia = 'expert' WHERE idMusicos = 5 AND idInstrumento = 7;
UPDATE Tocam SET nivelProficiencia = 'expert' WHERE idMusicos = 8 AND idInstrumento = 12;

-- Atualizando avaliações de desempenho na tabela Atuam
UPDATE Atuam SET avaliacaoDesempenho = 'excelente' WHERE idMusicos = 1 AND idSinfonia = 1 AND idFuncao = 5;   -- Violino - Violinista
UPDATE Atuam SET avaliacaoDesempenho = 'otimo' WHERE idMusicos = 2 AND idSinfonia = 1 AND idFuncao = 6;       -- Viola - Violista
UPDATE Atuam SET avaliacaoDesempenho = 'bom' WHERE idMusicos = 3 AND idSinfonia = 2 AND idFuncao = 7;         -- Violoncelo - Violoncelista
UPDATE Atuam SET avaliacaoDesempenho = 'regular' WHERE idMusicos = 4 AND idSinfonia = 2 AND idFuncao = 8;     -- Contrabaixo - Contrabaixista
UPDATE Atuam SET avaliacaoDesempenho = 'excelente' WHERE idMusicos = 5 AND idSinfonia = 3 AND idFuncao = 2;    -- Flauta - Flautista
UPDATE Atuam SET avaliacaoDesempenho = 'bom' WHERE idMusicos = 6 AND idSinfonia = 3 AND idFuncao = 3;         -- Oboé - Oboísta
UPDATE Atuam SET avaliacaoDesempenho = 'otimo' WHERE idMusicos = 7 AND idSinfonia = 4 AND idFuncao = 4;       -- Clarinete - Clarinetista
UPDATE Atuam SET avaliacaoDesempenho = 'ruim' WHERE idMusicos = 8 AND idSinfonia = 4 AND idFuncao = 9;        -- Trompa - Trompista
UPDATE Atuam SET avaliacaoDesempenho = 'excelente' WHERE idMusicos = 9 AND idSinfonia = 5 AND idFuncao = 10;   -- Trompete - Trompetista
UPDATE Atuam SET avaliacaoDesempenho = 'bom' WHERE idMusicos = 10 AND idSinfonia = 5 AND idFuncao = 11;       -- Trombone - Trombonista
UPDATE Atuam SET avaliacaoDesempenho = 'otimo' WHERE idMusicos = 11 AND idSinfonia = 6 AND idFuncao = 12;      -- Tuba - Tubista
UPDATE Atuam SET avaliacaoDesempenho = 'excelente' WHERE idMusicos = 12 AND idSinfonia = 6 AND idFuncao = 13;  -- Harpa - Harpaista
UPDATE Atuam SET avaliacaoDesempenho = 'bom' WHERE idMusicos = 13 AND idSinfonia = 7 AND idFuncao = 14;       -- Piano - Pianista
UPDATE Atuam SET avaliacaoDesempenho = 'otimo' WHERE idMusicos = 14 AND idSinfonia = 7 AND idFuncao = 15;      -- Saxofone - Saxofonista
UPDATE Atuam SET avaliacaoDesempenho = 'excelente' WHERE idMusicos = 15 AND idSinfonia = 8 AND idFuncao = 16;  -- Guitarra - Guitarrista
UPDATE Atuam SET avaliacaoDesempenho = 'bom' WHERE idMusicos = 16 AND idSinfonia = 8 AND idFuncao = 17;       -- Bateria - Baterista
UPDATE Atuam SET avaliacaoDesempenho = 'otimo' WHERE idMusicos = 17 AND idSinfonia = 9 AND idFuncao = 18;      -- Teclado - Tecladista
UPDATE Atuam SET avaliacaoDesempenho = 'regular' WHERE idMusicos = 18 AND idSinfonia = 9 AND idFuncao = 19;    -- Fagote - Fagotista
UPDATE Atuam SET avaliacaoDesempenho = 'excelente' WHERE idMusicos = 19 AND idSinfonia = 10 AND idFuncao = 20; -- Cavaquinho - Cavaquinista
UPDATE Atuam SET avaliacaoDesempenho = 'bom' WHERE idMusicos = 20 AND idSinfonia = 10 AND idFuncao = 21;      -- Bandolim - Bandolinista

UPDATE Desempenham SET observacoes = 'Músico destacado' WHERE idMusicos = 10 AND idFuncao = 1;
UPDATE Desempenham SET observacoes = 'Primeira violino' WHERE idMusicos = 1 AND idFuncao = 3;

-- DELETEs 
-- DELETE FROM Tocam WHERE idMusicos = 10 AND idInstrumento = 3;
-- DELETE FROM Tocam WHERE idMusicos = 9 AND idInstrumento = 8;
-- DELETE FROM Atuam WHERE idMusicos = 10 AND idSinfonia = 10 AND idFuncao = 1;
-- DELETE FROM Executam WHERE idSinfonia = 10 AND idOrquestra = 1;
-- DELETE FROM Desempenham WHERE idMusicos = 1 AND idFuncao = 12;