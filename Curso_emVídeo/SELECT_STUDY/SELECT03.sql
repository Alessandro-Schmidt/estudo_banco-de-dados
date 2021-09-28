-- Obtendo dados das tabelas: 

-- Distinguindo: o distinct considera apenas uma ocorrência dentro de cada tabela. Evita repetições

-- Agrupando: Há repetições, mas os valores iguais estão sempre juntos. 

-- Unindo os dois conceitos: 

select carga, count(nome) from cursos 
group by carga; 

select carga, count(nome) from cursos where totaulas = 30
group by carga;