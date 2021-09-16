/*
Aqui está o trabalho de Banco de dados, do meu estudo feito pelo material e projetos da universidade. 
*/
create database spotmidt;
use spotmidt;


CREATE TABLE Tb_Nacionalidade (
    cod_nacionalidade INTEGER PRIMARY KEY,
    nacionalidade VARCHAR(20),
    UNIQUE (cod_nacionalidade, nacionalidade)
);


CREATE TABLE Tb_Cidade (
    cod_cidade INTEGER PRIMARY KEY UNIQUE,
    nome_da_cidade VARCHAR(20)
);



CREATE TABLE Tb_User (
    cod_user VARCHAR(20) PRIMARY KEY UNIQUE,
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
    
drop table Tb_User;



CREATE TABLE Tb_Canal_Podcast (
    cod_canal_podcast INTEGER PRIMARY KEY UNIQUE,
    nome_do_canal VARCHAR(20),
    descricao_do_canal VARCHAR(100),
    cod_nacionalidade integer
);
 
alter table Tb_Canal_Podcast
	add constraint fk_nacionalidade_podcast foreign key(cod_nacionalidade) references Tb_Nacionalidade(cod_nacionalidade);

 