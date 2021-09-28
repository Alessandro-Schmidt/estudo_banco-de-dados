-- Aula de foreign Keys e JOIN 

alter table gafanhotos 
add column cursopreferido int;

describe gafanhotos;

alter table gafanhotos 
add foreign key(cursopreferido) references cursos(idcurso); 

select * from gafanhotos;
select * from cursos; 

update gafanhotos set cursopreferido = '6' 
where id='1'; 

select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
from gafanhotos join cursos 
on cursos.idcurso = gafanhotos.cursopreferido; 

select gafanhotos.nome, cursos.nome, cursos.ano
from gafanhotos inner join cursos 
on cursos.idcurso = gafanhotos.cursopreferido
order by gafanhotos.nome; 

-- Simplificando
select g.nome, c.nome, c.ano
from gafanhotos as g inner join cursos as c
on c.idcurso = g.cursopreferido
order by g.nome; 

-- outer join
select g.nome, c.nome, c.ano
from gafanhotos as g left outer join cursos as c
on c.idcurso = g.cursopreferido; -- Mostra alunos que não tem curso preferido, dando prioridade para a tabela da esquerda (gafanhotos); 

select g.nome, c.nome, c.ano
from gafanhotos as g right outer join cursos as c
on c.idcurso = g.cursopreferido; -- Mostra os cursos que não tem alunos que gostam dele, da prioridade para a tabela da direita (cursos)

