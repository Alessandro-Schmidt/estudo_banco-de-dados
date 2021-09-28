create table gafanhoto_assiste_curso(
id int auto_increment,
data date, 
idgafanhoto int, 
idcurso int, 
primary key(id),
foreign key (idgafanhoto) references gafanhotos(id),
foreign key (idcurso) references cursos(idcurso)
)default charset = utf8; 

