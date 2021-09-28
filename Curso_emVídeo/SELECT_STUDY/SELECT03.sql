-- Obtendo dados das tabelas: 

-- Distinguindo: o distinct considera apenas uma ocorrência dentro de cada tabela. Evita repetições

-- Agrupando: Há repetições, mas os valores iguais estão sempre juntos. 

-- Unindo os dois conceitos: 

select carga, count(nome) from cursos 
group by carga; 

select carga, count(nome) from cursos where totaulas = 30
group by carga;

-- having 
select ano, count(*) from cursos group by ano order by count(*) desc;

select ano, count(*) from cursos 
group by ano 
having count(ano) >=5
order by count(*) desc;

select ano, count(*) from cursos 
group by ano 
having count(ano) >30 -- Não funciona
order by count(*) desc;


select ano, count(*) from cursos 
group by ano 
having ano>2013
order by count(*) desc;

select ano, count(*) from cursos 
where totaulas>30
group by ano 
having ano>2013
order by count(*) desc;

select avg(carga) from cursos;

select carga, count(*) from cursos 
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos); -- Só aparece quem tem uma carga maior que a média das cargas, para isso, emende um select em outro. 

-- EX1 - Lista com todas as profissoes e seus quantitativos: 
select distinct profissao, count(*) from gafanhotos 
group by profissao; 

-- EX2 - 