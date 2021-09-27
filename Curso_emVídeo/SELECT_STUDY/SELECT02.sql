select * from cursos 
where nome = 'PHP'; 

-- Operador like
select * from cursos
where nome like 'P%'; -- P seguido de qualquer coisa

-- Wildcards
select * from cursos 
where nome like '%a'; -- Todos que terminam com a letra a 

select * from cursos 
where nome like '%a%';  -- A em qualquer lugar

select * from cursos
where nome like 'ph%p%'; -- Comece com PH, tenha p, e termine de qualquer outro jeito

-- Lista de nomes não repetidos: 
select distinct nacionalidade from gafanhotos
order by nacionalidade; 

-- Funções de agregações
select count(*) from cursos; 

select count(*) from cursos where carga > 40; 

-- MAX 
select max(carga) from cursos; 

select max(totaulas) from cursos where ano = '2016'; 

-- MIN 
select nome, min(totaulas) from cursos;