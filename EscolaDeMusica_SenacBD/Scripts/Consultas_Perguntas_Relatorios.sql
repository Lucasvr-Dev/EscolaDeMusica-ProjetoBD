-- Lista de músicos com a orquestra que pertencem

SELECT m.nome AS musico, o.nome AS orquestra, o.cidade, o.pais
FROM Musicos m
JOIN Orquestras o ON m.idOrquestra = o.idOrquestra;

-- Lista de músicos e instrumentos que sabem tocar

SELECT m.nome AS musico, i.nomeInstrumento
FROM Musicos m
JOIN Tocam t ON m.idMusico = t.idMusico
JOIN Instrumentos i ON t.idInstrumento = i.idInstrumento;

-- Lista de sinfonias e orquestras que as executam

SELECT s.nome AS sinfonia, o.nome AS orquestra, s.compositor
FROM Sinfonias s
JOIN Executam e ON s.idSinfonia = e.idSinfonia
JOIN Orquestras o ON e.idOrquestra = o.idOrquestra;

-- Lista de músicos atuando em sinfonias, com função e instrumento

SELECT m.nome AS musico, s.nome AS sinfonia, f.nomeFuncao, i.nomeInstrumento
FROM Atuam a
JOIN Musicos m ON a.idMusico = m.idMusico
JOIN Sinfonias s ON a.idSinfonia = s.idSinfonia
JOIN FuncoesDosMusicos f ON a.idFuncao = f.idFuncao
JOIN Instrumentos i ON a.idInstrumento = i.idInstrumento;

-- Contagem de músicos por orquestra

SELECT o.nome AS orquestra, COUNT(m.idMusico) AS total_musicos
FROM Orquestras o
LEFT JOIN Musicos m ON m.idOrquestra = o.idOrquestra
GROUP BY o.idOrquestra;


-- Músicos que tocam mais de um instrumento

SELECT m.nome, COUNT(t.idInstrumento) AS total_instrumentos
FROM Musicos m
JOIN Tocam t ON m.idMusico = t.idMusico
GROUP BY m.idMusico
HAVING COUNT(t.idInstrumento) > 1;


-- Sinfonias compostas por Beethoven

SELECT nome, dataComposicao
FROM Sinfonias
WHERE compositor = 'Beethoven';


-- Funções desempenhadas por um músico específico (id = 1)

SELECT s.nome AS sinfonia, f.nomeFuncao, i.nomeInstrumento
FROM Atuam a
JOIN Sinfonias s ON a.idSinfonia = s.idSinfonia
JOIN FuncoesDosMusicos f ON a.idFuncao = f.idFuncao
JOIN Instrumentos i ON a.idInstrumento = i.idInstrumento
WHERE a.idMusico = 1;


-- Músicos que tocaram em mais de 3 sinfonias

SELECT m.nome, COUNT(a.idSinfonia) AS total_sinfonias
FROM Atuam a
JOIN Musicos m ON a.idMusico = m.idMusico
GROUP BY m.idMusico
HAVING COUNT(a.idSinfonia) > 3;


-- Sinfonias executadas por mais de uma orquestra

SELECT s.nome, COUNT(e.idOrquestra) AS total_orquestras
FROM Sinfonias s
JOIN Executam e ON s.idSinfonia = e.idSinfonia
GROUP BY s.idSinfonia
HAVING COUNT(e.idOrquestra) > 1;


-- Lista de músicos e funções em uma determinada orquestra (id = 1)

SELECT m.nome AS musico, f.nomeFuncao, s.nome AS sinfonia
FROM Musicos m
JOIN Atuam a ON m.idMusico = a.idMusico
JOIN FuncoesDosMusicos f ON a.idFuncao = f.idFuncao
JOIN Sinfonias s ON a.idSinfonia = s.idSinfonia
WHERE m.idOrquestra = 1;


-- Instrumentos mais usados nas sinfonias

SELECT i.nomeInstrumento, COUNT(a.idMusico) AS total_uso
FROM Atuam a
JOIN Instrumentos i ON a.idInstrumento = i.idInstrumento
GROUP BY i.idInstrumento
ORDER BY total_uso DESC;


-- Músicos que não participaram de nenhuma sinfonia

SELECT m.nome
FROM Musicos m
LEFT JOIN Atuam a ON m.idMusico = a.idMusico
WHERE a.idMusico IS NULL;


-- Sinfonias de um compositor específico (subquery)

SELECT nome
FROM Sinfonias
WHERE idSinfonia IN (
    SELECT idSinfonia FROM Atuam WHERE idFuncao = 1
);


-- Orquestras que não executaram nenhuma sinfonia

SELECT o.nome
FROM Orquestras o
LEFT JOIN Executam e ON o.idOrquestra = e.idOrquestra
WHERE e.idOrquestra IS NULL;


-- Quantidade de músicos por instrumento

SELECT i.nomeInstrumento, COUNT(t.idMusico) AS total_musicos
FROM Instrumentos i
LEFT JOIN Tocam t ON i.idInstrumento = t.idInstrumento
GROUP BY i.idInstrumento;


-- Sinfonias de um determinado ano (ex: 1800)

SELECT nome, compositor FROM Sinfonias
WHERE YEAR(dataComposicao) = 1800;


-- Lista de músicos com função de maestro

SELECT m.nome, s.nome AS sinfonia
FROM Atuam a
JOIN Musicos m ON a.idMusico = m.idMusico
JOIN FuncoesDosMusicos f ON a.idFuncao = f.idFuncao
JOIN Sinfonias s ON a.idSinfonia = s.idSinfonia
WHERE f.nomeFuncao = 'maestro';


-- Subselect: músicos que tocaram instrumento específico (ex: piano)

SELECT nome
FROM Musicos
WHERE idMusico IN (
    SELECT idMusico FROM Tocam WHERE idInstrumento = 13
);


-- Orquestras com músicos que atuaram em mais de 2 sinfonias

SELECT DISTINCT o.nome AS orquestra
FROM Orquestras o
JOIN Musicos m ON o.idOrquestra = m.idOrquestra
JOIN Atuam a ON m.idMusico = a.idMusico
GROUP BY o.idOrquestra, m.idMusico
HAVING COUNT(a.idSinfonia) > 2;



--

