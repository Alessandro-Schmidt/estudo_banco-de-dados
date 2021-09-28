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
select min(totaulas) from cursos; 

-- SOMA

select sum(totaulas) from cursos; 

select sum(totaulas) from cursos where ano = '2016'; 

-- Média (avarage)

select avg(totaulas) from cursos; 

select avg(totaulas) from cursos where ano = '2016'; 

-- EXercícios: 
-- 1 uma lista com todas as gafanhotas: 
desc gafanhotos; 
select * from gafanhotos where sexo='F'
order by nome; 

-- 2 lista com os dados de todos aqueles que nasceram entre 01/01/2000 e 31/12/2015
select * from gafanhotos where nascimento between '2000-01-01' and '2015-12-31' order by nascimento; 

-- 3 Uma lista com o nome de todos os homens que trabalham como programadores: 
select * from gafanhotos where sexo = 'M' and profissao='Programador' order by nome; 

-- 04 uma lista com os dados de todas as mulheres que nasceram no brasil e que tem seu nome iniciando com a letra J
select * from gafanhotos where sexo= 'F' and nacionalidade = 'Brasil' and nome like 'J%' order by nome; 

-- 5 uma lista com o nome e nacionalidade de todos os homens que tem silva no primeiro nome, não nasceram no brasil e pesam menos de 100kg
select nome, nacionalidade from gafanhotos where sexo = 'M' and nome like 'silva' and nacionalidade<> 'Brasil' and peso<100; 

-- 6 Qual a maior altura entre homens que moram no brasil 
select max(altura) from gafanhotos where sexo = 'M' and nacionalidade='Brasil';

-- 7 Qual a média de peso daqueles cadastrados? 
select avg(peso) from gafanhotos; 

-- 8 Qual o menor peso entre as mulheres que nasceram fora do brasil entre 01/01/1990 e 31/12/2000
select min(peso) from gafanhotos where sexo = 'F' and nacionalidade<>'Brasil' and nascimento between '1990-01-01' and '2000-12-31';

-- 9 quantas gafanhotas mulheres tem mais de 1.9 de altura? 
select count(*) from gafanhotos where sexo='F' and altura>'1.9';  