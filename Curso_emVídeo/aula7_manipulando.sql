/*
Esta aula é sobre registros, linhas ou tuplas. 
*/
use cadastro;
select * from gafanhotos;
select * from cursos;
describe cursos;
use cadastro; 


insert into cursos values
('3', 'Algorítmos', 'Lógica Algorítmica', '8', '13', '2006'),
('4', 'Eng de Requisitos', 'Prof Sheila', '4', '16', '2004'),
('5', 'IHC', 'Interface humano computador', '8', '4', '2007'),
('6', 'POO', 'Professor MArk', '26', '15', '2012'),
('7', 'JAVAr', 'Cnomeidcursourso de JAVAr e etc', '0', '15', '2001'),
('8', 'Edição de vídeos', 'Editando vídeos com Schmidt', '9', '10', '2016'),
('9', 'Yourtube', 'Curso para não ter juízo', '9', '10', '2013'),
('10', 'Js', 'Professor Linux', '45', '17', '1997'),
('11', 'Modelagem de processos', 'Professora Regina, um amor', '4', '15', '2020'),
('12', 'MySql', 'Curso da professora Deborah e do Guanabara', '50', '35', '2021');

select * from cursos;

update cursos
set nome = 'HTML5'
where idcurso = '1';

select * from cursos;

update cursos
set idcurso = '2'
where idcurso='3';

-- Mudando dois campos ao mesmo tempo: 
update cursos
set nome = 'JAVA', ano = '2009'
where idcurso = '6';

select * from cursos;