-- TABELA MYSQL

CREATE DATABASE escola;
USE escola;

CREATE TABLE aluno (
matric int primary key NOT NULL auto_increment,
nome varchar(70) NOT NULL,
telefone int,
endereco varchar(70),
uf char(2)
);

CREATE TABLE curso(
id_curso int primary key NOT NULL auto_increment,
nome varchar(50) NOT NULL,
carga_horaria varchar(50),
preco int,
pre_requisitos varchar(70)
);

CREATE TABLE instrutor(
id_inst int primary key NOT NULL auto_increment,
nome varchar(50) NOT NULL,
telefone int,
dt_adm date,
salario double
);

CREATE TABLE historico (
Id_turma int,
matric int,
nota int,
primary key(id_turma, matric)
)ENGINE=MyISAM;

CREATE TABLE turma(
id_turma int NOT NULL auto_increment,
sala int,
id_inst int,
id_curso int,
primary key(id_turma, id_inst, id_curso)
)ENGINE=MyISAM;

SELECT * FROM instrutor;

INSERT INTO instrutor(nome, telefone, dt_adm, salario) VALUES ('José Marinho', '99991234', '2002-10-22', '2000.00'); 
INSERT INTO instrutor(nome, telefone, dt_adm, salario) VALUES ('Euler Soares', '43432000', '1980-11-02', '1850.18'); 
INSERT INTO instrutor(nome, telefone, dt_adm, salario) VALUES ('Fabio Costa', '12345000', '2020-03-05', '1250.00'); 
INSERT INTO instrutor(nome, telefone, dt_adm, salario) VALUES ('Maria Clara', '45679000', '2019-05-14', '900.26'); 