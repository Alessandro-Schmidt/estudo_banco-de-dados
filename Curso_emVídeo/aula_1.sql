create database cadastro;
/*
Tipos primitivos separam os dados nos seguintes tipos: 
1 - Numérico:
	1.1 - Real:
		1.1.1 - Decimal, Float, Double, Real
    1.2 - Inteiro:
		1.2.1 - TinyInt, SmallInt, Int, MediumInt, BigInt
    1.3 - Lógico:
		1.3.1 - Bit, Boolean
2 - Data / tempo:
	2.1 - Date, DateTime, TimeStamp, Time, Year
3 - Literal:
	3.1 - Caractere:
		3.1.1 - Char (fixo), VarChar (Variante)
    3.2 - Texto: 
		3.2.1 - TinyText, Text, MediumText, LongText
    3.3 - Binário:
		3.3.1 - TinyBlob, Blob, MediumBlob, LongBlob
    3.4 - Coleções:
		3.4.1 - Enum, Set (Quais caracteres podem ser aceitos)
4 - Espacial:
	4.1 - Geometry, Point, Polygon, MultiPolygon
*/
use cadastro;
create table pessoas(
nome varchar(30),
idade tinyint,
sexo char(1),
altura float,
peso float,
nacionalidade varchar(20)
); /* o ";" significa um comando*/

/*
Para saber a estrutura de uma da tabela, só use o comando abaixo:
*/
describe pessoas;
/*
Para terminal SQL, use /Applications/MAMP/Library/bin/mysql -uroot -proot   

Comandos terminal: 

show databases; mostra as databases criadas
use cadastro; usa a database cadastro
status; mostra o status
show tables; mostra as tabelas dentro desta database
describe pessoas; retorna quais são as colunas da database
*/
