/*
Avaliação realizada por Alessandro Maciel Schmidt; 
*/
create database hospital;
use hospital; 

create table paciente(
numero_paciente int primary key, 
nome_paciente varchar(20) not null
); 

create table medico(
crm int primary key, 
nome_medico varchar(20) not null
);

create table telefone_paciente( -- Atributo multivalorado de telefone de paciente 
cod_telefone int primary key, 
telefone int, 
tipo_telefone enum('RESIDENCIAL', 'TRABALHO', 'OUTRO'), 
id_paciente int
);
alter table telefone_paciente
add foreign key (id_paciente) references paciente(numero_paciente); 

create table telefone_medico( -- Atributo multivalorado de telefone do médico
cod_telefone int primary key,
telefone int, 
tipo_telefone enum('RESIDENCIAL', 'TRABALHO', 'OUTRO'), 
id_medico int
);

alter table telefone_medico
add foreign key (id_medico) references medico(crm); 


create table consulta(
cod_consulta int primary key, 
data_hora datetime,
crm_medico int, 
numero_paciente int
);
alter table consulta
add foreign key (crm_medico) references medico(crm); 

alter table consulta
add foreign key (numero_paciente) references paciente(numero_paciente);

create table exame_recomendado( -- Atributo multivalorado, vira tabela na normalização
cod_exame_recomendado int primary key, 
exame varchar(90),
cod_consulta int 
);


alter table exame_recomendado
add foreign key (cod_consulta) references consulta(cod_consulta);

create table medicamento_receitado( -- Atributo multivalorado, vira tabela na normalização
cod_medicamento_recomendado int primary key, 
medicamento_receitado varchar(50),
cod_consulta int 
); 
alter table medicamento_receitado
add foreign key (cod_consulta) references consulta(cod_consulta);

create table diagnostico(
cod_diagnostico int primary key,
diagnostico varchar(150),
cod_consulta int
);
alter table diagnostico
add foreign key (cod_consulta) references consulta(cod_consulta);


create table convenio(
cod_convenio int primary key, 
nome varchar(20) not null
);

alter table medico
add column convenio_medico int; 

alter table medico 
add foreign key (convenio_medico) references convenio(cod_convenio); 

alter table paciente
add column convenio_paciente int; 

alter table paciente 
add foreign key (convenio_paciente) references convenio(cod_convenio); 


/*
Questão 3 - 
Propor textualmente 3 INFORMACOES (adotar padrão comentário para esta textualização). Garantir que a primeira exija a vinculação de duas tabelas
Garantir que a segunda exija a vinculação de três tabelas
Garantir que a terceira exija o operador da álgebra relacional diferença

R: 
1ª - Qual o médico com mais consultas registradas? 
2ª - Qual o convênio que mais envia pacientes para consultas? 
3ª - Além do exame de ultrasom, qual é o exame mais recomendado por médicos em consultas? 
*/

-- Questão 4: 
-- 1ª pergunta: 
select * from medico;
use hospital; 

select distinct c.crm_medico ,m.nome_medico, count(c.crm_medico) 
from consulta as c inner join medico as m
on c.crm_medico = m.crm
group by c.crm_medico; 


-- 2ª QUESTÃO
select distinct num_paciente, count(cod_consulta) from consulta;

select conv.nome, count(cons.cod_consulta)
from convenio as conv inner join consulta as cons





