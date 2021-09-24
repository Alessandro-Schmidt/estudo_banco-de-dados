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
drop table Tb_Nacionalidade; 
use spotmidt;
-- Tb cidade

CREATE TABLE Tb_Cidade (
    cod_cidade INTEGER PRIMARY KEY UNIQUE,
    nome_da_cidade VARCHAR(20)
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
Fim do código.
*/