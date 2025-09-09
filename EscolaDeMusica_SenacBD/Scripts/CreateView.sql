

USE EscolaMusica;

--  Músicos com suas orquestras
CREATE VIEW vw_musicos_orquestras AS
SELECT m.idMusico, m.nome AS nomeMusico, o.nome AS nomeOrquestra, o.cidade, o.pais
FROM Musicos m
JOIN Orquestras o ON m.idOrquestra = o.idOrquestra;

--  Músicos e instrumentos que sabem tocar
CREATE VIEW vw_musicos_instrumentos AS
SELECT m.nome AS musico, i.nomeInstrumento
FROM Musicos m
JOIN Tocam t ON m.idMusico = t.idMusico
JOIN Instrumentos i ON t.idInstrumento = i.idInstrumento;

--  Sinfonias com orquestras que as executam
CREATE VIEW vw_sinfonias_orquestras AS
SELECT s.nome AS sinfonia, s.compositor, o.nome AS orquestra, o.cidade, o.pais
FROM Sinfonias s
JOIN Executam e ON s.idSinfonia = e.idSinfonia
JOIN Orquestras o ON e.idOrquestra = o.idOrquestra;

--  Músicos, suas funções e instrumentos em cada sinfonia
CREATE VIEW vw_atuacoes AS
SELECT m.nome AS musico, s.nome AS sinfonia, f.nomeFuncao, i.nomeInstrumento, a.dataInicio
FROM Atuam a
JOIN Musicos m ON a.idMusico = m.idMusico
JOIN Sinfonias s ON a.idSinfonia = s.idSinfonia
JOIN FuncoesDosMusicos f ON a.idFuncao = f.idFuncao
JOIN Instrumentos i ON a.idInstrumento = i.idInstrumento;

--  Quantidade de músicos por orquestra
CREATE VIEW vw_total_musicos_orquestra AS
SELECT o.nome AS orquestra, COUNT(m.idMusico) AS total_musicos
FROM Orquestras o
LEFT JOIN Musicos m ON m.idOrquestra = o.idOrquestra
GROUP BY o.idOrquestra;

--  Instrumentos mais utilizados nas sinfonias
CREATE VIEW vw_instrumentos_populares AS
SELECT i.nomeInstrumento, COUNT(a.idMusico) AS total_uso
FROM Atuam a
JOIN Instrumentos i ON a.idInstrumento = i.idInstrumento
GROUP BY i.idInstrumento
ORDER BY total_uso DESC;

--  Músicos que não participaram de nenhuma sinfonia
CREATE VIEW vw_musicos_sem_sinfonia AS
SELECT m.nome AS musico
FROM Musicos m
LEFT JOIN Atuam a ON m.idMusico = a.idMusico
WHERE a.idMusico IS NULL;

--  Sinfonias de um compositor específico
CREATE VIEW vw_sinfonias_compositor AS
SELECT s.nome AS sinfonia, s.compositor, s.dataComposicao
FROM Sinfonias s
WHERE s.compositor = 'Beethoven';

--  Músicos que desempenharam função de maestro
CREATE VIEW vw_maestros AS
SELECT m.nome AS musico, s.nome AS sinfonia, a.dataInicio
FROM Atuam a
JOIN Musicos m ON a.idMusico = m.idMusico
JOIN FuncoesDosMusicos f ON a.idFuncao = f.idFuncao
JOIN Sinfonias s ON a.idSinfonia = s.idSinfonia
WHERE f.nomeFuncao = 'maestro';

--  Orquestras com músicos que atuaram em mais de 2 sinfonias
CREATE VIEW vw_orquestras_ativos AS
SELECT DISTINCT o.nome AS orquestra
FROM Orquestras o
JOIN Musicos m ON o.idOrquestra = m.idOrquestra
JOIN Atuam a ON m.idMusico = a.idMusico
GROUP BY o.idOrquestra, m.idMusico
HAVING COUNT(a.idSinfonia) > 2;
