-- ========================================
-- CONSULTAS ÚTEIS
-- ========================================

USE EscolaDeMusica;

-- Artistas que tocam mais de um instrumento
SELECT a.nome, COUNT(t.idInstrumento) AS total_instrumentos,
       GROUP_CONCAT(i.nomeInstrumento) AS instrumentos
FROM Artistas a
JOIN Tocam t ON a.idMusico = t.idMusico
JOIN Instrumentos i ON t.idInstrumento = i.idInstrumento
GROUP BY a.idMusico, a.nome;


-- Sinfonias por compositor
SELECT compositor, COUNT(*) as total_sinfonias,
       GROUP_CONCAT(nome) as sinfonias
FROM Sinfonias 
GROUP BY compositor;

-- Instrumentos mais utilizados
SELECT i.nomeInstrumento, COUNT(at.idMusico) AS total_uso
FROM Instrumentos i
JOIN Atuam at ON i.idInstrumento = at.idInstrumento
GROUP BY i.idInstrumento, i.nomeInstrumento
ORDER BY total_uso DESC;

-- Artistas sem atuações em sinfonias
SELECT a.nome, a.email, o.nome as orquestra
FROM Artistas a
LEFT JOIN Atuam at ON a.idMusico = at.idMusico
LEFT JOIN Orquestras o ON a.idOrquestra = o.idOrquestra;


-- Maestros e suas sinfonias
SELECT a.nome AS maestro, s.nome AS sinfonia, s.compositor, at.dataInicio
FROM Atuam at
JOIN Artistas a ON at.idMusico = a.idMusico
JOIN Sinfonias s ON at.idSinfonia = s.idSinfonia
JOIN FuncoesDosMusicos f ON at.idFuncao = f.idFuncao
WHERE f.nomeFuncao = 'maestro'
ORDER BY at.dataInicio;