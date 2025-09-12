-- =====================================
-- ESCOLA DE MÚSICA - BANCO DE DADOS 
-- =====================================

-- Criação do banco de dados
CREATE DATABASE EscolaDeMusica;
USE EscolaDeMusica;

-- ========================================
-- CRIAÇÃO DAS TABELAS
-- ========================================

-- Tabela Orquestras
CREATE TABLE Orquestras (
    idOrquestra INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    dataCriacao DATE NOT NULL,
    telefone VARCHAR(20),
    INDEX idx_cidade (cidade)
);

-- Tabela Artistas (renomeada de Musicos)
CREATE TABLE Artistas (
    idMusico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    identidade VARCHAR(20) UNIQUE,
    nacionalidade VARCHAR(50) NOT NULL,
    dataNasc DATE NOT NULL,
    email VARCHAR(100),
    idOrquestra INT,
    FOREIGN KEY(idOrquestra) REFERENCES Orquestras (idOrquestra) ON DELETE SET NULL
);

-- Tabela Instrumentos
CREATE TABLE Instrumentos (
    idInstrumento INT AUTO_INCREMENT PRIMARY KEY,
    nomeInstrumento ENUM(
        'flauta','oboe','clarinete','violino','viola',
        'violoncelo','contrabaixo','trompa','trompete',
        'trombone','tuba','harpa','piano','saxofone'
    ) NOT NULL UNIQUE
);

-- Tabela FuncoesDosMusicos
CREATE TABLE FuncoesDosMusicos (
    idFuncao INT AUTO_INCREMENT PRIMARY KEY,
    nomeFuncao ENUM(
        'maestro', 'flautista', 'violinista', 'violista', 'violoncelista',
        'contrabaixista', 'trompista', 'trompetista', 'trombonista',
        'tubista', 'harpaista', 'pianista', 'saxofonista'
    ) NOT NULL UNIQUE
);

-- Tabela Sinfonias
CREATE TABLE Sinfonias (
    idSinfonia INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    compositor VARCHAR(100) NOT NULL,
    dataComposicao DATE NOT NULL,
    generoMusical VARCHAR(50)
);

-- Tabela de relacionamento: Tocam (Artista-Instrumento)
CREATE TABLE Tocam (
    idMusico INT,
    idInstrumento INT,
    PRIMARY KEY(idMusico, idInstrumento),
    FOREIGN KEY(idMusico) REFERENCES Artistas (idMusico) ON DELETE CASCADE,
    FOREIGN KEY(idInstrumento) REFERENCES Instrumentos (idInstrumento) ON DELETE CASCADE
);

-- Tabela de relacionamento: Executam (Orquestra-Sinfonia)
CREATE TABLE Executam (
    idSinfonia INT,
    idOrquestra INT,
    PRIMARY KEY(idSinfonia, idOrquestra),
    FOREIGN KEY(idSinfonia) REFERENCES Sinfonias (idSinfonia) ON DELETE CASCADE,
    FOREIGN KEY(idOrquestra) REFERENCES Orquestras (idOrquestra) ON DELETE CASCADE
);

-- Tabela de relacionamento: Desempenham (Artista-Função)
CREATE TABLE Desempenham (
    idMusico INT,
    idFuncao INT,
    dataAssumiu DATE,
    dataFim DATE,
    PRIMARY KEY(idMusico, idFuncao),
    FOREIGN KEY(idMusico) REFERENCES Artistas (idMusico) ON DELETE CASCADE,
    FOREIGN KEY(idFuncao) REFERENCES FuncoesDosMusicos (idFuncao) ON DELETE CASCADE
);

-- Tabela de relacionamento: Atuam (Artista-Sinfonia-Função-Instrumento)
CREATE TABLE Atuam (
    idMusico INT,
    idSinfonia INT,
    idFuncao INT,
    idInstrumento INT,
    dataInicio DATE NOT NULL,
    PRIMARY KEY(idMusico, idSinfonia, idFuncao),
    FOREIGN KEY(idMusico) REFERENCES Artistas (idMusico) ON DELETE CASCADE,
    FOREIGN KEY(idSinfonia) REFERENCES Sinfonias (idSinfonia) ON DELETE CASCADE,
    FOREIGN KEY(idFuncao) REFERENCES FuncoesDosMusicos (idFuncao) ON DELETE CASCADE,
    FOREIGN KEY(idInstrumento) REFERENCES Instrumentos (idInstrumento) ON DELETE CASCADE
);


