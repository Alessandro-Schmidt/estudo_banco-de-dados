/*
Avaliação realizada por Alessandro Maciel Schmidt; 
*/
create database hospital;
use hospital; 

create table paciente(
numero_paciente int primary key, 
nome_paciente varchar(20) not null
); 
alter table paciente
add column sobrenome varchar(20) after nome_paciente; 

INSERT INTO `hospital`.`paciente` (`numero_paciente`, `nome_paciente`, `sobrenome`, `convenio_paciente`) VALUES ('1', 'Alessandro', 'Schmidt', '1');
INSERT INTO `hospital`.`paciente` (`numero_paciente`, `nome_paciente`, `sobrenome`, `convenio_paciente`) VALUES ('2', ' Magda', 'Abgail', '1');
INSERT INTO `hospital`.`paciente` (`numero_paciente`, `nome_paciente`, `sobrenome`, `convenio_paciente`) VALUES ('3', 'Alessandro', 'Maciel', '1');
INSERT INTO `hospital`.`paciente` (`numero_paciente`, `nome_paciente`, `sobrenome`, `convenio_paciente`) VALUES ('4', 'Heloísa', 'Lorenzet', '2');
INSERT INTO `hospital`.`paciente` (`numero_paciente`, `nome_paciente`, `sobrenome`, `convenio_paciente`) VALUES ('5', 'Ana', 'Raquel', '2');
INSERT INTO `hospital`.`paciente` (`numero_paciente`, `nome_paciente`, `sobrenome`, `convenio_paciente`) VALUES ('6', 'Magnus', 'Carlsen', '2');
INSERT INTO `hospital`.`paciente` (`numero_paciente`, `nome_paciente`, `sobrenome`, `convenio_paciente`) VALUES ('7', 'Alireza ', 'Firouja', '3');
INSERT INTO `hospital`.`paciente` (`numero_paciente`, `nome_paciente`, `sobrenome`, `convenio_paciente`) VALUES ('8', 'Maxime', 'Vachier', '3');
INSERT INTO `hospital`.`paciente` (`numero_paciente`, `nome_paciente`, `sobrenome`, `convenio_paciente`) VALUES ('9', 'Ivan', 'Latouc', '3');


create table medico(
crm int primary key, 
nome_medico varchar(20) not null
);
select * from medico; 
INSERT INTO `hospital`.`medico` (`crm`, `nome_medico`, `convenio_medico`) VALUES ('1111', 'Adamastor', '1');
INSERT INTO `hospital`.`medico` (`crm`, `nome_medico`, `convenio_medico`) VALUES ('1112', 'Ana Maria', '1');
INSERT INTO `hospital`.`medico` (`crm`, `nome_medico`, `convenio_medico`) VALUES ('1113', 'Carlos', '2');
INSERT INTO `hospital`.`medico` (`crm`, `nome_medico`, `convenio_medico`) VALUES ('1114', 'Sabrina', '2');
INSERT INTO `hospital`.`medico` (`crm`, `nome_medico`, `convenio_medico`) VALUES ('1115', 'Thyerri', '1');
INSERT INTO `hospital`.`medico` (`crm`, `nome_medico`, `convenio_medico`) VALUES ('1116', 'Carolina', '2');
INSERT INTO `hospital`.`medico` (`crm`, `nome_medico`, `convenio_medico`) VALUES ('1117', 'Alessandro', '1');
INSERT INTO `hospital`.`medico` (`crm`, `nome_medico`, `convenio_medico`) VALUES ('1118', 'Ana Raquel', '3');
INSERT INTO `hospital`.`medico` (`crm`, `nome_medico`, `convenio_medico`) VALUES ('1119', 'Agon', '2');


create table telefone_paciente( -- Atributo multivalorado de telefone de paciente 
cod_telefone int primary key, 
telefone int, 
tipo_telefone enum('RESIDENCIAL', 'TRABALHO', 'OUTRO'), 
id_paciente int
);
alter table telefone_paciente
add foreign key (id_paciente) references paciente(numero_paciente); 
INSERT INTO `hospital`.`telefone_paciente` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_paciente`) VALUES ('1', '123123', 'TRABALHO', '1');
INSERT INTO `hospital`.`telefone_paciente` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_paciente`) VALUES ('2', '333333', 'RESIDENCIAL', '2');
INSERT INTO `hospital`.`telefone_paciente` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_paciente`) VALUES ('3', '444444', 'OUTRO', '3');
INSERT INTO `hospital`.`telefone_paciente` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_paciente`) VALUES ('4', '555555', 'OUTRO', '4');
INSERT INTO `hospital`.`telefone_paciente` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_paciente`) VALUES ('5', '667667', 'RESIDENCIAL', '5');
INSERT INTO `hospital`.`telefone_paciente` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_paciente`) VALUES ('6', '776776', 'TRABALHO', '6');
INSERT INTO `hospital`.`telefone_paciente` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_paciente`) VALUES ('7', '888888', 'RESIDENCIAL', '7');
INSERT INTO `hospital`.`telefone_paciente` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_paciente`) VALUES ('8', '999999', 'OUTRO', '8');
INSERT INTO `hospital`.`telefone_paciente` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_paciente`) VALUES ('9', '191919', 'OUTRO', '9');

create table telefone_medico( -- Atributo multivalorado de telefone do médico
cod_telefone int primary key,
telefone int, 
tipo_telefone enum('RESIDENCIAL', 'TRABALHO', 'OUTRO'), 
id_medico int
);
alter table telefone_medico
add foreign key (id_medico) references medico(crm); 
INSERT INTO `hospital`.`telefone_medico` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_medico`) VALUES ('1', '111111', 'OUTRO', '1111');
INSERT INTO `hospital`.`telefone_medico` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_medico`) VALUES ('2', '212333', 'RESIDENCIAL', '1112');
INSERT INTO `hospital`.`telefone_medico` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_medico`) VALUES ('3', '199999', 'TRABALHO', '1113');
INSERT INTO `hospital`.`telefone_medico` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_medico`) VALUES ('4', '222000', 'TRABALHO', '1114');
INSERT INTO `hospital`.`telefone_medico` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_medico`) VALUES ('5', '1111222', 'TRABALHO', '1115');
INSERT INTO `hospital`.`telefone_medico` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_medico`) VALUES ('6', '1212', 'OUTRO', '1116');
INSERT INTO `hospital`.`telefone_medico` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_medico`) VALUES ('7', '444222', 'RESIDENCIAL', '1117');
INSERT INTO `hospital`.`telefone_medico` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_medico`) VALUES ('8', '2112', 'OUTRO', '1118');
INSERT INTO `hospital`.`telefone_medico` (`cod_telefone`, `telefone`, `tipo_telefone`, `id_medico`) VALUES ('9', '5556777', 'OUTRO', '1119');


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

INSERT INTO `hospital`.`consulta` (`cod_consulta`, `crm_medico`, `numero_paciente`) VALUES ('1', '1111', '2');
INSERT INTO `hospital`.`consulta` (`cod_consulta`, `crm_medico`, `numero_paciente`) VALUES ('2', '1111', '1');
INSERT INTO `hospital`.`consulta` (`cod_consulta`, `crm_medico`, `numero_paciente`) VALUES ('3', '1111', '3');
INSERT INTO `hospital`.`consulta` (`cod_consulta`, `crm_medico`, `numero_paciente`) VALUES ('4', '1111', '4');
INSERT INTO `hospital`.`consulta` (`cod_consulta`, `crm_medico`, `numero_paciente`) VALUES ('5', '1111', '5');
INSERT INTO `hospital`.`consulta` (`cod_consulta`, `crm_medico`, `numero_paciente`) VALUES ('6', '1112', '6');
INSERT INTO `hospital`.`consulta` (`cod_consulta`, `crm_medico`, `numero_paciente`) VALUES ('7', '1113', '7');
INSERT INTO `hospital`.`consulta` (`cod_consulta`, `crm_medico`, `numero_paciente`) VALUES ('8', '1114', '8');
INSERT INTO `hospital`.`consulta` (`cod_consulta`, `crm_medico`, `numero_paciente`) VALUES ('9', '1119', '9');
INSERT INTO `hospital`.`consulta` (`cod_consulta`, `crm_medico`, `numero_paciente`) VALUES ('10', '1111', '9');
INSERT INTO `hospital`.`consulta` (`cod_consulta`, `crm_medico`, `numero_paciente`) VALUES ('11', '1111', '8');
INSERT INTO `hospital`.`consulta` (`cod_consulta`, `crm_medico`, `numero_paciente`) VALUES ('12', '1114', '1');
INSERT INTO `hospital`.`consulta` (`cod_consulta`, `crm_medico`, `numero_paciente`) VALUES ('13', '1116', '1');



create table exame_recomendado( -- Atributo multivalorado, vira tabela na normalização
cod_exame_recomendado int primary key, 
exame varchar(90),
cod_consulta int 
);
alter table exame_recomendado
add foreign key (cod_consulta) references consulta(cod_consulta);

INSERT INTO `hospital`.`exame_recomendado` (`cod_exame_recomendado`, `exame`, `cod_consulta`) VALUES ('1', 'Ultrasom', '1');
INSERT INTO `hospital`.`exame_recomendado` (`cod_exame_recomendado`, `exame`, `cod_consulta`) VALUES ('2', 'Radioterapia', '2');
INSERT INTO `hospital`.`exame_recomendado` (`cod_exame_recomendado`, `exame`, `cod_consulta`) VALUES ('3', 'Ultrasom', '3');
INSERT INTO `hospital`.`exame_recomendado` (`cod_exame_recomendado`, `exame`, `cod_consulta`) VALUES ('4', 'Radioterapia', '4');
INSERT INTO `hospital`.`exame_recomendado` (`cod_exame_recomendado`, `exame`, `cod_consulta`) VALUES ('5', 'Holter', '5');
INSERT INTO `hospital`.`exame_recomendado` (`cod_exame_recomendado`, `exame`, `cod_consulta`) VALUES ('6', 'Radioterapia', '6');
INSERT INTO `hospital`.`exame_recomendado` (`cod_exame_recomendado`, `exame`, `cod_consulta`) VALUES ('7', 'Ultrasom', '7');
INSERT INTO `hospital`.`exame_recomendado` (`cod_exame_recomendado`, `exame`, `cod_consulta`) VALUES ('8', 'Radioterapia', '8');
INSERT INTO `hospital`.`exame_recomendado` (`cod_exame_recomendado`, `exame`, `cod_consulta`) VALUES ('9', 'Holter', '8');
INSERT INTO `hospital`.`exame_recomendado` (`cod_exame_recomendado`, `exame`, `cod_consulta`) VALUES ('10', 'Holter', '1');
INSERT INTO `hospital`.`exame_recomendado` (`cod_exame_recomendado`, `exame`, `cod_consulta`) VALUES ('11', 'Radioterapia', '12');
INSERT INTO `hospital`.`exame_recomendado` (`cod_exame_recomendado`, `exame`, `cod_consulta`) VALUES ('12', 'Mapa', '11');
INSERT INTO `hospital`.`exame_recomendado` (`cod_exame_recomendado`, `exame`, `cod_consulta`) VALUES ('13', 'Mapa', '10');


create table medicamento_receitado( -- Atributo multivalorado, vira tabela na normalização
cod_medicamento_recomendado int primary key, 
medicamento_receitado varchar(50),
cod_consulta int 
); 
alter table medicamento_receitado
add foreign key (cod_consulta) references consulta(cod_consulta);

INSERT INTO `hospital`.`medicamento_receitado` (`cod_medicamento_recomendado`, `medicamento_receitado`, `cod_consulta`) VALUES ('1', 'Ibuprofeno', '1');
INSERT INTO `hospital`.`medicamento_receitado` (`cod_medicamento_recomendado`, `medicamento_receitado`, `cod_consulta`) VALUES ('2', 'Paracetamol', '1');
INSERT INTO `hospital`.`medicamento_receitado` (`cod_medicamento_recomendado`, `medicamento_receitado`, `cod_consulta`) VALUES ('3', 'Antialérgico', '2');
INSERT INTO `hospital`.`medicamento_receitado` (`cod_medicamento_recomendado`, `medicamento_receitado`, `cod_consulta`) VALUES ('4', 'Vitamina D', '4');
INSERT INTO `hospital`.`medicamento_receitado` (`cod_medicamento_recomendado`, `medicamento_receitado`, `cod_consulta`) VALUES ('5', 'Antialérgico', '5');
INSERT INTO `hospital`.`medicamento_receitado` (`cod_medicamento_recomendado`, `medicamento_receitado`, `cod_consulta`) VALUES ('6', 'Beta Bloqueador', '6');
INSERT INTO `hospital`.`medicamento_receitado` (`cod_medicamento_recomendado`, `medicamento_receitado`, `cod_consulta`) VALUES ('7', 'Melatonina', '7');
INSERT INTO `hospital`.`medicamento_receitado` (`cod_medicamento_recomendado`, `medicamento_receitado`, `cod_consulta`) VALUES ('8', 'Beta Bloqueador', '7');
INSERT INTO `hospital`.`medicamento_receitado` (`cod_medicamento_recomendado`, `medicamento_receitado`, `cod_consulta`) VALUES ('9', 'Antialérgico', '9');
INSERT INTO `hospital`.`medicamento_receitado` (`cod_medicamento_recomendado`, `medicamento_receitado`, `cod_consulta`) VALUES ('10', 'Beta Bloqueador', '10');
INSERT INTO `hospital`.`medicamento_receitado` (`cod_medicamento_recomendado`, `medicamento_receitado`, `cod_consulta`) VALUES ('11', 'Beta Bloqueador', '12'); 

create table diagnostico(
cod_diagnostico int primary key,
diagnostico varchar(150),
cod_consulta int
);
alter table diagnostico
add foreign key (cod_consulta) references consulta(cod_consulta);

INSERT INTO `hospital`.`diagnostico` (`cod_diagnostico`, `diagnostico`, `cod_consulta`) VALUES ('1', 'Muito bom prognóstico', '1');
INSERT INTO `hospital`.`diagnostico` (`cod_diagnostico`, `diagnostico`, `cod_consulta`) VALUES ('2', 'Precisa ver um especialista', '2');
INSERT INTO `hospital`.`diagnostico` (`cod_diagnostico`, `diagnostico`, `cod_consulta`) VALUES ('3', 'Muito bom prognóstico', '3');
INSERT INTO `hospital`.`diagnostico` (`cod_diagnostico`, `diagnostico`, `cod_consulta`) VALUES ('4', 'Precisa de cirurgia', '4');
INSERT INTO `hospital`.`diagnostico` (`cod_diagnostico`, `diagnostico`, `cod_consulta`) VALUES ('5', 'Precisa ver outro médico', '5');
INSERT INTO `hospital`.`diagnostico` (`cod_diagnostico`, `diagnostico`, `cod_consulta`) VALUES ('6', 'Precisa ver outro médico', '6');
INSERT INTO `hospital`.`diagnostico` (`cod_diagnostico`, `diagnostico`, `cod_consulta`) VALUES ('7', 'Muito bom prognóstico', '7');
INSERT INTO `hospital`.`diagnostico` (`cod_diagnostico`, `diagnostico`, `cod_consulta`) VALUES ('8', 'Precisa de cirurgia', '8');
INSERT INTO `hospital`.`diagnostico` (`cod_diagnostico`, `diagnostico`, `cod_consulta`) VALUES ('9', 'Precisa de cirurgia', '9');
INSERT INTO `hospital`.`diagnostico` (`cod_diagnostico`, `diagnostico`, `cod_consulta`) VALUES ('10', 'Muito bom prognóstico', '10');


create table convenio(
cod_convenio int primary key, 
nome varchar(20) not null
);
INSERT INTO `hospital`.`convenio` (`cod_convenio`, `nome`) VALUES ('1', 'Unimed');
INSERT INTO `hospital`.`convenio` (`cod_convenio`, `nome`) VALUES ('2', 'IPE');
INSERT INTO `hospital`.`convenio` (`cod_convenio`, `nome`) VALUES ('3', 'PUCPR');
INSERT INTO `hospital`.`convenio` (`cod_convenio`, `nome`) VALUES ('4', 'SICREDI');
INSERT INTO `hospital`.`convenio` (`cod_convenio`, `nome`) VALUES ('5', 'AgroBrasil');

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
2ª - Qual o convênio do médico com mais consultas registradas? 
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
select m.crm, m.nome_medico, conv.nome, count(c.crm_medico)
from medico as m inner join convenio as conv
on m.convenio_medico = conv.cod_convenio
join consulta as c on c.crm_medico = m.crm
group by m.crm
order by count(c.crm_medico) desc;


-- 3ª QUESTÃO
select exame, count(exame) from exame_recomendado
where exame<>'Ultrasom'
group by exame desc;

