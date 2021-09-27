-- Aqui estão os scripts usados para estudar para a prova do dia 28/09/2021

/*
Select aula 01
*/

-- Selecione todos os campos da tabela cursos; 
select * from cursos; 

-- ordenar pelo nome: 
select * from cursos
order by nome; 

-- Ordem alfabética invertida: 
select * from cursos 
order by nome desc; -- Descendent 

-- selecionando algumas colunas: 
select nome, carga, ano from 
cursos order by nome;

-- mudando sequência e mudando a ordenação: 

select ano, nome, carga from cursos 
order by ano;

-- adicionando mais uma ordenação alfabética para cada ano; 

select ano, nome, carga from cursos order by ano, nome; 

-- filtrando linhas: 

select * from cursos 
where ano = '2016'
order by idcurso; 

