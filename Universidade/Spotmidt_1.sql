/*
Aqui está o trabalho de Banco de dados, do meu estudo feito pelo material e projetos da universidade. 
*/
create database spotmidt;
use spotmidt;


CREATE TABLE Tb_Nacionalidade (
    cod_nacionalidade VARCHAR(20) PRIMARY KEY,
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
    data_de_Nascimento DATE,
    cod_cidade INTEGER,
    cod_nacionalidade INTEGER
    FOREIGN KEY (cod_cidade)REFERENCES Tb_Cidade(cod_cidade);
    FOREIGN KEY (cod_nacionalidade) Tb_Nacionalidade(cod_nacionalidade);
);
 

 
ALTER TABLE Tb_User ADD CONSTRAINT FK_Tb_User_4
    FOREIGN KEY (cod_user, ???)
    REFERENCES Tb_Nacionalidade (nacionalidade, ???);