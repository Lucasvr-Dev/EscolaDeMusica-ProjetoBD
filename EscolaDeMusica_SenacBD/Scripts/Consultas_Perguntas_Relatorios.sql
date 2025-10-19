-- ========================================
-- CONSULTAS ÚTEIS
-- ========================================

USE EscolaDeMusica;


-- Artistas que tocam mais de um instrumento
SELECT m.nome AS Nome, COUNT(t.idInstrumento) AS "Total Instrumentos",
       GROUP_CONCAT(i.nomeInstrumento) AS Instrumentos
FROM Musicos m
JOIN Tocam t ON m.idMusicos = t.idMusicos
JOIN Instrumentos i ON t.idInstrumento = i.idInstrumento
GROUP BY m.idMusicos, m.nome;


-- Sinfonias por compositor
SELECT compositor AS Compositor, COUNT(*) as "Total Sinfonias",
       GROUP_CONCAT(nome) as Sinfonias
FROM Sinfonias 
GROUP BY Compositor;


-- Instrumentos mais utilizados
SELECT i.nomeInstrumento, COUNT(at.idMusicos) AS total_uso
FROM Instrumentos i
JOIN Atuam at ON i.idInstrumento = at.idInstrumento
GROUP BY i.idInstrumento, i.nomeInstrumento
ORDER BY total_uso DESC;

-- Artistas sem atuações em sinfonias
SELECT  m.nome AS Nome, 
		m.email AS Email, 
		o.nome as Orquestra
FROM Musicos m
LEFT JOIN Atuam at ON m.idMusicos = at.idMusicos
LEFT JOIN Orquestras o ON m.idOrquestra = o.idOrquestra;


-- Maestros e suas sinfonias
SELECT m.nome AS Maestro, 
	s.nome AS Sinfonia, 
	s.compositor AS Compositor, 
	DATE_FORMAT(at.DataInicio, '%d/%m/%Y') AS DataInicio
FROM Atuam at
JOIN Musicos m ON at.idMusicos = m.idMusicos
JOIN Sinfonias s ON at.idSinfonia = s.idSinfonia
JOIN FuncoesDosMusicos f ON at.idFuncao = f.idFuncao
WHERE f.nomeFuncao = 'maestro'
ORDER BY DataInicio;


-- Artistas com sua função e instrumento principal
SELECT 
	CONCAT(m.nome, ' (', f.nomeFuncao, ')') AS 'Artista e Função',
	i.nomeInstrumento AS 'Instrumento Principal',
	DATE_FORMAT(d.dataAssumiu, '%d/%m/%Y') AS 'Data Posse'
FROM Desempenham d
	JOIN Musicos m ON m.idMusicos = d.idMusicos
	JOIN FuncoesDosMusicos f ON f.idFuncao = d.idFuncao
	JOIN Atuam atu ON atu.idMusicos = m.idMusicos
	JOIN Instrumentos i ON i.idInstrumento = atu.idInstrumento
ORDER BY m.nome;


-- Músicos por orquestra com total de sinfonias executadas
SELECT 
    o.nome AS Orquestra,
    m.nome AS Musico,
    COUNT(DISTINCT e.idSinfonia) AS TotalSinfonias,
    GROUP_CONCAT(DISTINCT s.nome ORDER BY s.dataComposicao) AS Sinfonias
FROM Musicos m
JOIN Orquestras o ON m.idOrquestra = o.idOrquestra
LEFT JOIN Executam e ON o.idOrquestra = e.idOrquestra
LEFT JOIN Sinfonias s ON e.idSinfonia = s.idSinfonia
GROUP BY o.idOrquestra, m.idMusicos
ORDER BY o.nome, m.nome;


-- Músicos com avaliação máxima por sinfonia

SELECT 
    m.nome AS Músico,
    s.nome AS Sinfonia,
    f.nomeFuncao AS Função,
    atu.avaliacaoDesempenho AS Avaliação
FROM Atuam atu
JOIN Musicos m ON atu.idMusicos = m.idMusicos
JOIN Sinfonias s ON atu.idSinfonia = s.idSinfonia
JOIN FuncoesDosMusicos f ON atu.idFuncao = f.idFuncao
WHERE atu.avaliacaoDesempenho = 'excelente'
ORDER BY s.nome, m.nome;


-- Orquestras com maior diversidade de músicos e funções

SELECT 
    o.nome AS Orquestra,
    COUNT(DISTINCT m.idMusicos) AS TotalMusicos,
    COUNT(DISTINCT d.idFuncao) AS TotalFuncoes
FROM Orquestras o
LEFT JOIN Musicos m ON m.idOrquestra = o.idOrquestra
LEFT JOIN Desempenham d ON m.idMusicos = d.idMusicos
GROUP BY o.idOrquestra
ORDER BY TotalFuncoes DESC, TotalMusicos DESC;


-- Compositores cujas sinfonias são mais executadas

SELECT 
    s.compositor AS Compositor,
    COUNT(e.idOrquestra) AS TotalExecucoes,
    GROUP_CONCAT(DISTINCT s.nome ORDER BY s.nome) AS Sinfonias
FROM Sinfonias s
LEFT JOIN Executam e ON s.idSinfonia = e.idSinfonia
GROUP BY s.compositor
ORDER BY TotalExecucoes DESC;


-- Músicos que já mudaram de orquestra

SELECT 
    m.nome,
    COUNT(DISTINCT m.idOrquestra) AS TotalOrquestras,
    GROUP_CONCAT(DISTINCT o.nome ORDER BY o.nome) AS Orquestras
FROM Musicos m
JOIN Orquestras o ON m.idOrquestra = o.idOrquestra
GROUP BY m.idMusicos
HAVING TotalOrquestras > 1;


-- Sinfonias mais complexas e média de avaliação dos músicos

SELECT 
    s.nome AS Sinfonia,
    s.dificuldade AS Dificuldade,
    FORMAT(AVG(
        CASE atu.avaliacaoDesempenho
            WHEN 'ruim' THEN 1
            WHEN 'regular' THEN 2
            WHEN 'bom' THEN 3
            WHEN 'otimo' THEN 4
            WHEN 'excelente' THEN 5
        END
    ),2) AS MediaAvaliacao
FROM Sinfonias s
JOIN Atuam atu ON s.idSinfonia = atu.idSinfonia
GROUP BY s.idSinfonia
ORDER BY MediaAvaliacao DESC;


-- Orquestras com média salarial dos músicos

SELECT o.nome AS Orquestra, COUNT(m.idMusicos) AS "Total Músicos", 
       CONCAT("R$ ",FORMAT(AVG(m.salario), 2,'de_DE')) AS MediaSalarial
FROM Orquestras o
JOIN Musicos m ON o.idOrquestra = m.idOrquestra
GROUP BY o.idOrquestra, o.nome
ORDER BY MediaSalarial DESC;


-- Sinfonias por dificuldade e número de apresentações

SELECT s.nome AS Sinfonia,S.compositor AS Compositor, s.dificuldade AS Dificuldade, COUNT(e.idOrquestra) AS "Total Orquestras",
       SUM(e.numeroApresentacoes) AS TotalApresentacoes
FROM Sinfonias s
LEFT JOIN Executam e ON s.idSinfonia = e.idSinfonia
GROUP BY s.idSinfonia, s.nome, s.dificuldade
ORDER BY TotalApresentacoes DESC, FIELD(s.dificuldade, 'muito_alta','alta','media','baixa');





