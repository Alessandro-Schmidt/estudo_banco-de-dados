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
('21','Jimi Hendrix','2'),
('22','Bob Dylan','2'),
('23','Bruce Springsteen','2'),
('24','Green Day','2'),
('25','Aerosmith','2'),
('26','Guns N Roses','2'),
('27','Simon & Garfunkel','2'),
('28','Eagles','2'),
('29','Mark Foster','4'),
('30','Paralamas do Sucesso','1'),
('31','Queen','3');

-- População da tabela Tb_Album
select * from Tb_Album;
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('1', 'Rubber Soul', '1');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('2', 'Tatoo You', '2');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('3', 'New', '3');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('4', 'Caravanas', '4');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('5', 'Cabeça Dinossauro', '5');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('6', 'Que país é esse?', '6');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('7', 'Aprendendo a mentir', '7');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('8', 'Este lado para cima', '8');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('9', 'Songs of war', '9');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('10', 'Zanadyie', '10');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('11', 'Die Lieferaten - live', '11');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('12', 'Roundtrip', '12');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('13', 'Lila Wolkeln', '13');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('14', 'Raum um Raum', '14');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('15', 'Tropfmeist', '15');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('16', 'Deutsch Akustik: Herr Laith', '16');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('17', 'Bendzko: Live MTV', '17');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('18', 'Champagnat Supernova', '18');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('19', 'Who are you', '19');
INSERT INTO `spotmidt`.`Tb_Album` (`cod_album`, `nome_do_album`, `cod_artista_banda`) VALUES ('20', 'The Wall', '20');


-- População da Tabela Música
select * from Tb_Musica;
desc Tb_Musica;
insert into Tb_Musica values
('1', 'Help', '', '1'),
('2', 'Star me up', '', '2'),
('3', 'Brazil', '', '3'),
('4', 'Construção', '', '4'),
('5', 'AA UU', '', '5'),
('6', 'Ainda é cedo', '', '6'),
('7', 'Tropa da Elite', '', '7'),
('8', 'Meu caminho', '', '8'),
('9', 'Smuglianka', '', '9'),
('10', 'Trabuji', '', '10'),
('11', 'Eine neue Klasse', '', '11'),
('12', 'Wirkstein', '', '12'),
('13', 'Kids', '', '13'),
('14', 'In die Nähe', '', '14'),
('15', '38 miles', '', '15'),
('16', 'Dies ist dein lied', '', '16'),
('17', 'Neu In DE', '', '17'),
('18', 'Wonderwall', '', '18'),
('19', 'Main_The_Who', '', '19'),
('20', 'Time', '', '20'),
('21', 'Cocaine', '', '21'),
('22', 'Like a Rolling', '', '22'),
('23', 'Born in the USA', '', '23'),
('24', 'American Idiot', '', '24'),
('25', 'Crazy', '', '25'),
('26', 'Welcome to the', '', '26'),
('27', 'Hello Darkness', '', '27'),
('28', 'Hotel California', '', '28'),
('29', 'Au Revoir', '', '29'),
('30', 'Laterna dos afogados', '', '30'),
('31', 'Bohemia Rapsody', '', '31'),
('32', 'Hey Jude', '', '1'),
('33', 'I can Get No', '', '2'),
('34', 'Once upon a time', '', '3'),
('35', 'Jogo de bola', '', '4'),
('36', 'Mundo cão', '', '5'),
('37', 'Tempo perdido', '', '6'),
('38', 'Massarandupió', '', '4'),
('39', 'Amantes', '', '4'),
('40', 'Relter Skelter', '', '1'),
('41', 'Norweigian Wood', '', '1'),
('42', 'Andere Deutsch', '', '11'),
('43', 'jorge Maravilha', '', '4'),
('44', 'Die Haus ist forbei', '', '13'),
('45', 'Die fünfte Beatle', '', '13'),
('46', 'Retrato em preto e branco', '', '4'),
('47', 'You wont see me', '', '1'),
('48', 'Licht Zimmer', '', '13'),
('49', 'Theres a Light', '', '18'),
('50', 'Die Tropftremmer', '', '13'),
('51', 'Aquela menina', '', '4'),
('52', 'Se eu soubesse', '', '4'),
('53', 'Tax Man', '', '1'),
('54', 'Lucy in the Sky', '', '1'),
('55', 'Paratodos', '', '4'),
('56', 'Eu te amo', '', '4'),
('57', 'In my life', '', '1'),
('58', 'Hello Goodbye', '', '1'),
('59', 'Back in the USSR', '', '1'),
('60', 'Girl', '', '1'),
('61', 'Nowhere man ', '', '1');

-- População da TB_musica_favoritada
desc Tb_Musica_Favoritada;
insert into Tb_Musica_Favoritada values
('1', '2020-9-30', '1:0:0', '1', '1'),
('2', '2020-9-30', '1:1:1', '2', '1'),
('3', '2020-9-30', '1:2:2', '3', '1'),
('4', '2020-9-30', '1:3:3', '4', '1'),
('5', '2020-9-30', '1:4:4', '5', '1'),
('6', '2020-9-30', '1:5:5', '6', '1'),
('7', '2020-9-30', '1:6:6', '7', '1'),
('8', '2020-9-30', '1:7:7', '8', '1'),
('9', '2020-9-30', '0:8:8', '9', '1'),
('10', '2020-9-30', '1:0:9', '10', '1'),
('11', '2020-10-1', '2:1:10', '11', '1'),
('12', '2020-10-1', '3:2:11', '12', '1'),
('13', '2020-10-1', '4:3:12', '13', '1'),
('14', '2020-10-1', '5:4:13', '14', '1'),
('15', '2020-10-1', '6:5:14', '15', '1'),
('16', '2020-10-6', '7:6:15', '16', '1'),
('17', '2020-10-7', '8:7:16', '17', '1'),
('18', '2020-11-8', '9:8:17', '18', '1'),
('19', '2020-11-8', '10:9:18', '19', '1'),
('20', '2020-11-8', '11:10:19', '20', '3'),
('21', '2020-11-8', '12:11:20', '21', '3'),
('22', '2020-11-8', '13:12:21', '22', '3'),
('23', '2020-11-8', '14:13:22', '23', '3'),
('24', '2020-11-8', '15:14:23', '24', '4'),
('25', '2020-11-8', '16:15:24', '25', '4'),
('26', '2020-11-8', '17:0:25', '26', '4'),
('27', '2020-11-8', '18:1:26', '27', '4'),
('28', '2020-11-8', '19:2:27', '28', '4'),
('29', '2020-12-9', '20:3:28', '29', '5'),
('30', '2020-12-9', '21:4:29', '30', '5'),
('31', '2020-12-9', '22:5:30', '31', '1'),
('32', '2020-12-9', '23:6:31', '32', '12'),
('33', '2020-12-9', '0:7:32', '33', '12'),
('34', '2020-12-12', '0:8:33', '34', '14'),
('35', '2020-12-12', '1:9:34', '35', '14'),
('36', '2020-12-12', '2:10:35', '36', '14'),
('37', '2020-12-23', '3:11:36', '37', '14'),
('38', '2020-12-23', '4:12:37', '38', '14'),
('39', '2020-12-23', '5:13:38', '1', '24'),
('40', '2020-12-24', '6:14:39', '1', '14'),
('41', '2020-12-24', '7:15:40', '41', '24'),
('42', '2020-12-25', '8:16:41', '42', '24'),
('43', '2020-12-26', '9:17:42', '43', '24'),
('44', '2020-12-30', '10:18:43', '29', '24'),
('45', '2021-1-1', '11:19:44', '44', '61'),
('46', '2021-1-2', '12:20:45', '2', '61'),
('47', '2021-1-2', '13:21:46', '2', '60'),
('48', '2021-1-3', '14:22:47', '2', '59'),
('49', '2021-1-3', '15:23:48', '2', '58'),
('50', '2021-1-3', '16:24:49', '3', '59'),
('51', '2021-1-4', '17:25:50', '3', '58'),
('52', '2021-1-4', '18:26:51', '3', '57'),
('53', '2021-1-4', '19:27:52', '3', '56'),
('54', '2021-1-5', '20:28:53', '4', '57'),
('55', '2021-2-1', '21:29:0', '4', '56'),
('56', '2021-2-2', '22:30:1', '4', '55'),
('57', '2021-2-2', '23:31:2', '5', '54'),
('58', '2021-2-2', '0:32:3', '5', '53'),
('59', '2021-2-2', '1:33:4', '5', '52'),
('60', '2021-2-2', '2:34:5', '6', '51'),
('61', '2021-2-3', '3:35:6', '6', '61'),
('62', '2021-2-3', '4:36:7', '6', '60'),
('63', '2021-2-3', '5:37:8', '7', '41'),
('64', '2021-2-3', '6:38:9', '7', '61'),
('65', '2021-3-4', '7:39:10', '7', '40'),
('66', '2021-3-4', '8:40:11', '8', '40'),
('67', '2021-3-4', '9:41:12', '8', '41'),
('68', '2021-3-4', '10:42:13', '1', '14'),
('69', '2021-3-5', '11:43:14', '8', '32'),
('70', '2021-3-5', '12:44:15', '33', '57'),
('71', '2021-4-5', '13:45:16', '3', '57'),
('72', '2021-4-5', '14:46:17', '33', '33'),
('73', '2021-4-6', '15:47:18', '12', '25'),
('74', '2021-5-6', '16:48:19', '12', '26'),
('75', '2021-5-6', '17:49:20', '12', '27'),
('76', '2021-5-6', '18:50:21', '12', '28'),
('77', '2021-5-29', '19:51:22', '12', '29'),
('78', '2021-5-30', '20:52:23', '15', '30'),
('79', '2021-6-12', '21:53:24', '15', '31'),
('80', '2021-6-13', '22:54:25', '15', '32'),
('81', '2021-6-14', '23:55:26', '15', '33'),
('82', '2021-6-15', '0:56:27', '15', '34'),
('83', '2021-6-17', '1:57:28', '30', '35'),
('84', '2021-6-30', '2:1:29', '30', '61'),
('85', '2021-7-1', '3:1:30', '30', '21'),
('86', '2021-7-1', '4:1:31', '18', '14'),
('87', '2021-7-1', '5:1:32', '18', '14'),
('88', '2021-7-1', '6:1:33', '18', '48'),
('89', '2021-7-1', '7:1:34', '1', '56'),
('90', '2021-7-1', '8:1:35', '8', '48'),
('91', '2021-7-1', '9:1:36', '39', '1'),
('92', '2021-7-1', '10:1:37', '39', '2'),
('93', '2021-7-1', '11:1:38', '39', '3'),
('94', '2021-7-1', '12:1:39', '39', '4'),
('95', '2021-7-1', '12:1:40', '39', '5'),
('96', '2021-7-1', '12:1:41', '39', '6'),
('97', '2021-7-1', '12:1:42', '39', '7'),
('98', '2021-7-1', '12:1:43', '39', '18'),
('99', '2021-7-1', '12:1:44', '39', '17'),
('100', '2021-7-1', '13:1:45', '39', '19'),
('101', '2021-7-1', '13:0:46', '39', '20'),
('102', '2021-7-1', '13:1:47', '40', '1'),
('103', '2021-7-1', '13:2:48', '40', '2'),
('104', '2021-7-1', '14:3:49', '40', '3'),
('105', '2021-8-1', '14:4:50', '40', '14');
select * from Tb_Musica_Favoritada;
/*
Fim do código.
*/