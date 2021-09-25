/*
Aqui está o trabalho de Banco de dados, do meu estudo feito pelo material e projetos da universidade. 
*/
create database spotmidt;
use spotmidt;

-- Tb Nacionalidade

CREATE TABLE Tb_Nacionalidade (
    cod_nacionalidade INTEGER PRIMARY KEY,
    nacionalidade VARCHAR(20)
);

-- Tb cidade

CREATE TABLE Tb_Cidade (
    cod_cidade INTEGER PRIMARY KEY UNIQUE,
    nome_da_cidade VARCHAR(20),
    nome_do_pais varchar(20)
);

-- tb user

CREATE TABLE Tb_User (
    cod_user int PRIMARY KEY UNIQUE,
    nome VARCHAR(15),
    sobrenome VARCHAR(20),
    data_de_Nascimento DATE
);


alter table Tb_User
add column cod_nacionalidade int;

alter table Tb_User
add column cod_cidade int; 

alter table Tb_User
add foreign key (cod_nacionalidade)
references Tb_Nacionalidade(cod_nacionalidade);

alter table Tb_User
add foreign key (cod_cidade)
references Tb_Cidade(cod_cidade);
    

-- tb Canal Podcast

CREATE TABLE Tb_Canal_Podcast (
    cod_canal_podcast INTEGER PRIMARY KEY UNIQUE,
    nome_do_canal VARCHAR(20),
    descricao_do_canal VARCHAR(100),
    cod_nacionalidade integer
);
 
alter table Tb_Canal_Podcast
	add constraint fk_nacionalidade_podcast foreign key(cod_nacionalidade) references Tb_Nacionalidade(cod_nacionalidade);
    
-- tb follow canal podcast    

CREATE TABLE Tb_Follow_Canal_Podcast (
    cod_follow_podcast INTEGER PRIMARY KEY UNIQUE,
    data_follow_podcast DATE,
    hora_follow_podcast TIME,
    cod_user int, 
    cod_canal_podcast int
);

alter table Tb_Follow_Canal_Podcast
add foreign key (cod_user)
references Tb_User(cod_user);

alter table Tb_Follow_Canal_Podcast
add foreign key (cod_canal_podcast)
references Tb_Canal_Podcast(cod_canal_podcast);

 -- Tb episodio podcast 

CREATE TABLE Tb_Episodios_Podcast (
    cod_episodio_podcast INTEGER PRIMARY KEY UNIQUE,
    titulo_do_episodio_podcast VARCHAR(50),
    duracao_do_episodio_podcast TIME,
    cod_canal_podcast INTEGER
);
 
ALTER TABLE Tb_Episodios_Podcast ADD CONSTRAINT FK_dono_do_episodio
    FOREIGN KEY (cod_canal_podcast)
    REFERENCES Tb_Canal_Podcast(cod_canal_podcast);
    
-- Tb episódio podast baixado

CREATE TABLE Tb_Podcast_Episodio_Baixado (
    cod_download_episodio INTEGER PRIMARY KEY UNIQUE,
    data_download_episodio_podcast DATE,
    hora_download_episodio_podcast TIME,
    cod_user INTEGER,
    cod_episodio_podcast INTEGER
);
 
 
ALTER TABLE Tb_Podcast_Episodio_Baixado ADD CONSTRAINT FK_Tb_Podcast_Episodio_Baixado_3
    FOREIGN KEY (cod_episodio_podcast)
    REFERENCES Tb_Episodios_Podcast(cod_episodio_podcast);

alter table Tb_Podcast_Episodio_Baixado add constraint FK_usuario_download_episodio
	foreign key (cod_user) 
    references Tb_User(cod_user);
    
-- Tb artista banda

CREATE TABLE Tb_Artista_Banda (
    cod_artista_banda INTEGER PRIMARY KEY UNIQUE,
    nome_da_banda VARCHAR(40),
    cod_nacionalidade INTEGER
);
 
ALTER TABLE Tb_Artista_Banda ADD CONSTRAINT FK_nacionalidade_artista
    FOREIGN KEY (cod_nacionalidade)
    REFERENCES Tb_Nacionalidade(cod_nacionalidade);
    
-- Tb musicas

CREATE TABLE Tb_Musica (
    cod_musica INTEGER PRIMARY KEY UNIQUE,
    nome_da_musica VARCHAR(40),
    duracao_da_musica TIME,
    cod_artista_banda INTEGER
);
 
ALTER TABLE Tb_Musica ADD CONSTRAINT FK_artista_dono_musica
    FOREIGN KEY (cod_artista_banda)
    REFERENCES Tb_Artista_Banda(cod_artista_banda);
    
-- Tb Album 

CREATE TABLE Tb_Album (
    cod_album INTEGER PRIMARY KEY UNIQUE,
    nome_do_album VARCHAR(40),
    cod_artista_banda INTEGER
);
 
ALTER TABLE Tb_Album ADD CONSTRAINT FK_artista_do_album
    FOREIGN KEY (cod_artista_banda)
    REFERENCES Tb_Artista_Banda(cod_artista_banda);
    
-- Tb Follow Artista

CREATE TABLE Tb_Follow_Artista (
    cod_follow_artista INTEGER PRIMARY KEY UNIQUE,
    data_follow_artista DATE,
    hora_follow_artista TIME,
    cod_user INTEGER,
    cod_artista_banda INTEGER
);
 
ALTER TABLE Tb_Follow_Artista ADD CONSTRAINT FK_follow_artista_usuario
    FOREIGN KEY (cod_user)
    REFERENCES Tb_User(cod_user);
    
ALTER TABLE Tb_Follow_Artista ADD CONSTRAINT FK_artista_seguido
    FOREIGN KEY (cod_artista_banda)
    REFERENCES Tb_Artista_Banda(cod_artista_banda);    
    
-- Tb musica favoritada

CREATE TABLE Tb_Musica_Favoritada (
    cod_favoritamento_musica INTEGER PRIMARY KEY UNIQUE,
    data_favoritamento_musica DATE,
    hora_favoritamento_musica TIME,
    cod_user INTEGER,
    cod_musica INTEGER
);
ALTER TABLE Tb_Musica_Favoritada ADD CONSTRAINT FK_favoritada_pelo_user
    FOREIGN KEY (cod_user)
    REFERENCES Tb_User(cod_user);

alter table Tb_Musica_Favoritada add constraint FK_musica_favoritada
foreign key (cod_musica)
references Tb_Musica(cod_musica);

-- Tb Musica baixada

CREATE TABLE Tb_Download_Musica (
    cod_download_musica INTEGER PRIMARY KEY UNIQUE,
    data_download_musica DATE,
    hora_download_musica TIME,
    cod_user INTEGER,
    cod_musica INTEGER
);
 
ALTER TABLE Tb_Download_Musica ADD CONSTRAINT FK_usuario_download_musica
    FOREIGN KEY (cod_user)
    REFERENCES Tb_User(cod_user);
    
ALTER TABLE Tb_Download_Musica ADD CONSTRAINT FK_musica_baixada
foreign key (cod_musica)
references Tb_Musica(cod_musica);
    
    
-- Tb Album baixado

CREATE TABLE Tb_Album_Baixado (
    cod_download_album INTEGER PRIMARY KEY UNIQUE,
    data_download_album DATE,
    hora_download_album TIME,
    cod_user INTEGER,
    cod_album INTEGER
);
 
ALTER TABLE Tb_Album_Baixado ADD CONSTRAINT FK_baixado_pelouser
    FOREIGN KEY (cod_user)
    REFERENCES Tb_User(cod_user);
    
ALTER TABLE Tb_Album_Baixado ADD CONSTRAINT FK_album_baixado
    FOREIGN KEY (cod_album)
    REFERENCES Tb_Album(cod_album);	
    
/*
População das tabelas: 
*/    

-- População de cidades: 
insert into Tb_Cidade values
('1', 'Curitiba', 'Brazil'),
('2', 'São Paulo', 'Brazil'), 
('3', 'Belo Horizonte', 'Brazil'),
('4', 'Brasília', 'Brazil'), 
('5', 'Porto Alegre', 'Brazil'),
('6', 'Florianópolis', 'Brazil'),
('7', 'Chapecó', 'Brazil'),
('8', 'New York', 'USA'),
('9', 'Chicago', 'USA'),
('10', 'London', 'UK'),
('11', 'Barcelona', 'Spain'),
('12', 'Madrid', 'Spain'), 
('13', 'Berlin', 'Germany'),
('14', 'Munich', 'Germany'),
('15', 'Geneve', 'Switzerland'),
('16', 'Moscow', 'Russia'), 
('17', 'Tokyo', 'Japan'),
('18', 'Shanghai', 'China'),
('19', 'Miami', 'USA'),
('20', 'San Francisco', 'USA'), 
('21', 'Los Angeles', 'USA'),
('22', 'Hueston', 'USA'),
('23', 'Phoenix', 'USA'),
('24', 'San Diego', 'USA'),
('25', 'Dallas', 'USA'), 
('26', 'Paris', 'France'),
('27', 'Bern', 'Switzerland'),
('28', 'Brussels', 'Belgium'),
('29', 'Tallin', 'Estonia'),
('30', 'Rome', 'Italy');

select * from Tb_Cidade;

-- População de Nacionalidades: 

insert into Tb_Nacionalidade values
('1', 'Brazilian'),
('2', 'American'),
('3', 'British'),
('4', 'German'),
('5', 'Japanese'),
('6', 'Chinese'),
('7', 'French'),
('8', 'Italian'),
('9', 'Swiss'),
('10', 'Belgian'),
('11', 'Estonian'),
('12', 'Russian'),
('13', 'Chinese'),
('14', 'Spanish');

-- População da tabela Tb_User

insert into Tb_User values
('1', 'Alessandro', 'Schmidt', '2001-04-28', '3', '10'),
('2', 'Godoy', 'Arthur', '1998-07-21', '14', '11'),
('3', 'Thiago', 'Andretta', '1970-12-03', '8', '30'),
('4', 'Peter', 'Parker', '1950-02-11', '1', '1'),
('5', 'José', 'Oliver', '2004-10-30', '1', '2'),
('6', 'Gustavo', 'Cardona', '2005-02-25', '2', '9'),
('7', 'Thomas', 'Chiari', '1999-02-25', '3', '10'),
('8', 'Mary', 'Jane', '1970-02-21', '3', '10'),
('9', 'Heloísa', 'Lorenzet', '1980-11-30', '7', '26'),
('10', 'Lotta', 'Öbenstein', '1996-07-25', '4', '13'),
('11', 'Maria', 'Angelica', '1979-09-19', '4', '14'),
('12', 'Klaus', 'Blumenstein', '1960-08-13', '12', '16'),
('13', 'Heirich', 'Dreässen', '1963-07-03', '5', '17'),
('14', 'Harry', 'Osbourn', '1950-01-29', '6', '18'),
('15', 'James', 'Potter', '1999-03-20', '8', '30'),
('16', 'Robert', 'Downey Junior', '1954-06-12', '9', '15'),
('17', 'Benjamin', 'Loveheart', '2005-09-14', '10', '28'),
('18', 'Olivia', 'Kraussberg', '2009-07-28', '11', '29'),
('19', 'Oliver', 'Stiglitz', '2010-02-09', '14', '12'),
('20', 'Noah', 'Jordan', '2015-08-02', '3', '10'),
('21', 'Noah', 'Banes', '2003-11-01', '3', '10'),
('22', 'Lucas', 'Rodrigues', '2011-12-06', '2', '8'),
('23', 'Alexander', 'The Great', '1986-02-06', '2', '25'),
('24', 'Janusz', 'Groner', '1982-06-12', '9', '27'),
('25', 'Ava', 'Maciel', '1984-04-18', '9', '15'),
('26', 'Amelia', 'Brandelero', '1993-03-14', '1', '3'),
('27', 'Harper', 'Hassem', '2001-07-19', '2', '24'),
('28', 'Mia', 'Smith', '2002-07-17', '1', '4'),
('29', 'Evelyn', 'Johnson', '1991-02-13', '3', '10'),
('30', 'Moritz', 'Zimmerman', '1999-05-15', '1', '5'),
('31', 'Ben', 'Carlson', '2000-12-17', '3', '10'),
('32', 'Quentinn', 'Tarantino', '1940-03-11', '2', '24'),
('33', 'Sophia', 'Glockheart', '1981-07-25', '3', '10'),
('34', 'Ana', 'Maria', '1967-11-29', '3', '10'),
('35', 'Ana', 'Dumbledore', '1990-09-30', '3', '10'),
('36', 'May', 'Parker', '1973-02-22', '2', '8'),
('37', 'Charlotte', 'Of Edinburg', '1920-12-14', '11', '29'),
('38', 'Alice', 'Wonderland', '1993-07-27', '1', '6'),
('39', 'Metthew', 'Perry', '1998-04-14', '1', '7'),
('40', 'David', 'Schwimmer', '2001-02-11', '2', '24'),
('41', 'Joey', 'Tribbiani', '2017-07-21', '2', '23'),
('42', 'Phoebe', 'Bupphay', '2005-11-15', '3', '10'),
('43', 'Ted', 'Mosby', '2013-02-21', '3', '10'),
('44', 'Luke', 'Skywalker', '1978-07-11', '10', '28'),
('45', 'Leia', 'Skywalker', '1978-07-19', '10', '28');

select * from Tb_User;

-- População Tb_Artista

insert into Tb_Artista_Banda values
('1', 'The Beatles', '3'),
('2', 'Rolling Stones', '3'),
('3', 'Paul McCartney', '3'), 
('4', 'Chico Buarque', '1'),
('5', 'Titãs', '1'),
('6', 'Legião Urbana', '1'), 
('7', 'Selvagens a Procura da Lei', '1'),
('8', 'Resgate', '1'),
('9', 'The Red Army Choir', '12'),
('10', 'Feduk', '12'),
('11', 'Die Lieferaten','4'),
('12', 'Miksu', '4'),
('13', 'Marteria', '4'),
('14', 'Jupiter Jones', '4'),
('15','Revolverhead','4'),
('16', 'Laith Al-Deen', '4'),
('17','Tim Bendzko','4'),
('18','Oasis','3'),
('19','The Who','3'),
('20', 'Pink Floyd', '3'),
('21','Jimi Hendrix','');




/*
Fim do código.
*/