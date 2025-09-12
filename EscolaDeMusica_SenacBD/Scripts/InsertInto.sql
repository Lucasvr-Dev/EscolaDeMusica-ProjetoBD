

USE EscolaDeMusica;


INSERT INTO Orquestras (nome, cidade, pais, dataFundacao) VALUES
('Orquestra Sinfônica de Recife', 'Recife', 'Brasil', '1990-03-15'),
('Orquestra Filarmônica de São Paulo', 'São Paulo', 'Brasil', '1985-05-10'),
('Orquestra Sinfônica do Rio', 'Rio de Janeiro', 'Brasil', '1978-07-22'),
('Orquestra Jovem do Recife', 'Recife', 'Brasil', '2005-01-12'),
('Orquestra Filarmônica do Sul', 'Porto Alegre', 'Brasil', '1980-09-30'),
('Orquestra Nacional de Brasília', 'Brasília', 'Brasil', '1992-06-18'),
('Orquestra Municipal de Fortaleza', 'Fortaleza', 'Brasil', '1988-04-25'),
('Orquestra de Câmara do Rio', 'Rio de Janeiro', 'Brasil', '1995-08-10'),
('Orquestra Experimental de São Paulo', 'São Paulo', 'Brasil', '2000-12-01'),
('Orquestra do Teatro Nacional', 'Brasília', 'Brasil', '1987-11-11'),
('Orquestra do Amazonas', 'Manaus', 'Brasil', '1991-03-05'),
('Orquestra Jovem de Pernambuco', 'Recife', 'Brasil', '2010-02-14'),
('Orquestra de Câmara de Curitiba', 'Curitiba', 'Brasil', '1989-09-20'),
('Orquestra Sinfônica da Bahia', 'Salvador', 'Brasil', '1983-07-17'),
('Orquestra Municipal de Belo Horizonte', 'Belo Horizonte', 'Brasil', '1986-05-03'),
('Orquestra Filarmônica de Florianópolis', 'Florianópolis', 'Brasil', '1994-10-21'),
('Orquestra Jovem de Minas', 'Belo Horizonte', 'Brasil', '2003-06-10'),
('Orquestra Sinfônica de Porto Alegre', 'Porto Alegre', 'Brasil', '1979-12-15'),
('Orquestra de Câmara de Fortaleza', 'Fortaleza', 'Brasil', '1998-08-08'),
('Orquestra Experimental de Manaus', 'Manaus', 'Brasil', '2002-04-04');


INSERT INTO Instrumentos (nomeInstrumento) VALUES
('flauta'),('oboe'),('clarinete'),('violino'),('viola'),
('violoncelo'),('contrabaixo'),('trompa'),('trompete'),('trombone'),
('tuba'),('harpa'),('piano'),('saxofone'),('fagote'),
('percussao'),('violino piccolo'),('trompete piccolo'),('eufonio'),('mandolim');


INSERT INTO FuncoesDosMusicos (nomeFuncao) VALUES
('maestro'),('flautista'),('oboista'),('clarinetista'),('violinista'),
('violista'),('violoncelista'),('contrabaixista'),('trompista'),('trompetista'),
('trombonista'),('tubista'),('harpista'),('pianista'),('saxofonista'),
('fagotista'),('percussionista'),('mandolinista'),('violino piccolo'),('eufonista');


INSERT INTO Sinfonias (nome, compositor, dataComposicao) VALUES
('Sinfonia nº 1', 'Beethoven', '1800-01-01'),
('Sinfonia nº 2', 'Mozart', '1780-06-12'),
('Sinfonia nº 3', 'Brahms', '1875-04-22'),
('Sinfonia nº 4', 'Tchaikovsky', '1877-02-18'),
('Sinfonia nº 5', 'Beethoven', '1808-12-22'),
('Sinfonia nº 6', 'Mahler', '1904-09-25'),
('Sinfonia nº 7', 'Shostakovich', '1951-08-05'),
('Sinfonia nº 8', 'Dvořák', '1889-05-01'),
('Sinfonia nº 9', 'Beethoven', '1824-05-07'),
('Sinfonia nº 10', 'Mendelssohn', '1845-03-15'),
('Sinfonia nº 11', 'Haydn', '1788-11-23'),
('Sinfonia nº 12', 'Schubert', '1821-02-01'),
('Sinfonia nº 13', 'Sibelius', '1909-08-16'),
('Sinfonia nº 14', 'Prokofiev', '1930-06-09'),
('Sinfonia nº 15', 'Dvořák', '1896-04-04'),
('Sinfonia nº 16', 'Beethoven', '1810-09-12'),
('Sinfonia nº 17', 'Mozart', '1785-07-10'),
('Sinfonia nº 18', 'Brahms', '1880-03-03'),
('Sinfonia nº 19', 'Tchaikovsky', '1888-10-05'),
('Sinfonia nº 20', 'Mahler', '1910-12-12');


INSERT INTO Musicos (nome, identidade, nacionalidade, dataNasc, idOrquestra) VALUES
('João Silva','123456789','Brasil','1985-03-15',1),
('Maria Souza','987654321','Brasil','1990-07-22',1),
('Pedro Lima','456789123','Brasil','1982-12-10',2),
('Ana Costa','321654987','Brasil','1995-04-05',2),
('Carlos Santos','789123456','Brasil','1988-09-09',3),
('Fernanda Melo','159753486','Brasil','1992-11-30',3),
('Lucas Pereira','357951456','Brasil','1987-06-17',4),
('Camila Rocha','258147369','Brasil','1993-01-25',4),
('Rafael Almeida','951753852','Brasil','1980-05-20',5),
('Beatriz Martins','654987321','Brasil','1991-08-12',5),
('Tiago Fernandes','147852369','Brasil','1984-02-18',6),
('Juliana Lima','369852147','Brasil','1989-07-07',6),
('Gabriel Barbosa','852741963','Brasil','1986-10-23',7),
('Larissa Castro','963258741','Brasil','1994-09-09',7),
('Mateus Rocha','741852963','Brasil','1983-01-30',8),
('Patrícia Nunes','258963147','Brasil','1992-12-12',8),
('Felipe Santos','357456951','Brasil','1981-11-11',9),
('Aline Dias','159486357','Brasil','1990-06-06',9),
('Rodrigo Moreira','951486357','Brasil','1985-03-03',10),
('Carla Lima','753159486','Brasil','1993-08-08',10);


INSERT INTO Tocam (idMusico, idInstrumento) VALUES
(1,4),(2,4),(3,5),(4,5),(5,6),(6,6),(7,7),(8,7),(9,8),(10,8),
(11,1),(12,1),(13,2),(14,2),(15,3),(16,3),(17,9),(18,9),(19,10),(20,10);


INSERT INTO Executam (idSinfonia, idOrquestra) VALUES
(1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4),(9,5),(10,5),
(11,6),(12,6),(13,7),(14,7),(15,8),(16,8),(17,9),(18,9),(19,10),(20,10);


INSERT INTO Atuam (idMusico, idSinfonia, idFuncao, idInstrumento, dataInicio) VALUES
(1,1,2,4,'2023-01-01'),
(2,2,2,4,'2023-01-01'),
(3,3,3,5,'2023-01-02'),
(4,4,3,5,'2023-01-02'),
(5,5,4,6,'2023-01-03'),
(6,6,4,6,'2023-01-03'),
(7,7,5,7,'2023-01-04'),
(8,8,5,7,'2023-01-04'),
(9,9,6,8,'2023-01-05'),
(10,10,6,8,'2023-01-05'),
(11,11,7,1,'2023-01-06'),
(12,12,7,1,'2023-01-06'),
(13,13,8,2,'2023-01-07'),
(14,14,8,2,'2023-01-07'),
(15,15,9,3,'2023-01-08'),
(16,16,9,3,'2023-01-08'),
(17,17,10,9,'2023-01-09'),
(18,18,10,9,'2023-01-09'),
(19,19,11,10,'2023-01-10'),
(20,20,11,10,'2023-01-10');
