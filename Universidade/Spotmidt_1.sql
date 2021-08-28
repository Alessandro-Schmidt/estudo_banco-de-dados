/*
Aqui está o trabalho de Banco de dados, do meu estudo feito pelo material e projetos da universidade. 
*/
create database spotmidt;
use spotmidt;

create table Tb_User(
cod_user int auto_increment not null unique, 
nacionalidade varchar(25) not null default "Brasil",
localizacao varchar(40) not null,
país varchar(25) not null default "Brasil",
nome varchar(25) not null,
sobrenome varchar(25) not null,
nascimento date not null ,
primary key(cod_user)
)default charset=utf8; 

create table Tb_Artista(
cod_bandaartista int auto_increment not null unique,
nome_bandaartista varchar(40) not null,
país_bandaartista varchar(40) not null default "Brasil",
primary key(cod_bandaartista)
)default charset=utf8;
use spotmidt;

create table Tb_Musica(
cod_musica int auto_increment not null unique,
nome_musica varchar(40) not null,
duracao_musica time,
letra_música varchar(400) default "Indisponível",
primary key (cod_musica)
)default charset=utf8;

create table Tb_Album(
cod_album int auto_increment not null unique,
nome_album varchar(40), 
primary key(cod_album),
cod_bandaartista int,
foreign key (cod_bandaartista) references Tb_Artista(cod_bandaartista)
)default charset=utf8;

create table Tb_Info_User(
localizador_informacional int auto_increment not null unique,
primary key(localizador_informacional),
cod_user int unique, 
foreign key (cod_user) references Tb_User(cod_user)
)default charset=utf8;

create table Tb_Download_Musica(
cod_download_musica int auto_increment not null unique, 
data_download_musica date not null, 
horario_download_musica time not null, 
cod_album int, 
localizador_informacional int,
foreign key(cod_album) references Tb_Album(cod_album),
foreign key(localizador_informacional) references Tb_Info_User(localizador_informacional)
)default charset=utf8;

create table Tb_Follow_Artista(
cod_follow_artista int auto_increment not null unique,
data_follow_artista date not null, 
hora_follow_artista time not null, 
cod_bandaartista int, 
localizador_informacional int, 
foreign key (cod_bandaartista) references Tb_Artista(cod_bandaartista),
foreign key(localizador_informacional) references Tb_Info_User(localizador_informacional)
)default charset=utf8;

create table Tb_Download_Album(
cod_download_album int auto_increment not null unique, 
data_download_album date not null, 
hora_download_album time not null, 
cod_album int,
localizador_informacional int,
foreign key(cod_album) references Tb_Album(cod_album),
foreign key(localizador_informacional) references Tb_Info_User(localizador_informacional)
)default charset=utf8;

create table Tb_Musicas_Favoritadas(
cod_favoritamento int auto_increment not null unique,
 data_favoritamento_musica date not null, 
 hora_favoritamento_musica time not null, 
 cod_musica int,
 cod_bandaartista int,
 localizador_informacional int,
 foreign key (cod_musica) references Tb_Musica(cod_musica),
 foreign key (cod_bandaartista) references Tb_Artista(cod_bandaartista),
 foreign key(localizador_informacional) references Tb_Info_User(localizador_informacional)
)default charset=utf8; 

