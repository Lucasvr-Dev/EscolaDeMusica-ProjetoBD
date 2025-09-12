-- ========================================
-- CRIAÇÃO DE VIEWS
-- ========================================

-- View: Artistas com suas orquestras
CREATE VIEW vw_artistas_orquestras AS
SELECT a.idMusico, a.nome AS nomeArtista, a.email, 
       o.nome AS nomeOrquestra, o.cidade, o.pais
FROM Artistas a
LEFT JOIN Orquestras o ON a.idOrquestra = o.idOrquestra;

-- View: Artistas e instrumentos que sabem tocar
CREATE VIEW vw_artistas_instrumentos AS
SELECT a.nome AS artista, i.nomeInstrumento
FROM Artistas a
JOIN Tocam t ON a.idMusico = t.idMusico
JOIN Instrumentos i ON t.idInstrumento = i.idInstrumento;

-- View: Sinfonias com orquestras que as executam
CREATE VIEW vw_sinfonias_orquestras AS
SELECT s.nome AS sinfonia, s.compositor, s.generoMusical,
       o.nome AS orquestra, o.cidade, o.pais
FROM Sinfonias s
JOIN Executam e ON s.idSinfonia = e.idSinfonia
JOIN Orquestras o ON e.idOrquestra = o.idOrquestra;

-- View: Atuações completas (artista, sinfonia, função, instrumento)
CREATE VIEW vw_atuacoes_completas AS
SELECT a.nome AS artista, s.nome AS sinfonia, s.compositor,
       f.nomeFuncao, i.nomeInstrumento, at.dataInicio,
       o.nome AS orquestra
FROM Atuam at
JOIN Artistas a ON at.idMusico = a.idMusico
JOIN Sinfonias s ON at.idSinfonia = s.idSinfonia
JOIN FuncoesDosMusicos f ON at.idFuncao = f.idFuncao
JOIN Instrumentos i ON at.idInstrumento = i.idInstrumento
JOIN Orquestras o ON a.idOrquestra = o.idOrquestra;

-- View: Estatísticas por orquestra
CREATE VIEW vw_estatisticas_orquestra AS
SELECT o.nome AS orquestra, 
       COUNT(DISTINCT a.idMusico) AS total_artistas,
       COUNT(DISTINCT e.idSinfonia) AS total_sinfonias,
       o.cidade, o.pais
FROM Orquestras o
LEFT JOIN Artistas a ON o.idOrquestra = a.idOrquestra
LEFT JOIN Executam e ON o.idOrquestra = e.idOrquestra
GROUP BY o.idOrquestra;

-- Artistas por faixa salarial
CREATE VIEW vw_artistas_faixa_salarial AS
SELECT 
    CASE 
        WHEN salario < 4000 THEN 'Baixo'
        WHEN salario BETWEEN 4000 AND 6000 THEN 'Médio'
        WHEN salario > 6000 THEN 'Alto'
        ELSE 'Não informado'
    END AS faixa_salarial,
    COUNT(*) as quantidade_artistas,
    AVG(salario) as salario_medio
FROM Artistas 
WHERE salario IS NOT NULL
GROUP BY faixa_salarial;

-- Instrumentos por categoria e preço
CREATE VIEW vw_instrumentos_categoria_preco AS
SELECT categoria, 
       COUNT(*) as total_instrumentos,
       AVG(preco) as preco_medio,
       MIN(preco) as preco_minimo,
       MAX(preco) as preco_maximo
FROM Instrumentos 
WHERE categoria IS NOT NULL
GROUP BY categoria;

-- Sinfonias por dificuldade
CREATE VIEW vw_sinfonias_dificuldade AS
SELECT dificuldade,
       COUNT(*) as total_sinfonias,
       AVG(TIME_TO_SEC(duracao)/60) as duracao_media_minutos
FROM Sinfonias 
WHERE dificuldade IS NOT NULL
GROUP BY dificuldade
ORDER BY 
    CASE dificuldade 
        WHEN 'baixa' THEN 1
        WHEN 'media' THEN 2  
        WHEN 'alta' THEN 3
        WHEN 'muito_alta' THEN 4
    END;

-- Orquestras por status e região
CREATE VIEW vw_orquestras_status_regiao AS
SELECT status, 
       CASE 
           WHEN cidade IN ('São Paulo', 'Campinas') THEN 'Sudeste-SP'
           WHEN cidade IN ('Rio de Janeiro') THEN 'Sudeste-RJ'
           WHEN cidade IN ('Belo Horizonte') THEN 'Sudeste-MG'
           WHEN cidade IN ('Porto Alegre', 'Florianópolis', 'Curitiba') THEN 'Sul'
           WHEN cidade IN ('Salvador', 'Recife', 'Fortaleza', 'Natal', 'Maceió') THEN 'Nordeste'
           WHEN cidade IN ('Brasília', 'Goiânia') THEN 'Centro-Oeste'
           WHEN cidade IN ('Manaus') THEN 'Norte'
           ELSE 'Outras'
       END AS regiao,
       COUNT(*) as total_orquestras
FROM Orquestras 
GROUP BY status, regiao;

-- Performance dos artistas
CREATE VIEW vw_performance_artistas AS
SELECT a.nome as artista,
       COUNT(DISTINCT at.idSinfonia) as total_sinfonias,
       COUNT(DISTINCT t.idInstrumento) as total_instrumentos,
       COUNT(DISTINCT d.idFuncao) as total_funcoes,
       a.salario,
       o.nome as orquestra
FROM Artistas a
LEFT JOIN Atuam at ON a.idMusico = at.idMusico
LEFT JOIN Tocam t ON a.idMusico = t.idMusico
LEFT JOIN Desempenham d ON a.idMusico = d.idMusico
LEFT JOIN Orquestras o ON a.idOrquestra = o.idOrquestra
GROUP BY a.idMusico;

