create database estudo_av_2;
use estudo_av_2;
create table inicio(
nome varchar(20),
sobrenome varchar(40)
); 
insert into inicio values
('Alessandro', 'Maciel'),
('Marcio', 'Araújo'),
('Frederico', 'Westphallen');

select * from inicio;

start transaction; 
update inicio set nome = 'Alessandrinho' where nome = 'Alessandro';
commit; 
rollback;