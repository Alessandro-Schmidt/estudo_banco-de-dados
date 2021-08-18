/*
Nesta aula, vamos resolver alguns problemas do banco inicial, que por exemplo, cadastrava
mais de uma vez a mesma pessoa. 
Aprendi que o comando: 
"drop database <namedatabase>"
exclui databases
*/ 
create database cadastro
default character set utf8
default collate utf8_general_ci;
/*
Esses comando "defaul character set..." servem para adaptar os programas ao pt-bt, com acentos. 
Eles não rodam, pois esta versão do MySQL já ve com utf8 como padrão
*/
use cadastro;
create table pessoas(
nome varchar(30) not null,
nascimento date,
sexo enum('M','F'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(20) default "Brasil"
)default charset = utf8;
 
 /*
 not null == obrigatório
 peso decimal(5,2) == - - -, - - (Cinco espaços com apenas 2 números após a virgula.)
 altura decimal(3,2) ==  - ,- - (formato de uma altura: 1,70)
nacionalidade varchar(20) default "Brasil" ==  O padrão fica como Brasil
 */


