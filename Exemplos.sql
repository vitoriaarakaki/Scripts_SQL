/* PASSAR PARA A ORACLE DEPOIS 
DROP TABLE ALUNO -- apaga uma tabela
**************************************
-- OUTRA FORMA DE ESCREVER --
CREATE TABLE ALUNO (
RA   NUMBER(10)    PRIMARY KEY,
NOME VARCHAR2(50)  NOT NULL,
CPF  NUMBER(11)    NOT NULL UNIQUE 
) 
*****************************************************
CREATE TABLE CURSO(
IDCURSO NUMBER(4) CONSTRAINT CURSO_IDCURSO_PK PRYMARY KEY,
NOME VARCHAR2(50) NOT NULL
)

CREATE TABLE ALUNO (
RA   NUMBER(10)   CONSTRAINT ALUNO_RA_PK PRIMARY KEY,
NOME VARCHAR2(50) CONSTRAINT ALUNO_NOME_NN NOT NULL, //(NUNCA VAI ESTAR LONGE DA COLUNA A CONSTRAINT DE NOT NULL)
SEXO  CHAR(1)     CONSTRAINT ALUNO_SEXO_CH CHECK(SEXO = 'M' OR SEXO = 'F'),
-- OU CHECK(SEXO IN ('M','F')) --
IDCURSO NUMBER(4) CONSTRAINT ALUNO_IDCURSO_FK FOREIGN KEY REFERENCES CURSO(IDCURSO)
)
-- quando a constraint esta junto ao campo não precisa referenciar, só se ele estiver longe
***************************************************************
--- ADICIONAR INFORMAÇÕES EM TABELAS JÁ EXISTENTES
ALTER TABLE ALUNO
ADD
(
CPF NUMBER(11) CONSTRAINT ALUNO_CPF_UU UNIQUE,
DATA_NASC DATE
)

--- MODIFICAR INFORMAÇÕES NA TABELA JÁ EXISTENTES 
ALTER TABLE ALUNO
MODIFY
(
NOME VARCHAR2(70),
CPF VARCHAR2(14)
)

--- APAGA A CONSTRAINT
ALTER TABLE ALUNO DROP CONSTRAINT ALUNO_SEXO_CH

--- RENOMEAR TABELA OU COLUNA 
ALTER TABLE aluno TO alunos
-- OU
RENAME aluno TO alunos

ALTER TABLE ALUNO RENAME COLUMN NOME TO NOME_ALUNO
*/

CREATE DATABASE uninove;
USE uninove;

CREATE TABLE curso(
idCurso int primary key NOT NULL, 
nome varchar(50) NOT NULL
);

CREATE TABLE aluno(
ra int primary key NOT NULL,
nome varchar(50) NOT NULL,
sexo char(1),
CHECK(sexo = "M" or sexo = "F"),
idCurso int,
-- chave estrangeira --
foreign key(idCurso) references curso(idCurso)
);

/* ADICIONAR NOVAS COLUNAS NA TABELA EXISTENTE */
ALTER TABLE aluno ADD (cpf int, data_nasc date);

/* MODIFICAR AS COLUNAS NA TABELA */
ALTER TABLE aluno MODIFY COLUMN nome varchar(70);

/* APAGA UMA RESTRIÇÃO DA TABELA */
ALTER TABLE aluno DROP COLUMN sexo;

/* RENOMEAR TABELA OU COLUNA */
ALTER TABLE aluno
CHANGE nome nome_aluno varchar(50); 

 RENAME TABLE aluno TO alunos;
 
 