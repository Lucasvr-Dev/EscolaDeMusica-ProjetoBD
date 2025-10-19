-- ========================================
-- CRIAÇÃO DE VIEWS
-- ========================================

-- View: Artistas com suas orquestras
CREATE VIEW vw_musicos_orquestras AS
SELECT m.idMusicos, m.nome AS "Nome Musicos", m.email AS Email, 
       o.nome AS nomeOrquestra, o.cidade, o.pais
FROM Musicos m
LEFT JOIN Orquestras o ON m.idOrquestra = o.idOrquestra;

-- View: Músicos e instrumentos que sabem tocar
CREATE VIEW vw_musicos_instrumentos AS
SELECT m.nome AS Musicos, i.nomeInstrumento AS "Nome Instrumento"
FROM Musicos m
JOIN Tocam t ON m.idMusicos = t.idMusicos
JOIN Instrumentos i ON t.idInstrumento = i.idInstrumento;

-- View: Sinfonias com orquestras que as executam
CREATE VIEW vw_sinfonias_orquestras AS
SELECT s.nome AS sinfonia, s.compositor, s.generoMusical,
       o.nome AS orquestra, o.cidade, o.pais
FROM Sinfonias s
JOIN Executam e ON s.idSinfonia = e.idSinfonia
JOIN Orquestras o ON e.idOrquestra = o.idOrquestra;

-- View: Atuações completas (músicos, sinfonia, função, instrumento)
CREATE VIEW vw_atuacoes_completas AS
SELECT m.nome AS Musicos, s.nome AS Sinfonia, s.Compositor,
       f.nomeFuncao, i.nomeInstrumento, FORMAT(at.dataInicio, '%d/%m/%Y'),
       o.nome AS Orquestra
FROM Atuam at
JOIN Musicos m ON at.idMusicos = m.idMusicos
JOIN Sinfonias s ON at.idSinfonia = s.idSinfonia
JOIN FuncoesDosMusicos f ON at.idFuncao = f.idFuncao
JOIN Instrumentos i ON at.idInstrumento = i.idInstrumento
JOIN Orquestras o ON m.idOrquestra = o.idOrquestra;

-- View: Estatísticas por orquestra
CREATE VIEW vw_estatisticas_orquestra AS
SELECT o.nome AS Orquestra, 
       COUNT(DISTINCT m.idMusicos) AS TotalMusicos,
       COUNT(DISTINCT e.idSinfonia) AS "Total Sinfonias",
       o.cidade AS Cidade, o.pais AS País
FROM Orquestras o
LEFT JOIN Musicos m ON o.idOrquestra = m.idOrquestra
LEFT JOIN Executam e ON o.idOrquestra = e.idOrquestra
GROUP BY o.idOrquestra
ORDER BY TotalMusicos;

-- Músicos por faixa salarial
CREATE VIEW vw_musicos_faixa_salarial AS
SELECT 
    CASE 
        WHEN salario < 4000 THEN 'Baixo'
        WHEN salario BETWEEN 4000 AND 6000 THEN 'Médio'
        WHEN salario > 6000 THEN 'Alto'
        ELSE 'Não informado'
    END AS faixa_salarial,
    COUNT(*) as "Quantidade Músicos",
    CONCAT("R$ ",FORMAT(AVG(salario),2,'de_DE')) as "Salário Médio"
FROM Musicos
WHERE salario IS NOT NULL
GROUP BY faixa_salarial;

-- Instrumentos por categoria e preço
CREATE VIEW vw_instrumentos_categoria_preco AS
SELECT categoria, 
       COUNT(*) as total_instrumentos,
       CONCAT("R$ ",FORMAT(AVG(preco),2,'de_DE')) as preco_medio,
       CONCAT("R$ ",FORMAT(MIN(preco),2,'de_DE')) as preco_minimo,
       CONCAT("R$ ",FORMAT(MAX(preco),2,'de_DE')) as preco_maximo
FROM Instrumentos 
WHERE categoria IS NOT NULL
GROUP BY categoria;

-- Sinfonias por dificuldade
CREATE VIEW vw_sinfonias_dificuldade AS
SELECT dificuldade,
       COUNT(*) as total_sinfonias,
       FORMAT(AVG(TIME_TO_SEC(duracao)/60),2) as duracao_media_minutos
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

-- Performance dos músicos
CREATE VIEW vw_performance_artistas AS
SELECT m.nome as Músico,
       COUNT(DISTINCT at.idSinfonia) as "Total Sinfonia",
       COUNT(DISTINCT t.idInstrumento) as "Total Instrumentos",
       COUNT(DISTINCT d.idFuncao) as "Total Funções",
       CONCAT("R$ ",FORMAT(m.salario,2,'de_DE')) AS Salário,
       o.nome as Orquestra
FROM Musicos m
LEFT JOIN Atuam at ON m.idMusicos = at.idMusicos
LEFT JOIN Tocam t ON m.idMusicos = t.idMusicos
LEFT JOIN Desempenham d ON m.idMusicos = d.idMusicos
LEFT JOIN Orquestras o ON m.idOrquestra = o.idOrquestra
GROUP BY m.idMusicos;

