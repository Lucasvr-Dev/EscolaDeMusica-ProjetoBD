-- ========================================
-- INSERÇÃO DE DADOS
-- ========================================

USE EscolaDeMusica;

-- Inserir Orquestras
INSERT INTO Orquestras (nome, cidade, pais, dataCriacao, telefone) VALUES
('Orquestra Sinfônica de Recife', 'Recife', 'Brasil', '1990-03-15', '(81) 3421-8800'),
('Orquestra Filarmônica de São Paulo', 'São Paulo', 'Brasil', '1985-05-10', '(11) 3123-4567'),
('Orquestra Sinfônica do Rio', 'Rio de Janeiro', 'Brasil', '1978-07-22', '(21) 2220-1234'),
('Orquestra Jovem do Recife', 'Recife', 'Brasil', '2005-01-12', '(81) 3456-7890'),
('Orquestra Filarmônica do Sul', 'Porto Alegre', 'Brasil', '1980-09-30', '(51) 3234-5678'),
('Orquestra Nacional de Brasília', 'Brasília', 'Brasil', '1992-06-18', '(61) 3345-6789'),
('Orquestra Municipal de Fortaleza', 'Fortaleza', 'Brasil', '1988-04-25', '(85) 3456-7891'),
('Orquestra de Câmara do Rio', 'Rio de Janeiro', 'Brasil', '1995-08-10', '(21) 2567-8901'),
('Orquestra Experimental de São Paulo', 'São Paulo', 'Brasil', '2000-12-01', '(11) 3678-9012'),
('Orquestra do Teatro Nacional', 'Brasília', 'Brasil', '1987-11-11', '(61) 3789-0123'),
('Orquestra Sinfônica de Salvador', 'Salvador', 'Brasil', '1993-03-20', '(71) 3234-5678'),
('Orquestra Filarmônica de Belo Horizonte', 'Belo Horizonte', 'Brasil', '1991-07-15', '(31) 3345-6789'),
('Orquestra Sinfônica do Paraná', 'Curitiba', 'Brasil', '1989-09-10', '(41) 3456-7890'),
('Orquestra de Câmara de Florianópolis', 'Florianópolis', 'Brasil', '1996-05-25', '(48) 3567-8901'),
('Orquestra Jovem de São Paulo', 'São Paulo', 'Brasil', '2001-02-14', '(11) 3678-9013'),
('Orquestra Sinfônica de Goiânia', 'Goiânia', 'Brasil', '1994-08-30', '(62) 3789-0124'),
('Orquestra Municipal de Campinas', 'Campinas', 'Brasil', '1998-11-05', '(19) 3890-1235'),
('Orquestra de Câmara de Natal', 'Natal', 'Brasil', '2003-06-12', '(84) 3901-2346'),
('Orquestra Sinfônica de Maceió', 'Maceió', 'Brasil', '1997-04-18', '(82) 4012-3457'),
('Orquestra Filarmônica de Manaus', 'Manaus', 'Brasil', '1999-10-22', '(92) 4123-4568');

-- Inserir Instrumentos
INSERT INTO Instrumentos (nomeInstrumento) VALUES
('flauta'),
('oboe'),
('clarinete'),
('violino'),
('viola'),
('violoncelo'),
('contrabaixo'),
('trompa'),
('trompete'),
('trombone'),
('tuba'),
('harpa'),
('piano'),
('saxofone');

-- Inserir Funções dos Músicos
INSERT INTO FuncoesDosMusicos (nomeFuncao) VALUES
('maestro'),
('flautista'),
('violinista'),
('violista'),
('violoncelista'),
('contrabaixista'),
('trompista'),
('trompetista'),
('trombonista'),
('tubista'),
('harpaista'),
('pianista'),
('saxofonista');

-- Inserir Sinfonias
INSERT INTO Sinfonias (nome, compositor, dataComposicao, generoMusical) VALUES
('Sinfonia nº 5', 'Beethoven', '1808-12-22', 'Clássico'),
('Sinfonia nº 40', 'Mozart', '1788-07-25', 'Clássico'),
('Sinfonia nº 4', 'Brahms', '1885-10-25', 'Romântico'),
('Sinfonia nº 6', 'Tchaikovsky', '1893-10-28', 'Romântico'),
('Sinfonia nº 9', 'Beethoven', '1824-05-07', 'Clássico'),
('Sinfonia nº 5', 'Mahler', '1902-10-18', 'Moderno'),
('Sinfonia nº 7', 'Shostakovich', '1941-12-05', 'Contemporâneo'),
('Sinfonia nº 9', 'Dvořák', '1893-12-16', 'Romântico'),
('Sinfonia nº 3', 'Beethoven', '1804-04-07', 'Clássico'),
('Sinfonia nº 4', 'Mendelssohn', '1833-11-13', 'Romântico'),
('Sinfonia nº 1', 'Brahms', '1876-11-04', 'Romântico'),
('Sinfonia nº 41', 'Mozart', '1788-08-10', 'Clássico'),
('Sinfonia nº 6', 'Beethoven', '1808-12-22', 'Clássico'),
('Sinfonia nº 8', 'Schubert', '1822-10-26', 'Romântico'),
('Sinfonia nº 2', 'Mahler', '1894-12-13', 'Moderno'),
('Sinfonia nº 5', 'Shostakovich', '1937-11-21', 'Contemporâneo'),
('Sinfonia nº 3', 'Mendelssohn', '1842-06-25', 'Romântico'),
('Sinfonia nº 35', 'Mozart', '1782-07-20', 'Clássico'),
('Sinfonia nº 7', 'Beethoven', '1812-12-08', 'Clássico'),
('Sinfonia nº 4', 'Tchaikovsky', '1878-02-22', 'Romântico');

-- Inserir Artistas
INSERT INTO Artistas (nome, identidade, nacionalidade, dataNasc, email, idOrquestra) VALUES
('João Silva', '123456789', 'Brasil', '1985-03-15', 'joao.silva@email.com', 1),
('Maria Souza', '987654321', 'Brasil', '1990-07-22', 'maria.souza@email.com', 1),
('Pedro Lima', '456789123', 'Brasil', '1982-12-10', 'pedro.lima@email.com', 2),
('Ana Costa', '321654987', 'Brasil', '1995-04-05', 'ana.costa@email.com', 2),
('Carlos Santos', '789123456', 'Brasil', '1988-09-09', 'carlos.santos@email.com', 3),
('Fernanda Melo', '159753486', 'Brasil', '1992-11-30', 'fernanda.melo@email.com', 3),
('Lucas Pereira', '357951456', 'Brasil', '1987-06-17', 'lucas.pereira@email.com', 4),
('Camila Rocha', '258147369', 'Brasil', '1993-01-25', 'camila.rocha@email.com', 4),
('Rafael Almeida', '951753852', 'Brasil', '1980-05-20', 'rafael.almeida@email.com', 5),
('Beatriz Martins', '654987321', 'Brasil', '1991-08-12', 'beatriz.martins@email.com', 5);

-- Inserir relacionamento Tocam (Artista-Instrumento)
INSERT INTO Tocam (idMusico, idInstrumento) VALUES
(1, 4), -- João toca violino
(1, 13), -- João também toca piano
(2, 4), -- Maria toca violino
(3, 5), -- Pedro toca viola
(4, 6), -- Ana toca violoncelo
(5, 7), -- Carlos toca contrabaixo
(6, 1), -- Fernanda toca flauta
(7, 9), -- Lucas toca trompete
(8, 12), -- Camila toca harpa
(9, 8), -- Rafael toca trompa
(10, 3); -- Beatriz toca clarinete

-- Inserir relacionamento Executam (Orquestra-Sinfonia)
INSERT INTO Executam (idSinfonia, idOrquestra) VALUES
(1, 1), (1, 2),
(2, 2), (2, 3),
(3, 3), (3, 4),
(4, 4), (4, 5),
(5, 5), (5, 6),
(6, 1), (6, 7),
(7, 7), (7, 8),
(8, 8), (8, 9),
(9, 9), (9, 10),
(10, 10), (10, 1);

-- Inserir relacionamento Desempenham (Artista-Função)
INSERT INTO Desempenham (idMusico, idFuncao, dataAssumiu) VALUES
(1, 3, '2020-01-15'), -- João como violinista
(1, 12, '2021-06-01'), -- João como pianista
(2, 3, '2019-03-10'), -- Maria como violinista
(3, 4, '2018-05-20'), -- Pedro como violista
(4, 5, '2017-09-15'), -- Ana como violoncelista
(5, 6, '2016-02-28'), -- Carlos como contrabaixista
(6, 2, '2019-07-10'), -- Fernanda como flautista
(7, 8, '2020-08-05'), -- Lucas como trompetista
(8, 11, '2018-12-12'), -- Camila como harpaista
(9, 7, '2017-04-18'), -- Rafael como trompista
(10, 1, '2015-01-10'); -- Beatriz como maestro

-- Inserir relacionamento Atuam (Artista-Sinfonia-Função-Instrumento)
INSERT INTO Atuam (idMusico, idSinfonia, idFuncao, idInstrumento, dataInicio) VALUES
(1, 1, 3, 4, '2023-01-15'), -- João, Sinfonia 1, violinista, violino
(1, 2, 12, 13, '2023-02-20'), -- João, Sinfonia 2, pianista, piano
(2, 1, 3, 4, '2023-01-15'), -- Maria, Sinfonia 1, violinista, violino
(3, 3, 4, 5, '2023-03-10'), -- Pedro, Sinfonia 3, violista, viola
(4, 4, 5, 6, '2023-04-05'), -- Ana, Sinfonia 4, violoncelista, violoncelo
(5, 5, 6, 7, '2023-05-12'), -- Carlos, Sinfonia 5, contrabaixista, contrabaixo
(6, 6, 2, 1, '2023-06-08'), -- Fernanda, Sinfonia 6, flautista, flauta
(7, 7, 8, 9, '2023-07-15'), -- Lucas, Sinfonia 7, trompetista, trompete
(8, 8, 11, 12, '2023-08-20'), -- Camila, Sinfonia 8, harpaista, harpa
(9, 9, 7, 8, '2023-09-25'), -- Rafael, Sinfonia 9, trompista, trompa
(10, 10, 1, 1, '2023-10-01'); -- Beatriz, Sinfonia 10, maestro, flauta (regência)



-- Mais Orquestras (para completar 20)



INSERT INTO Artistas (nome, identidade, nacionalidade, dataNasc, email, telefone, endereco, salario, status, idOrquestra) VALUES
('Roberto Silva', '147258369', 'Brasil', '1984-02-28', 'roberto.silva@email.com', '(61) 99999-0011', 'Rua K, 123', 5000.00, 'ativo', 6),
('Patricia Oliveira', '258369147', 'Brasil', '1989-09-14', 'patricia.oliveira@email.com', '(61) 99999-0012', 'Rua L, 234', 4500.00, 'ativo', 6),
('Marcos Antonio', '369147258', 'Brasil', '1986-12-03', 'marcos.antonio@email.com', '(85) 99999-0013', 'Rua M, 345', 5500.00, 'ativo', 7),
('Julia Santos', '741852963', 'Brasil', '1994-06-19', 'julia.santos@email.com', '(85) 99999-0014', 'Rua N, 456', 4800.00, 'ativo', 7),
('Diego Costa', '852963741', 'Brasil', '1983-03-07', 'diego.costa@email.com', '(21) 99999-0015', 'Rua O, 567', 4700.00, 'ativo', 8),
('Larissa Lima', '963741852', 'Brasil', '1996-10-11', 'larissa.lima@email.com', '(21) 99999-0016', 'Rua P, 678', 5200.00, 'ativo', 8),
('Gabriel Rocha', '159357486', 'Brasil', '1981-07-23', 'gabriel.rocha@email.com', '(11) 99999-0017', 'Rua Q, 789', 4600.00, 'ativo', 9),
('Amanda Silva', '357486159', 'Brasil', '1992-04-16', 'amanda.silva@email.com', '(11) 99999-0018', 'Rua R, 890', 4300.00, 'ativo', 9),
('Bruno Alves', '486159357', 'Brasil', '1987-11-29', 'bruno.alves@email.com', '(61) 99999-0019', 'Rua S, 901', 4200.00, 'ativo', 10),
('Carla Mendes', '123789456', 'Brasil', '1993-08-05', 'carla.mendes@email.com', '(61) 99999-0020', 'Rua T, 012', 4000.00, 'ativo', 10),
('Felipe Santos', '789456123', 'Brasil', '1985-01-18', 'felipe.santos@email.com', '(71) 99999-0021', 'Rua U, 123', 5000.00, 'ativo', 11),
('Renata Costa', '456123789', 'Brasil', '1990-05-12', 'renata.costa@email.com', '(71) 99999-0022', 'Rua V, 234', 4500.00, 'ativo', 11);