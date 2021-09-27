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

-- Selecionando valores: 
select nome, descricao,ano from cursos
where ano <= 2016
order by ano, nome; 

-- Setando um range de valores: 
select * from cursos 
where totaulas between 20 and 30
order by totaulas;

select nome, ano from cursos 
where ano between 2014 and 2016
order by ano desc, nome;

-- in 

select nome, descricao, ano from cursos 
where ano in (2014, 2016)
order by ano; 

-- selecionando ainda mais valores

select nome, carga, totaulas from cursos 
where carga > 35 and totaulas<30
order by totaulas desc;

-- SELECT = DQL (Data query Language)