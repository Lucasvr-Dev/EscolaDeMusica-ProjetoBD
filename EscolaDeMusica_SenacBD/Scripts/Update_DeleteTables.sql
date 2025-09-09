
UPDATE Musicos SET nome = 'João Silva Neto' WHERE idMusico = 1;

UPDATE Orquestras SET cidade = 'Recife Antigo' WHERE idOrquestra = 1;

UPDATE Tocam SET idInstrumento = 14 WHERE idMusico = 3; -- muda para piano

UPDATE Atuam SET idFuncao = 15 WHERE idMusico = 5 AND idSinfonia = 5;

UPDATE Atuam SET dataInicio = '2023-02-01' WHERE idMusico = 2 AND idSinfonia = 2;

UPDATE Sinfonias SET compositor = 'Johann Sebastian Bach' WHERE idSinfonia = 3;

UPDATE Atuam SET idInstrumento = 16 WHERE idMusico = 7 AND idSinfonia = 7;

UPDATE Orquestras SET nome = 'Orquestra Sinfônica Recife Centro' WHERE idOrquestra = 1;

UPDATE Musicos SET nacionalidade = 'Portugal' WHERE idMusico = 4;

UPDATE FuncoesDosMusicos SET nomeFuncao = 'Maestro Assistente' WHERE idFuncao = 1;

DELETE FROM Musicos WHERE idMusico = 20;

DELETE FROM Atuam WHERE idMusico = 19 AND idSinfonia = 19;

DELETE FROM Instrumentos WHERE idInstrumento = 20;

DELETE FROM Orquestras WHERE idOrquestra = 10;

DELETE FROM FuncoesDosMusicos WHERE idFuncao = 20;

DELETE FROM Sinfonias WHERE idSinfonia = 20;

UPDATE Sinfonias SET dataComposicao = '1825-06-15' WHERE idSinfonia = 5;

UPDATE Tocam SET idInstrumento = 12 WHERE idMusico = 6;

DELETE FROM Atuam WHERE idMusico = 8;

DELETE FROM Atuam WHERE idSinfonia = 4;
