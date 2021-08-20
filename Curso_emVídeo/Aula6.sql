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
 
