/*
Aqui está o trabalho de Banco de dados, do meu estudo feito pelo material e projetos da universidade. 
*/
create database spotmidt;
use spotmidt;

create table Tb_User(
cod_user int auto_increment not null, 
nacionalidade varchar(25) not null default "Brasil",
localizacao varchar(40) not null,
país varchar(25) not null default "Brasil",
nome varchar(25) not null,
sobrenome varchar(25) not null,
nascimento date not null,
primary key(cod_user)
)default charset=utf8; 


create table Tb_Artista(
cod_bandaartista int auto_increment not null,
nome_bandaartista varchar(40) not null,
país_bandaartista varchar(40) not null default "Brasil",
primary key(cod_bandaartista)
)default charset=utf8;