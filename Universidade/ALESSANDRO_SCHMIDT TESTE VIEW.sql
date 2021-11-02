 

create database curso; 

use curso; 

 

CREATE TABLE PROFESSORES ( 

    cod_prof int PRIMARY KEY, 

    nome_prof char(30)); 

 

Insert into PROFESSORES values (100,'Deborah'); 

Insert into PROFESSORES values (200,'Mario'); 

Insert into PROFESSORES values (300,'Ricardo'); 

Insert into PROFESSORES values (400,'Justino'); 

Insert into PROFESSORES values (500,'Veronese'); 

Insert into PROFESSORES values (600,'Hamerski'); 

Insert into PROFESSORES values (700,'Gilson'); 

Insert into PROFESSORES values (800,'Thieme'); 

Insert into PROFESSORES values (900,'Camillo'); 

Insert into PROFESSORES values (1000,'Schmeil'); 

 

 

CREATE TABLE DISCIPLINAS ( 

    cod_disc int PRIMARY KEY, 

    nome_disciplina char(30)); 

 

 

Insert into DISCIPLINAS values (1,'sbd'); 

Insert into DISCIPLINAS values (2,'analise'); 

Insert into DISCIPLINAS values (3,'redes e sistemas distribuidos'); 

Insert into DISCIPLINAS values (4,'projeto final'); 

Insert into DISCIPLINAS values (5,'engenharia de software'); 

Insert into DISCIPLINAS values (6,'filosofia'); 

Insert into DISCIPLINAS values (7,'teologia'); 

Insert into DISCIPLINAS values (8,'deontologia'); 

Insert into DISCIPLINAS values (9,'sistemas operacionais'); 

Insert into DISCIPLINAS values (10,'arquitetura de computadores'); 

 

 

CREATE TABLE PROFESSORES_DISCIPLINAS ( 

    cod_prof integer, 

    cod_disc integer, 

    total_horas decimal(5,2) null , 

    primary key (cod_prof,cod_disc), 

    data_aula date not null, 

  foreign key (cod_prof) references PROFESSORES (cod_prof), 

  foreign key (cod_disc) references DISCIPLINAS (cod_disc)); 

 

 

 

Insert into PROFESSORES_DISCIPLINAS values (100,1,10.6, '2005-1-1'); 

Insert into PROFESSORES_DISCIPLINAS values (200,2,13.2, '2005-2-2'); 

Insert into PROFESSORES_DISCIPLINAS values (300,3,15.4, '2005-3-3'); 

Insert into PROFESSORES_DISCIPLINAS values (400,4,17.3, '2005-4-4'); 

Insert into PROFESSORES_DISCIPLINAS values (500,5,18.6, '2005-5-5'); 

Insert into PROFESSORES_DISCIPLINAS values (600,6,19.1, '2005-6-6'); 

Insert into PROFESSORES_DISCIPLINAS values (700,7,20.2, '2005-7-7'); 

Insert into PROFESSORES_DISCIPLINAS values (800,8,11.5, '2005-8-8'); 

Insert into PROFESSORES_DISCIPLINAS values (900,9,21.7, '2005-9-9'); 

Insert into PROFESSORES_DISCIPLINAS values (1000,10,22.6, '2005-10-10'); 

Insert into PROFESSORES_DISCIPLINAS values (900,2,17.7, '2006-11-10'); 

Insert into PROFESSORES_DISCIPLINAS values (800,3,15.3, '2006-12-10'); 

Insert into PROFESSORES_DISCIPLINAS values (700,4,13.1, '2006-01-10'); 

Insert into PROFESSORES_DISCIPLINAS values (600,5,12.5, '2006-02-10'); 

Insert into PROFESSORES_DISCIPLINAS values (500,6,16.7, '2006-03-10'); 

Insert into PROFESSORES_DISCIPLINAS values (400,7,18.9, '2006-04-10'); 

Insert into PROFESSORES_DISCIPLINAS values (300,8,19.3, '2006-05-10'); 

Insert into PROFESSORES_DISCIPLINAS values (200,9,20.4, '2007-1-10'); 

Insert into PROFESSORES_DISCIPLINAS values (200,1,20.4, '2007-2-10'); 

Insert into PROFESSORES_DISCIPLINAS values (100,10,21.5, '2007-3-10'); 

Insert into PROFESSORES_DISCIPLINAS values (200,10,21.5, '2007-4-10'); 

 

-- POC 1:  

-- Quais sao os professores que ministraram uma determinada disciplina antes de 2006, 

-- mas que apos este momento não ministraram mais esta mesma disciplina? 

create view pf_antes_2006 as 

select p.nome_prof as 'Nome do professor' , d.nome_disciplina as 'nome da disciplina', pd.data_aula as 'Data que foi ministrada (apenas antes de 2006)' 

from PROFESSORES as p join PROFESSORES_DISCIPLINAS as pd  

on p.cod_prof = pd.cod_prof  

join DISCIPLINAS as d on d.cod_disc = pd.cod_disc 

where pd.data_aula between '1900-12-31' and '2005-12-31' 

and p.cod_prof not in (select p.cod_prof 

from PROFESSORES as p join PROFESSORES_DISCIPLINAS as pd  

on p.cod_prof = pd.cod_prof  

join DISCIPLINAS as d on d.cod_disc = pd.cod_disc 

where pd.data_aula between '2006-01-1' and '2020-12-31'); 

-- Uso da view:  

select * from pf_antes_2006;  

/*
Π(Projeção) p.nome_prof as 'Nome do professor' , d.nome_disciplina as 'nome da disciplina', pd.data_aula as 'Data que foi ministrada (apenas antes de 2006)' (α pd.data_aula between '1900-12-31' and '2005-12-31' - (EXCESSÃO)) (PROD_CARTESIANO_2), (PROFESSORES)|X| p.cod_prof = pd.cod_prof  (PROFESSORES_DISCIPLINAS) |X| d.cod_disc = pd.cod_disc (DISCIPLINAS) 
 

PROD_CARTERSIANO_1 = (PROFESSORES_DISCIPLINAS) X p.cod_prof = pd.cod_prof (PROFESSORES) 

PROD_CARTESIANO_2 = PROD_CARTESIANO_1 X d.cod_disc = pd.cod_disc (DISCIPLINAS) 

EXCESSÃO <-- Π P.COD_PROF ((PROFESSORES) AS P|X| p.cod_prof = pd.cod_prof  (PROFESSORES_DISCIPLINAS) AS PD |X| D.COD_DISC = PD.COD_DISC (DISCIPLINAS)) α (PD.DATA_AULA BETWEEN '2006-01-1' AND '2020-12-31')  
*/


-- POC 2: Quais sao as diciplinas que foram ministradas menos de 3 vezes 

create view materias_mais_tres as  

select d.nome_disciplina as 'Disciplina ministrada', count(pd.cod_disc) as 'Quantidade de vezes' 

from DISCIPLINAS as d join PROFESSORES_DISCIPLINAS as pd 

on d.cod_disc = pd.cod_disc 

group by pd.cod_disc 

having count(pd.cod_disc) > 3 or count(pd.cod_disc) = 3; 

-- Uso da view:  

select * from materias_mais_tres;  

/*
 

Expressão: 
Π d.nome_disciplina as 'Disciplina ministrada', count(pd.cod_disc) as 'Quantidade de vezes' (α contador(pd.cod_disc) > 3 V count(pd.cod_disc) = 3) (MATCHING UM)) 

MATCHING UM<--(DISCIPLINAS as D) x d.cod_disc = pd.cod_disc (PROFESSORES DISCIPLINAS as PD), DISCIPLINAS |X| PROFESSORES DISCIPLINAS 
*/