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

-- Sinfonias por compositor com informações das orquestras que as executam
SELECT 
    s.compositor,
    COUNT(DISTINCT s.idSinfonia) as total_sinfonias,
    COUNT(DISTINCT e.idOrquestra) as total_orquestras_executoras,
    GROUP_CONCAT(DISTINCT s.nome ORDER BY s.nome SEPARATOR ', ') as sinfonias,
    GROUP_CONCAT(DISTINCT o.nome ORDER BY o.nome SEPARATOR ', ') as orquestras_executoras,
    GROUP_CONCAT(DISTINCT o.cidade ORDER BY o.cidade SEPARATOR ', ') as cidades_apresentacao
FROM Sinfonias s
LEFT JOIN Executam e ON s.idSinfonia = e.idSinfonia
LEFT JOIN Orquestras o ON e.idOrquestra = o.idOrquestra
GROUP BY s.compositor
ORDER BY total_sinfonias DESC, s.compositor;

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
