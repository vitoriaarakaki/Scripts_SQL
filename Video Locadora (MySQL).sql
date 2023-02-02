/* DROP -- APAGA database */
DROP SCHEMA uninove_locadora;

/* CRIAÇÃO DE database e USAR */
CREATE DATABASE uninove_locadora;
USE uninove_locadora;
--
CREATE TABLE cliente (
cod_cli int primary key NOT NULL auto_increment,
nome varchar(50) NOT NULL,
sobrenome varchar(50) NOT NULL, 
endereco varchar(50),
telefone int NOT NULL
);
--
CREATE TABLE categoria (
cod_categ int primary key NOT NULL auto_increment,
descricao varchar(250)
);
--
CREATE TABLE ator (
cod_ator int primary key NOT NULL auto_increment,
nome_popular varchar(50) NOT NULL,
nome_artistico varchar(50), 
data_nasc date
);
--
CREATE TABLE filme ( 
cod_filme int primary key NOT NULL auto_increment,
titulo varchar(50) NOT NULL,
cod_categ int,
foreign key(cod_categ) references categoria(cod_categ)
);
--
CREATE TABLE DVD (
num_dvd int primary key NOT NULL auto_increment,
cod_filme int,
foreign key(cod_filme) references filme(cod_filme),
tipo char(1),
CHECK(tipo = "S" or tipo = "D")
);
--
CREATE TABLE ator_filme( /* RELACIONAMENTO ESTRELA */
cod_filme int,
foreign key(cod_filme) references filme(cod_filme),
cod_ator int,
foreign key(cod_ator) references ator(cod_ator),
primary key(cod_filme, cod_ator)
);
--
CREATE TABLE aluga( /* CLIENTE_DVD */
cod_aluga int primary key NOT NULL auto_increment,
cod_cli int,
foreign key(cod_cli) references cliente(cod_cli),
num_dvd int,
foreign key(num_dvd) references DVD(num_dvd),
data_ret date,
data_dev date
);
--
/* SELECIONAR TABELA */
SELECT * FROM cliente;
SELECT * FROM categoria;
SELECT * FROM ator;
SELECT * FROM filme;
SELECT * FROM DVD;
SELECT * FROM ator_filme;
SELECT * FROM aluga;
--
/* INSERIR */
/* CLIENTE */
INSERT INTO cliente(cod_cli, nome, sobrenome, endereco, telefone) VALUES (1, 'João', 'Silva', 'Rua da Cruz Sem Pé', '44441111');
INSERT INTO cliente(cod_cli, nome, sobrenome, endereco, telefone) VALUES (2, 'Antônio', 'Ferreira', 'Av. da Vila Velha', '66609333');
INSERT INTO cliente(cod_cli, nome, sobrenome, endereco, telefone) VALUES (3, 'Fabio', 'Dias', 'Rua Antonio Vieira', '23370393');
INSERT INTO cliente(cod_cli, nome, sobrenome, endereco, telefone) VALUES (4, 'Andreia', 'Melo', 'Rua da Praia Bonita', '89897777');
INSERT INTO cliente(cod_cli, nome, sobrenome, endereco, telefone) VALUES (5, 'Murilo', 'Fontes', 'Av. dos Autonomistas', '90909090');
--
/* CATEGORIA */
INSERT INTO categoria(cod_categ, descricao) VALUES (1, 'Comédia');
INSERT INTO categoria(cod_categ, descricao) VALUES (2, 'Drama');
INSERT INTO categoria(cod_categ, descricao) VALUES (3, 'Aventura');
INSERT INTO categoria(cod_categ, descricao) VALUES (4, 'Terror');
INSERT INTO categoria(cod_categ, descricao) VALUES (5, 'Ficção');
--
/* FILME */
INSERT INTO filme(cod_filme, titulo, cod_categ) VALUES (1, 'Sai pra lá',1);
INSERT INTO filme(cod_filme, titulo, cod_categ) VALUES (2, 'Ajuda Eterna',2);
INSERT INTO filme(cod_filme, titulo, cod_categ) VALUES (3, 'Anjos Malditos',2);
INSERT INTO filme(cod_filme, titulo, cod_categ) VALUES (4, 'Pânico II',4);
INSERT INTO filme(cod_filme, titulo, cod_categ) VALUES (5, 'Um dia de furia',3);
INSERT INTO filme(cod_filme, titulo, cod_categ) VALUES (6, 'Lente Cega',3);
INSERT INTO filme(cod_filme, titulo, cod_categ) VALUES (7, 'Sinais do Tempo',2);
INSERT INTO filme(cod_filme, titulo, cod_categ) VALUES (8, 'A Melodia da Vida',1);
--
/* DVD */
INSERT INTO DVD(cod_filme, tipo) VALUES (1,'S');
INSERT INTO DVD(cod_filme, tipo) VALUES (1,'S');
INSERT INTO DVD(cod_filme, tipo) VALUES (1,'S');
INSERT INTO DVD(cod_filme, tipo) VALUES (2,'D');
INSERT INTO DVD(cod_filme, tipo) VALUES (3,'S');
--
/* ATOR */
INSERT INTO ator (cod_ator, nome_popular, nome_artistico, data_nasc) VALUES (1,'Amos','Georgia Mendes',DATE '1974-09-29');
INSERT INTO ator (cod_ator, nome_popular, nome_artistico, data_nasc) VALUES (2,'Lavinia','Christopher Roberts',DATE '1980-09-02');
INSERT INTO ator (cod_ator, nome_popular, nome_artistico, data_nasc) VALUES (3,'Veronica','Nomlanga Carter',DATE '2001-04-24');
INSERT INTO ator (cod_ator, nome_popular, nome_artistico, data_nasc) VALUES (4,'Barbara','Reece Cano',DATE '2000-08-29');
INSERT INTO ator (cod_ator, nome_popular, nome_artistico, data_nasc) VALUES (5,'Rooney','Bo Pascual',DATE '1981-10-25');
INSERT INTO ator (cod_ator, nome_popular, nome_artistico, data_nasc) VALUES (6,'Lamar','Beverly Peña',DATE '1974-02-18');
INSERT INTO ator (cod_ator, nome_popular, nome_artistico, data_nasc) VALUES (7,'Cedric','Joshua Fisher',DATE '2003-06-21');
INSERT INTO ator (cod_ator, nome_popular, nome_artistico, data_nasc) VALUES (8,'Philip','Gage Camargo',DATE '1970-05-28');
INSERT INTO ator (cod_ator, nome_popular, nome_artistico, data_nasc) VALUES (9,'Blythe','Patricia Gonçalves',DATE '1972-07-01');
INSERT INTO ator (cod_ator, nome_popular, nome_artistico, data_nasc) VALUES (10,'Kuame','Bruno Gil',DATE '1974-08-13');
INSERT INTO ator (cod_ator, nome_popular, nome_artistico, data_nasc) VALUES (11,'Cullen','Dawn Romero',DATE '1997-06-24');
--
/* ATOR_FILME */
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (6,5);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (6,3);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (5,2);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (9,2);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (8,8);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (9,7);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (7,6);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (10,7);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (10,6);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (1,3);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (1,2);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (7,3);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (2,5);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (7,5);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (2,7);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (8,2);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (8,6);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (2,1);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (8,4);
INSERT INTO ator_filme (cod_ator, cod_filme) VALUES (3,5);
--
/* LOCAÇÃO */
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (3,2, '2022-08-03', '2022-08-13');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (2,3, '2022-08-05', '2022-08-11');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (2,4, '2022-08-04', '2022-08-23');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (3,4, '2022-08-05', '2022-08-19');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (2,2, '2022-08-05', '2022-08-15');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (4,3, '2022-08-02', '2022-08-17');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (3,2, '2022-08-02', '2022-08-09');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (3,5, '2022-08-05', '2022-08-14');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (3,1, '2022-08-05', '2022-08-24');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (4,3, '2022-08-03', '2022-08-28');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (3,2, '2022-08-07', '2022-08-18');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (2,4, '2022-08-08', '2022-08-26');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (4,2, '2022-08-08', '2022-08-20');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (2,3, '2022-08-07', '2022-08-22');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (2,2, '2022-08-08', '2022-08-21');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (4,2, '2022-08-04', '2022-08-31');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (3,3, '2022-08-04', '2022-08-31');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (4,2, '2022-08-08', '2022-08-11');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (4,2, '2022-08-02', '2022-08-12');
INSERT INTO aluga (cod_cli, num_dvd, data_ret, data_dev) VALUES (3,2, '2022-08-02', '2022-08-26');
-- 
ALTER TABLE filme ADD (sinopse varchar(300));
-- 
UPDATE categoria 
SET cod_categ = 8 
WHERE cod_categ = 1;
--
DELETE FROM filme
WHERE cod_filme = 1 and cod_filme = 8;
--
SELECT cod_filme , titulo FROM filme;
--
SELECT * FROM filme WHERE cod_categ = 3;
--
ALTER TABLE filme;
--
SELECT * FROM filme WHERE cod_categ = 3 AND cod_categ = 1;
--
ALTER TABLE cliente
CHANGE endereco end varchar(50); 
--
INSERT INTO filme(cod_filme, titulo, cod_categ) VALUES (9, '10.000 A.C',3);
--
ALTER TABLE cliente MODIFY COLUMN sobrenome varchar(70);
--

SELECT 
FROM 
ON
GROUP BY


COMMIT;
