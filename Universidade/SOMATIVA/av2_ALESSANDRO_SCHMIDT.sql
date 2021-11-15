/*
Questao 5 - Considerando o modelo construido na questao 4 
            5.1 Construa uma instrução SELECT que extraia a informação que necessite a adoção do operador relacional de diferenca (ATRIBUTO <> VALOR)

5 minutos
 
Questao 6 - Considerando o modelo construido na questao 4 
            6.1 altere o modelo fisico de tal forma que exija a adoção do operador da diferenca entre conjuntos para a extração de uma informação
            6.2 atualize a populacao do modelo fisico conforme a alteração (6.1)
            6.3 Construa uma instrução SELECT que extraia a informação que necessite a adoção do operador de doferenca entre conjuntos
*/
create database escolinha_do_schmidt; 
use escolinha_do_schmidt;
create table alunos(
cod_aluno int primary key auto_increment,
nome_aluno varchar (15),
sobrenome_aluno varchar(15), 
nascimento_aluno date
);

create table professores(
cod_professor int primary key auto_increment,
nome_professor varchar(15),
sobrenome_professor varchar(15),
disciplina_professor varchar(20)
);



create table avaliacoes(
cod_avaliacao int primary key auto_increment,
cod_professor int,
cod_aluno int,
nota_avaliacao float, 
situacao enum ('aprovado', 'reprovado')
);

alter table avaliacoes
add foreign key (cod_professor) references professores(cod_professor); 
alter table avaliacoes add foreign key (cod_aluno) references alunos(cod_aluno);

insert into alunos (nome_aluno, sobrenome_aluno, nascimento_aluno) values 
('Alessandro', 'Schmidt', '2001-04-28'),
('Giulia', 'Carvalho', '2000-1-7'),
('Vinicius', 'Kuchnir', '2004-3-4' ), 
('Andre', 'Delphino', '2001-4-7'),
('Larissa', 'Nichetti', '2000-8-9'),
('John', 'Lennon', '2007-5-6'),
('Paul', 'McCartney', '2000-3-1'),
('Ringo', 'Star', '2001-5-06'),
('George', 'Harrison', '2001-4-2'),
('Heloisa', 'Lorenzet', '2000-1-17');


insert into professores(nome_professor, sobrenome_professor, disciplina_professor) values
('Sheila', 'Reinehr', 'Eng de Requisitos'), 
('Marco', 'Paludo', 'Verificação'),
('Regina', 'Philange', 'Processos'),
('Andreia', 'Malucelli', 'Programação'),
('Deborah', 'Ribeiro', 'Banco de Dados'); 

select * from professores;

insert into avaliacoes (cod_professor, cod_aluno, nota_avaliacao, situacao) values 
('1', '1', '7.5', 'aprovado'),
('1', '2', '8.5', 'aprovado'),
('1', '3', '6.5', 'reprovado'),
('1', '4', '9.5', 'aprovado'),
('1', '5', '10', 'aprovado'),
('1', '6', '7.0', 'aprovado'),
('1', '7', '5.7', 'reprovado'),
('1', '8', '7.9', 'aprovado'),
('1', '9', '3.5', 'reprovado'),
('1', '10', '2.5', 'reprovado'),
('2', '1', '8.5', 'aprovado'),
('2', '2', '9.5', 'aprovado'),
('2', '3', '5.5', 'reprovado'),
('2', '4', '2.5', 'reprovado'),
('2', '5', '8.4', 'aprovado'),
('2', '6', '10', 'aprovado'),
('2', '8', '5', 'reprovado'),
('2', '9', '5.3', 'reprovado'),
('2', '10', '5.2', 'reprovado'),
('3', '1', '8', 'aprovado'),
('3', '2', '6.9', 'reprovado'),
('3', '3', '10', 'aprovado'),
('3', '4', '5', 'reprovado'),
('3', '5', '7.5', 'aprovado'),
('3', '6', '9.6', 'aprovado'),
('3', '7', '10', 'aprovado'),
('3', '8', '1.3', 'reprovado'),
('3', '9', '7', 'aprovado')
; 

/*
1.3 Construa uma instrução SELECT que extraia informação, 
que necessite a adoção do operador JUNCAO, tambem de SELECAO e 
tambem de PROJECAO (todos da ALGEBRA RELACIONAL)
*/

/*
Qual o nome dos alunos que farão recuperação de qualquer prova? (nota abaixo de 7)
*/
select a.nome_aluno as 'alunos em recuperação', count(n.cod_aluno) as 'Qtdd de provas para fazer'
from alunos as a inner join avaliacoes as n
on a.cod_aluno = n.cod_aluno
where n.nota_avaliacao <7.0
group by a.nome_aluno
order by a.nome_aluno;

/*
Qual a lista dos estudantes que não nasceram no ano 2001? 
São 6 alunos que não nasceram em 2001.
*/

select a.nome_aluno, a.nascimento_aluno from alunos as a
where YEAR(a.nascimento_aluno) <> 2001;

/*
     3.1 Construa uma instrução SELECT que extraia a informação que necessite a adoção do operador de diferenca entre conjuntos
     qual aluno fez a prova do professor Marco Paludo e não da Professora Regina? 
     (aluno cujo código é 7 == Paul McCartney)
*/


select a.nome_aluno from avaliacoes as n join alunos as a
on a.cod_aluno = n.cod_aluno
where n.cod_professor = '3' and a.nome_aluno not in (select a.nome_aluno from avaliacoes as n join alunos as a
on a.cod_aluno = n.cod_aluno
where n.cod_professor = '2');



