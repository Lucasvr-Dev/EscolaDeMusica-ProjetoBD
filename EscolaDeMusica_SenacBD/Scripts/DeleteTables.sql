-- ==================================
-- SCRIPT DE DESTRUIÇÃO (DDL)
-- ==================================

-- Script para destruir o banco (usar com MUITO cuidado!)

-- Remover FKs primeiro para evitar problemas de dependência
ALTER TABLE Artistas DROP FOREIGN KEY artistas_ibfk_1;
ALTER TABLE Tocam DROP FOREIGN KEY tocam_ibfk_1;
ALTER TABLE Tocam DROP FOREIGN KEY tocam_ibfk_2;
ALTER TABLE Executam DROP FOREIGN KEY executam_ibfk_1;
ALTER TABLE Executam DROP FOREIGN KEY executam_ibfk_2;
ALTER TABLE Desempenham DROP FOREIGN KEY desempenham_ibfk_1;
ALTER TABLE Desempenham DROP FOREIGN KEY desempenham_ibfk_2;
ALTER TABLE Atuam DROP FOREIGN KEY atuam_ibfk_1;
ALTER TABLE Atuam DROP FOREIGN KEY atuam_ibfk_2;
ALTER TABLE Atuam DROP FOREIGN KEY atuam_ibfk_3;
ALTER TABLE Atuam DROP FOREIGN KEY atuam_ibfk_4;

-- Dropar Views
DROP VIEW IF EXISTS vw_artistas_orquestras;
DROP VIEW IF EXISTS vw_artistas_instrumentos;
DROP VIEW IF EXISTS vw_sinfonias_orquestras;
DROP VIEW IF EXISTS vw_atuacoes_completas;
DROP VIEW IF EXISTS vw_estatisticas_orquestra;
DROP VIEW IF EXISTS vw_artistas_faixa_salarial;
DROP VIEW IF EXISTS vw_instrumentos_categoria_preco;
DROP VIEW IF EXISTS vw_sinfonias_dificuldade;
DROP VIEW IF EXISTS vw_orquestras_status_regiao;
DROP VIEW IF EXISTS vw_performance_artistas;

-- Dropar tabelas de relacionamento primeiro
DROP TABLE IF EXISTS Atuam;
DROP TABLE IF EXISTS Desempenham;
DROP TABLE IF EXISTS Executam;
DROP TABLE IF EXISTS Tocam;

-- Dropar tabelas principais
DROP TABLE IF EXISTS Artistas;
DROP TABLE IF EXISTS Sinfonias;
DROP TABLE IF EXISTS FuncoesDosMusicos;
DROP TABLE IF EXISTS Instrumentos;
DROP TABLE IF EXISTS Orquestras;

-- Dropar banco
DROP DATABASE IF EXISTS EscolaDeMusica;
