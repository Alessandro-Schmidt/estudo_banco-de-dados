use cadastro;
insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Maria', '1955-05-30','F', '60.4', '1.45', 'Rússia');
-- No caso do id, ainda podemos declara-lo, usando o constrain DEFAULT como atributo, o que faz com que ele siga apenas a ordem lógica

insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default, 'Vladmir', '1917-08-12', 'M', '70.0', '1.70', 'Ucrânia');

-- Outros exemplos de DEFAULT
insert into pessoas
(id,nome,nascimento,sexo,peso,altura,nacionalidade)
values
(default, 'Trotsky','1950-04-28', 'M', '67.3', '1.72', default);

-- Se você for inserir os dados, e a ordem dos dados for igual a ordem dos dados no banco, não precisa usar a linha antes de values
-- Ex: 
insert into pessoas values
(default, 'Adalberto', '2001-05-20', 'M', '80.9', '1.30', default);

-- é possível usar um insert into, e cadastrar quantas pessoas eu quiser, por exemplo: 
insert into pessoas (id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default, 'Ana', '1978-06-21', 'F', '43.7', '1.70', default), 
(default, 'Joana', '1900-08-25', 'F', '47.5', '1.90', default),
(default, 'Heloísa', '2000-01-17', 'F', '49.8', '1.70', default);

select * from pessoas;

/*
Comentários: 
DDL - Data definition language 
Comandos: Create database; / create table; 
DML - Data manipulation language 
Comandos: insert into 
*/
