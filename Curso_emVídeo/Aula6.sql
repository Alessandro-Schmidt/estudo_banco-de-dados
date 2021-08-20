-- Hoje vamos aprender os comandos alter table e drop table
-- Banco de dados -> tabelas -> campos (column) 
-- EX: 
desc pessoas; -- Este comando descreve a tabela pessoas, equivalente a describe; 
-- Como adicionar uma coluna? 
alter table pessoas
add column profissao varchar(10); 
 
