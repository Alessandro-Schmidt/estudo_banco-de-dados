/*
Nesta aula iremos estudar sobre Manipulação de Linhas. 
(UPDATE DELETE and TRUNCATE)
*/

select * from Gafanhotos; 
select * from cursos; 

insert into cursos values
('12', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('13','Logica', 'Lógica de programação', '20', '15','2014'),
('14', 'Photoshop', 'Dicas de Photoshop CC', '10', '8', '2014'),
('15', 'PGP', 'Curso de PHP para iniciantes','40', '20', '2010'),
('16', 'Jarva', 'Introdução a Linguagem Java','10', '29', '2000'),
('17', 'MySQL Workbench', 'Banco de dados MySQL','30', '15', '2016'),
('18', 'Word', 'Curso completo de Word','40', '30', '2016'),
('19', 'Sapateado', 'Danças Rítmicas','40', '30', '2018'),
('20', 'Cozinha Árabe', 'Aprenda a fazer comidas do oriente','40', '30', '2019'),
('21', 'YouTuber', 'Gerando Intrigas com o YouTube','5', '2', '2018');


update cursos 
set nome = 'HTML5 aulas complementares' 
where idcurso = '12'; 

update cursos
set nome = 'PHP', ano = '2019'
where idcurso=  '15'; 

update cursos
set nome = 'Java aulas', ano = '2001'
where idcurso = '16';

update cursos 
set carga = '30'
where ano = '2018'; -- Este comando não funciona por causa do MySQL Workbench.

-- Deletando linhas: 

delete from cursos 
where idcurso='21'; 

delete from cursos 
where idcurso='20'; 

delete from cursos 
where idcurso='19'; 

delete from cursos 
where ano='2018';

-- Apagando todos os registros de uma tabela: 
truncate table cursos; 

-- ou 

truncate cursos; 


