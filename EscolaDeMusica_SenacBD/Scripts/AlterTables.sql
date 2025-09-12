-- ==============================
-- SCRIPTS DE ALTERAÇÃO (DDL)
-- ==============================

USE EscolaDeMusica;

-- Adicionar colunas
ALTER TABLE Orquestras ADD COLUMN email VARCHAR(100);
ALTER TABLE Orquestras ADD COLUMN status ENUM('ativa', 'inativa', 'suspenso') DEFAULT 'ativa';
ALTER TABLE Artistas ADD COLUMN telefone VARCHAR(20);
ALTER TABLE Artistas ADD COLUMN endereco VARCHAR(200);
ALTER TABLE Artistas ADD COLUMN salario DECIMAL(10,2);
ALTER TABLE Artistas ADD COLUMN status ENUM('ativo', 'inativo', 'licenca') DEFAULT 'ativo';
ALTER TABLE Instrumentos ADD COLUMN categoria VARCHAR(50);
ALTER TABLE Instrumentos ADD COLUMN preco DECIMAL(10,2);
ALTER TABLE FuncoesDosMusicos ADD COLUMN salarioBase DECIMAL(10,2);
ALTER TABLE Sinfonias ADD COLUMN duracao TIME;
ALTER TABLE Sinfonias ADD COLUMN dificuldade ENUM('baixa', 'media', 'alta', 'muito_alta') DEFAULT 'media';
ALTER TABLE Tocam ADD COLUMN nivelProficiencia ENUM('iniciante', 'intermediario', 'avancado', 'expert') DEFAULT 'intermediario';
ALTER TABLE Executam ADD COLUMN dataEstreia DATE;
ALTER TABLE Executam ADD COLUMN numeroApresentacoes INT DEFAULT 1;
ALTER TABLE Desempenham ADD COLUMN observacoes TEXT;
ALTER TABLE Atuam ADD COLUMN dataFim DATE;
ALTER TABLE Atuam ADD COLUMN avaliacaoDesempenho ENUM('ruim', 'regular', 'bom', 'otimo', 'excelente');

-- Modificar colunas existentes
ALTER TABLE Orquestras MODIFY COLUMN nome VARCHAR(150) NOT NULL;
ALTER TABLE Artistas MODIFY COLUMN nome VARCHAR(100) NOT NULL;
ALTER TABLE Sinfonias MODIFY COLUMN nome VARCHAR(100) NOT NULL;


