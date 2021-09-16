/*
Aqui está o trabalho de Banco de dados, do meu estudo feito pelo material e projetos da universidade. 
*/
create database spotmidt;
use spotmidt;

-- Tb Nacionalidade

CREATE TABLE Tb_Nacionalidade (
    cod_nacionalidade INTEGER PRIMARY KEY,
    nacionalidade VARCHAR(20),
    UNIQUE (cod_nacionalidade, nacionalidade)
);

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