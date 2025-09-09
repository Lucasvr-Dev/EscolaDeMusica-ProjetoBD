CREATE DATABASE EscolaDeMusica;

USE EscolaDeMusica;

CREATE TABLE Orquestras (
    idOrquestra INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    pais VARCHAR(50),
    dataFundacao DATE
);

CREATE TABLE Musicos (
    idMusico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    identidade VARCHAR(20),
    nacionalidade VARCHAR(50),
    dataNasc DATE,
    idOrquestra INT,
    FOREIGN KEY(idOrquestra) REFERENCES Orquestras (idOrquestra)
);

CREATE TABLE Instrumentos (
    idInstrumento INT AUTO_INCREMENT PRIMARY KEY,
    nomeInstrumento ENUM(
        'flauta','oboe','clarinete'
    ) NOT NULL
);

CREATE TABLE FuncoesDosMusicos (
    idFuncao INT AUTO_INCREMENT PRIMARY KEY,
    nomeFuncao VARCHAR(50)
);

CREATE TABLE Sinfonias (
    idSinfonia INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    compositor VARCHAR(100),
    dataComposicao DATE
);

CREATE TABLE ExistemNasDataRegistro (
    idSinfonia INT,
    idFuncao INT,
    dataFuncao DATE,
    PRIMARY KEY(idSinfonia, idFuncao),
    FOREIGN KEY(idSinfonia) REFERENCES Sinfonias (idSinfonia),
    FOREIGN KEY(idFuncao) REFERENCES FuncoesDosMusicos (idFuncao)
);

CREATE TABLE Executam (
    idSinfonia INT,
    idOrquestra INT,
    PRIMARY KEY(idSinfonia, idOrquestra),
    FOREIGN KEY(idSinfonia) REFERENCES Sinfonias (idSinfonia),
    FOREIGN KEY(idOrquestra) REFERENCES Orquestras (idOrquestra)
);

CREATE TABLE Desempenham (
    idMusico INT,
    idFuncao INT,
    PRIMARY KEY(idMusico, idFuncao),
    FOREIGN KEY(idMusico) REFERENCES Musicos (idMusico),
    FOREIGN KEY(idFuncao) REFERENCES FuncoesDosMusicos (idFuncao)
);

CREATE TABLE Tocam (
    idMusico INT,
    idInstrumento INT,
    PRIMARY KEY(idMusico, idInstrumento),
    FOREIGN KEY(idMusico) REFERENCES Musicos (idMusico),
    FOREIGN KEY(idInstrumento) REFERENCES Instrumentos (idInstrumento)
);