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
