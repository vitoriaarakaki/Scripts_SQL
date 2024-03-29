-- TABELA ORACLE 
-- ESCOLA INFORMATICA

/* TABELA ALUNO */
CREATE TABLE ALUNO
(
MATRIC NUMBER(10),
NOME VARCHAR2(50),
TELEFONE NUMBER(10),
ENDERECO VARCHAR2(50), 
UF CHAR(2) 
);
--
DROP TABLE ALUNO CASCADE CONSTRAINT;
--
ALTER TABLE ALUNO 
ADD
(CONSTRAINT ALUNO_MATRIC_PK PRIMARY KEY(MATRIC));
-- OU
ALTER TABLE 
MODIFY
(NOME CONSTRAINT ALUNO_NOME_NN NOT NULL);
-- ----------------------------*
/* TABELA CURSO */
CREATE TABLE CURSO
(
IDCURSO NUMBER(4)  PRIMARY KEY,
NOME VARCHAR(50)   NOT NULL,
CARGA_HORARIA NUMBER(4),
PRECO NUMBER(7,2),
PRE_REQ VARCHAR2(300)
);
-- --------------------*
/* TABELA TURMA */
CREATE TABLE TURMA
(
IDTURMA NUMBER(4),
SALA NUMBER(4),
IDINST NUMBER(4),
IDCURSO NUMBER(4),
CONSTRAINT TURMA_IDTURMA_PK PRIMARY KEY,
CONSTRAINT INSTRUTOTR_IDINST_FK REFERENCES INSTRUTOR(IDINST),
CONSTRAINT CURSO_IDCURSO_FK REFERENCES CURSO(IDCURSO)
);
-- ---------------------------*
/* TABELA HISTORICO */
CREATE TABLE HISTORICO 
(
IDTURMA NUMBER(4),
MATRIC NUMBER(10)  REFERENCES ALUNO,
NOTA NUMBER(3,1),
FOREIGN KEY(IDTURMA) REFERENCES TURMA,
PRIMARY KEY(IDTURMA, MATRIC)
);
-- ---------------------------*
/* TABELA INSTRUTOR*/
CREATE TABLE INSTRUTOR
(
IDINST NUMBER(4) CONSTRAINT INSTRUTOR_IDINST_PK PRIMARY KEY,
NOME VARCHAR2(50) NOT NULL,
TELEFONE VARCHAR2(15),
DTADM DATE,
SALARIO NUMBER(7,2)
);
--
ALTER TABLE INSTRUTOR DROP CONSTRAINT INSTRUTOR_IDINST_PK;
-- OU
ALTER TABLE INSTRUTOR DROP PRIMARY KEY;
--
ALTER TABLE INSTRUTOR 
ADD
(CONSTRAINT INSTRUTOR_IDINST_PK PRIMARY KEY(IDINST));
-- OU
ALTER TABLE INSTRUTOR
MODIFY
(IDINST NUMBER(4) CONSTRAINT INSTRUTOR_IDINST_PK PRIMARY KEY);
-- 
ALTER TABLE INSTRUTOR 
MODIFY
(NOME VARCHAR2(60));
--
INSERT INTO INSTRUTOR
(IDINST, NOME, TELEFONE, DTADM, SALARIO) 
VALUES
(1, 'JOSE MARINO', 9999-1234, SYSDATE, 200,00);
-- OU
INSERT INTO INSTRUTOR
(IDINST, NOME, TELEFONE, DTADM, SALARIO) 
VALUES
(1, 'JOSE MARINO', '9999-1234', SYSDATE, 200,00);
-- -----------------------------------*
INSERT INTO NOMETAB
(LISTA DE CAMPOS) -- OPCIONAL
VALUES
(LISTA DE VALORES)
-- -----------------------------------*
--LISTA 2
INSERT INTO INSTRUTOR
(IDINST, NOME, TELEFONE, DTADM, SALARIO) -- OPCIONAL
VALUES
(1, 'JOSÉ MARINHO',9999-1234, SYSDATE, 2000,00)

--OU
INSERT INTO INSTRUTOR
(IDINST, NOME, TELEFONE, DTADM, SALARIO) -- OPCIONAL
VALUES
(1, 'JOSÉ MARINHO',9999-1234, '26/09/22',2000)

INSERT INTO INSTRUTOR
VALUES
(2, 'EULER SOARES', '4343-2000', '26/09/22', 1850.18)

--LISTA 1

INSERT INTO FILME
(CODFILME, TITULO, CODCATEG)
VALUES
(1, 'SAI PRA LÁ', NULL)

-- OU
INSERT INTO FILME
(CODFILME, TITULO)
VALUES
(1, 'SAI PRA LÁ')

INSERT INTO CATEGORIA
(CODCATEG, DESCRICAO)
VALUES
(1, 'COMÉDIA')

INSERT INTO CATEGORIA
(CODCATEG, DESCRICAO)
VALUES
(2, 'DRAMA')

-- UTILIZANDO PARÂMETRO (&)
INSERT INTO CATEGORIA
(CODCATEG, DESCRICAO)
VALUES
(&CODIGO, '&DESCRICAO')

--COMANDO UPDATE
UPDATE NOMETAB
SET
CAMPO = NOVO_VALOR
WHERE CONDICIONAL -- FILTRAR LINHAS PARA FAZER O QUE O COMANDO DETERMINA

-- TODAS AS LINHAS DA TABELA SERÃO ALTERADAS
UPDATE EMP
SET
SAL = 3200

-- APENAS AS LINHAS QUE ATENDEM A CONDIÇÃO DA CLÁUSULA WHERE SERÃO ALTERADAS
UPDATE EMP
SET
SAL = 3200
WHERE EMPNO = 7902

UPDATE EMP
SET
SAL = 3200
WHERE SAL < 2500 AND DEPTNO = 10

-- COMANDO DELETE
DELETE FROM NOMETAB WHERE CONDICIONAL

-- TODAS AS LINHAS DA TABELA EMP SERÃO ELIMINADAS
DELETE FROM EMP

-- APENAS AS LINHAS QUE ATENDEM A CONDIÇÃO DA CLÁUSULA WHERE SERÃO ELIMINADAS
DELETE FROM EMP
WHERE SAL > 1500 AND SAL <= 2000

-- -- -- -------------------------------------*
-- EXCLUINDO uma CONSTRAINT
ALTERAR TABLE ALUNO APAGANDO CONSTRAINT xxx
ALTER TABLE ALUNO DROP CONSTRAINT SYS_C007149
OU
-- EXCLUINDO uma CONSTRAINT do tipo NOT NULL (só é possível assim para NOT NULL)
ALTER TABLE ALUNO MODIFY (NOME VARCHAR(50) NULL)

-- EXCLUINDO uma CONSTRAINT
ALTER TABLE ALUNO DROP CONSTRAINT SYS_C007151
OU
-- EXCLUINDO uma CONSTRAINT do tipo PRIMARY KEY (só é possível assim para PRIMARY KEY)
ALTER TABLE ALUNO DROP PRIMARY KEY

-- RENOMEANDO uma TABELA
ALTERAR TABELA ALUNO RENOMEANDO PARA ALUNOS
ALTER   TABLE  ALUNO RENAME      TO  ALUNOS 
OU
-- RENOMEANDO uma tabela sem precisar usar o ALTER TABLE
RENAME ALUNO TO ALUNOS

-- RENOMEANDO uma coluna de uma tabela
ALTERAR TABELA ALUNO RENOMEANDO COLUNA ENDER PARA ENDERECO
ALTER   TABLE  ALUNO RENAME     COLUMN ENDER  TO  ENDERECO

-- EXCLUINDO uma coluna de uma tabela
ALTERAR TABELA ALUNO APAGANDO COLUNA OBSERV
ALTER   TABLE  ALUNO DROP     COLUMN OBSERV

-- ADICIONANDO uma nova coluna numa tabela
ALTER TABLE ALUNO ADD OBSERV VARCHAR(50)

-- ADICIONANDO novas colunas com e sem restrições
ALTER TABLE ALUNO
ADD
(
CPF VARCHAR(15) UNIQUE,
RG VARCHAR(14)		  
)

-- ADICIONAND0 uma CONSTRAINT de NOT NULL numa coluna já existente 
-- (NOT NULL sempre será pelo MODIFY, nunca pelo ADD CONSTRAINT)
ALTER TABLE ALUNO
MODIFY
(
CPF CONSTRAINT ALUNO_CPF_NN NOT NULL
)
OU
ALTER TABLE ALUNO
MODIFY
(
CPF VARCHAR(15) CONSTRAINT ALUNO_CPF_NN NOT NULL
)

-- MODIFICANDO tamanho de uma coluna já existente na tabela
ALTERAR TABELA ALUNO MODIFICANDO ENDER VARCHAR(80)
ALTER   TABLE  ALUNO 	MODIFY	 ENDER VARCHAR(80)

-- igual a linha anterior, apenas escrito em várias linhas
ALTER TABLE ALUNO
MODIFY
(
ENDER VARCHAR(80)
)

-- ADICIONANDO uma CONSTRAINT numa coluna já existente na tabela
ALTERAR TABELA ALUNO ADICIONANDO CONSTRAINT UNIQUE
ALTER   TABLE  ALUNO     ADD	 CONSTRAINT ALUNO_RG_UU UNIQUE (RG)

-- igual a linha anterior, apenas escrito em várias linhas
ALTER TABLE ALUNO
ADD
(
CONSTRAINT ALUNO_RG_UU UNIQUE(RG)	  
)
ou
-- sem dar nome a constraint
ALTER TABLE ALUNO
ADD
(
UNIQUE(RG)	  
)
-- 
UPDATE EMP
SET 
SAL = 1500;
--
DELETE FROM EMP WHERE EMPNO = 7782;
--
INSERT INTO EMP 
(EMPNO, ENAME, SAL)
VALUES
(1, 'LUIS', 2400);

ROLLBACK;


























