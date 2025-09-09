ALTER TABLE Musicos RENAME TO Artistas;

ALTER TABLE Artistas ADD COLUMN email VARCHAR(100);

ALTER TABLE Orquestras MODIFY COLUMN nome VARCHAR(150);

ALTER TABLE Orquestras CHANGE COLUMN dataFundacao dataCriacao DATE;

ALTER TABLE Orquestras ADD COLUMN telefone VARCHAR(20);

ALTER TABLE Orquestras ADD INDEX idx_cidade (cidade);

ALTER TABLE Sinfonias ADD COLUMN generoMusical VARCHAR(50);

ALTER TABLE Instrumentos MODIFY COLUMN nomeInstrumento ENUM(
        'flauta','oboe','clarinete','violino','viola',
        'violoncelo','contrabaixo','trompa','trompete',
        'trombone','tuba','harpa','piano','saxofone'
) NOT NULL;

ALTER TABLE Atuam ADD COLUMN dataFim DATE;

ALTER TABLE Atuam CHANGE COLUMN dataAssumiu dataInicio DATE;

ALTER TABLE FuncoesDosMusicos
MODIFY COLUMN nomeFuncao ENUM(
    'maestro', 'flautista', 'violinista', 'violista', 'violoncelista',
    'contrabaixista', 'trompista', 'trompetista', 'trombonista',
    'tubista', 'harpaista', 'pianista', 'saxofonista'
) NOT NULL