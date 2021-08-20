-- Hoje vamos aprender os comandos alter table e drop table
-- Banco de dados -> tabelas -> campos (column) 
-- EX: 
use cadastro;
desc pessoas; -- Este comando descreve a tabela pessoas, equivalente a describe; 
-- Como adicionar uma coluna? 
alter table pessoas
add column profissao varchar(10); 
select * from pessoas; -- Você repara que a coluna profissão aparece como nula; 
-- A profissão foi adicionada como último campo; 
-- Para alterar a posição, primeiro precisamos eliminar ela; 
-- Com o comando: 
alter table pessoas 
drop column profissao;
-- Agora escolhemos a nova posição!
alter table pessoas 
add column profissao varchar(10) after nome; -- não existe before. 
select * from pessoas;
-- Se desejas que a nova coluna seja o primeiro campo da tabela, deves: 
alter table pessoas 
add column cpf int first;
-- Se não por nada, ele considera a posição como última. 
-- ***IMPORTANTE*** 
-- A palavra column pode ser suprimida sem prejuízo ao código; 
-- <<<<<<<<>>>>>>>>
-- Para alterar a estrutura da definição, use: 
-- alter table pessoas 
-- modify column profissao varchar(20); -- Não é possível renomear o campo com este comando, apenas alterar o seu tipo de variável. 
select * from pessoas;
describe pessoas;
-- ...
-- ...
-- Este comando não funciona, pois já existem dados, e ele não consegue adicionar uma variável do tipo obrigatória, pois não preenche dados que já estão armazenados; 

-- Já esse código aqui funciona: 
alter table pessoas
modify profissao varchar(20) not null default ''; 
 -- Nesse caso funciona, pois você dá uma resposta padrão para o atributo, o que faz com que ele seja capaz de preencher os dados já existentes com a mensagem padrão. 


-- Mudar nome de coluna: 
alter table pessoas
change column profissao prof varchar(20); 

-- Para renomear a tabela; 
alter table pessoas
rename to Gafanhotos;

desc Gafanhotos;

create table if not exists cursos(
nome varchar(30) not null unique, -- Primary key ≠ unique 
descricao text,
carga int unsigned, -- Sem sinal!  
totalaulas int,
ano year default '2016'
)default charset = utf8;
-- Crie caso já não exista; 
-- Primary key ≠ unique : Primeary key possui outras características. Unique não identifica os registros, porém não permite suas duplicidades; 

-- create table if not exists Gafanhotos(teste,int); -- Esse código não funciona pois já existe. 

-- Vamos adicionar a primary key; 
alter table cursos 
add column idcurso int first; 

-- Agora: 
alter table cursos
add primary key(idcurso);
describe cursos;