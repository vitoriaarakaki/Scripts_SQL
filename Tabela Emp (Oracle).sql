-- TABELA ORACLE 

DROP TABLE Dept cascade constraint;
DROP TABLE Emp cascade constraint;

CREATE TABLE Dept 
	(DEPTNO number(2) CONSTRAINT Dept_DeptNo_PK Primary Key, 
	DNAME varchar2(14),
	LOC varchar2(13));

CREATE TABLE Emp
	(empno number(4) constraint Emp_empno_pk primary key,
	ename varchar2(10),
	job varchar2(9), 
	mgr number(4),
	hiredate date, 
	sal number(7,2), 
	comm number(7,2),
	deptno number(2) CONSTRAINT Emp_Dept_DeptNo_FK References Dept); 

insert into dept values(         10 , 'ACCOUNTING'     , 'NEW YORK'      );
insert into dept values(         20 , 'RESEARCH'       , 'DALLAS'        );
insert into dept values(         30 , 'SALES'          , 'CHICAGO'       );
insert into dept values(         40 , 'OPERATIONS'     , 'BOSTON'        );

insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
Values(7369,'SMITH','CLERK',7902,to_date('17/02/1980','dd/mm/yyyy'),800,NULL,20);
Insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
Values(7499,'ALLEN','SALESMAN',7698,to_date('20/02/1981','dd/mm/yyyy'),1600,300,30);
Insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
Values(7521,'WARD','SALESMAN',7698,to_date('22/02/1981','dd/mm/yyyy'),1250,500,30);
Insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
Values(7566,'JONES','MANAGER',7839,to_date('02/04/1981','dd/mm/yyyy'),2975,NULL,20);
Insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
Values(7654,'MARTIN','SALESMAN',7698,to_date('28/09/1981','dd/mm/yyyy'),1250,1400,30);
Insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
Values(7698,'BLAKE','MANAGER',7839,to_date('01/05/1981','dd/mm/yyyy'),2850,NULL,30);
Insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
Values(7782,'CLARK','MANAGER',7839,to_date('09/06/1981','dd/mm/yyyy'),2450,NULL,10);
Insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
Values(7788,'SCOTT','ANALYST',7566,to_date('19/04/1987','dd/mm/yyyy'),3000,NULL,20);
Insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
Values(7839,'KING','PRESIDENT','',to_date('17/11/1981','dd/mm/yyyy'),5000,NULL,10);
Insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
Values(7844,'TURNER','SALESMAN',7898,to_date('08/09/1981','dd/mm/yyyy'),1500,0,30);
Insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
Values(7876,'ADAMS','CLERK',7788,to_date('23/05/1987','dd/mm/yyyy'),1100,NULL,20);
Insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
Values(7900,'JAMES','CLERK',7698,to_date('03/12/1981','dd/mm/yyyy'),950,NULL,30);
Insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
Values(7902,'FORD','ANALYST',7566,to_date('03/12/1981','dd/mm/yyyy'),3000,NULL,20);
Insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
Values(7934,'MILLER','CLERK',7782,to_date('23/01/1982','dd/mm/yyyy'),1300,NULL,10);

-- LISTA 3 
SELECT * FROM emp;
--
SELECT * FROM EMPNO, ENAME, JOB, SAL WHERE SAL >= 3000;
--
SELECT DISTINCT JOB AS CARGOS FROM emp WHERE SAL > 2000;
--
SELECT * FROM DEPT;
--
SELECT DNAME FROM DEPT WHERE DEPTNO = 30;
--
/* ATUALIZAR TABELA */
UPDATE Eemp SET SAL = 1300 WHERE ENAME = 'SMITH';
-- OU
UPDATE Eemp SET SAL = 1300 WHERE ENAME = 7369;
--
SELECT ENAME, JOB, SAL FROM emp ORDER BY SAL;
--
INSERT INTO EMP(EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO) 
VALUES (1200, 'ANTÔNIO', 'MECÂNICO', 7782, '03/10/2022', 2500, NULL, 30);
--
/* USO DO LIKE, AND E BETWEEN */
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE HIREDATE LIKE '%81';
-- 	OU
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE HIREDATE LIKE '__/__/81';
--
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE HIREDATE LIKE '__/__/87';
-- OU 
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE HIREDATE LIKE '%87';
-- OU
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE HIREDATE BETWEEN '01/01/87' AND '31/12/87';
-- OU 
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE HIREDATE >= '01/01/87' AND HAREDATE <= '31/12/87';
--
SELECT ENAME, JOB, SAL
FROM EMP
ORDER BY JOB, ENAME;
--
INSERT INTO EMP(EMPNO, ENAME, JOB) VALUES (NULL, 'LUIS', 'ANALISTA');
-- OU 
INSERT INTO EMP(EMPNO, ENAME, JOB) VALUES ('LUIS', 'ANALISTA');
-- /* CHAVES PRIMARIAS NÃO PERMITEM VALORES NULOS */ --
--
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30 AND SAL < 2800;
--
UPDATE EMP SET DEPTINO = 30 WHERE EMPNO = 7566;
--
DELETE FROM EMP WHERE DEPTNO = 10;
--
/* SUBSTRINGS */
SELECT ENAME, JOB, HIREDATE, SUBSTR(HIREDATE, 6, 5) AS DIA_MES, SUBSTR(HIREDATE, 6,2) MES,
SUBSTR(HIREDATE, 1, 7) MES_ANO FROM EMP;
--
SELECT ENAME, JOB, SUBSTR(JOB, 2, 4), SUBSTR(JOB, 2) FROM EMP;
--
SELECT EMPNO, ENAME, JOB, HIRTEDATE FROM EMP WHERE HIREDATE LIKE SUBSTR(HIRADATE, 6, 2) = '02';
--
/* ADD DIAS */
SELECT ENAME, JOB, HIREDATE, HIREDATE + 10, HIREDATE - 42 FROM EMP;
--
SELECT ENAME, JOB, HIREDATE, SYSDATE FROM EMP;
--
/* ADD MESES */
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 8) FROM EMP;
--
SELECT ENAME, JOB, TO_CHAR(HIREDATE, 'DAY - DD "de" MONTH "de" YYYY') FROM EMP;
--
SELECT INITCAP(ENAME), JOB, INITCAP(TO_CHAR(HIREDATE, 'DAY - DD "de" MONTH "de" YYYY')) FROM EMP;
--
SELECT ENAME, JOB, INITCAP(TO_CHAR(HIREDATE, 'DAY - DD')) || ' de ' || 
INITCAP(TO_CHAR(HIREDATE, 'MONTH')) || 'de ' || TO_CHAR(HIREDATE, 'YYYY') AS "DATA ADMISSÃO" 
FROM EMP;

-- LISTA 4
SELECT ENAME, JOB, SAL, TO_CHAR (HIREDATA, 'DD "de" MONTH "de" YYYY') AS "DATA ADM" FROM EMP;

INSERT INTO DEPT(DEPTNO, DNAME, LOC) -- OPCIONAL
VALUES (50, 'Orçamento','SÃO PAULO');

ALTER TABLE EMP MODIFY (ENAME VARCHAR(20));

INSERT INTO EMP(EMPNO, ENAME, JOB, SAL, MGR, HIREDATE, COMM, DEPTNO)
VALUES (1, 'LUIS', 'ANALISTA', 3800, NULL,  '10/03/20', NULL, 15);

SELECT ENAME, JOB, HIREDATE, ROUND((SYSDATE - HIREDATE) / 7) AS SEMANAS FROM EMP;

-- LISTA 5
SELECT SYSDATE - HIREDATE, ROUND (SYSDATE - HIREDATE), ROUND (SYSDATE - HIREDATE, 3) FROM EMP;
-- 						   // PARTE INTEIRA            //PARTE DECIMAL
-- --------------------------------------------------------------------
SELECT ENAME, JOB, HIREDATE, ROUND ((SYSDATE - HIREDATE) / 7,2) AS SEMANAS_ARREDONDADAS 
--                            // DIVISÃO COM ARREDONDAMENTO î
TRUNC ((SYADATE - HIREDATE) / 7,2) AS SEMANAS_TRUNC FROM EMP;
-- // SEM ARREDONDAMENTO, APENAS MOSTRA AS DUAS CASAS DECIMAIS E JOGA FORA O RESTO
-- ----------------------------------------------------------------------------------
SELECT DEPTNO, MIN(SAL) AS "MENOR SALÁRIO", MAX(SAL) AS "MAIOR SALÁRIO", ROUND(AVG(SAL), 2) AS "MÉDIA SALÁRIO" FROM EMP;

SELECT ENAME, JOB, HIREDATE, TRUNC((SYSDATE - HIREDATE) / 7) AS SEMANAS FROM EMP;

SELECT DEPTNO, COUNT(*) "QTDE FUNC" FROM EMP GROUP BY DEPTNO;

SELECT JOB FROM EMP GROUP BY JOB;
-- OU
SELECT distinct JOB FROM EMP;

SELECT DEPTNO, SUM(SAL) "TOTAL SALÁRIO" FROM EMP;

SELECT JOB, SUM(SAL), MIN(SAL) FROM EMP GROUP BY JOB HAVING MIN(SAL) > 1400;

SELECT   DEPTNO, MIN(SAL)
FROM     EMP
WHERE    JOB <> ‘CLERK’ 
GROUP BY DEPTNO 
HAVING MIN(SAL)> 1500
ORDER BY DEPTNO DESC;

SELECT EMPNO, ENAME, JOB, SAL
FROM   EMP
WHERE  SAL = (SELECT MIN(SAL)FROM EMP);
 
 -- LISTA 6
SELECT DEPTNO, MAX(SAL)
FROM   EMP GROUP BY DEPTNO;

SELECT ENAME, SAL, DEPTNO
FROM   EMP WHERE SAL IN (2850, 3000, 5000) AND JOB = 'ANALYST';
-- OU
SELECT ENAME, SAL, DEPTNO, MAX(SAL)
FROM   EMP WHERE SAL = 2850 OR SAL = 3000 OR SAL = 5000;
 
SELECT ENAME, SAL, DEPTNO
FROM   EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT   ENAME, SAL, DEPTNO
FROM     EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO)
ORDER BY ENAME;

SELECT   ENAME, SAL, DEPTNO, JOB
FROM     EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP WHERE JOB = 'ANALYST' GROUP BY DEPTNO);
-- OU 
SELECT   ENAME, SAL, DEPTNO, JOB
FROM     EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO HAVING JOB = 'ANALYST');

SELECT JOB AS CARGOS, SUM(SAL) "TOTAL SALÁRIO" 
FROM EMP GROUP BY JOB ORDER BY JOB;

SELECT * FROM EMP WHERE ENAME = 'TURNER' OR ENAME = 'SMITH';
-- OU
SELECT * FROM EMP WHERE ENAME IN ('TURNER', 'SMITH');

 SELECT JOB, ROUND(AVG(SAL), 2) FROM EMP GROUP BY JOB;

UPDATE EMP SET SAL = 4000 WHERE ENAME =  'SMITH';

UPDATE EMP SET DEPTNO = 40 WHERE EMPNO = 7369;
-- OU
UPDATE EMP SET DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'OPERATIONS')
WHERE EMPNO = (SELECT EMPNO FROM EMP WHERE ENAME = 'SMITH');

SELECT DEPTNO, ROUND(AVG(SAL), 2) "MÉDIA SALARIAL", COUNT(*) "QTD FUNC" FROM EMP GROUP BY DEPTNO;

SELECT DEPTNO, JOB, MIN(SAL), MAX(SAL), SUM(SAL) FROM EMP GROUP BY DEPTNO, JOB ORDER BY DEPTNO;

DELETE FROM EMP WHERE HIREDATE LIKE '%87';
-- OU
DELETE FROM EMP WHERE HIREDATE LIKE '__/__/87';
-- OU
DELETE FROM EMP WHERE HIREDATE BETWEEN '01/01/87' AND '31/12/87';
-- OU
DELETE FROM EMP WHERE HIREDATE >= '01/01/87' AND HIREDATE <= '31/12/87';
ROLLBACK;

 UPDATE EMP SET DEPTNO = (SELECT DPTNO FROM DEPT WHERE DNAME = 'ACCOUNTING') 
 WHERE EMPNO = 7900;
 
SELECT ENAME, JOB, SAL, EMP.DEPTNO, DEPT.DEPTNO, DNAME 
FROM EMP INNER JOIN DEPT 
ON EMP.DEPTNO = DEPT.DEPTNO;

SELECT ENAME, JOB, SAL, EMP.DEPTNO, DEPT.DEPTNO, DNAME 
FROM EMP INNER JOIN DEPT 
ON EMP.DEPTNO = DEPT.DEPTNO
WHERE EMP.SAL > 2000;

SELECT ENAME, JOB, SAL, EMP.DEPTNO, DEPT.DEPTNO, DNAME 
FROM EMP E INNER JOIN DEPT D 
ON EMP.DEPTNO = DEPT.DEPTNO;
-- OU
SELECT ENAME, JOB, SAL, E.DEPTNO, D.DEPTNO, D.DNAME 
FROM EMP E INNER JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO;
-- OU
SELECT ENAME, JOB, SAL, E.DEPTNO, D.DEPTNO, D.DNAME 
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO;

SELECT ENAME, E.JOB, E.SAL, E.DEPTNO, D.DEPTNO, D.DNAME 
FROM EMP E RIGHT OUTER JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO;
-- OU
SELECT ENAME, E.JOB, E.SAL, E.DEPTNO, D.DEPTNO, D.DNAME 
FROM EMP E LEFT OUTER JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO;

SELECT ENAME, E.JOB, E.SAL, E.DEPTNO, D.DEPTNO, D.DNAME 
FROM EMP E FULL JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO;

-- LISTA 7
SELECT E.ENAME, E.SAL, D.DNAME FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO WHERE E.HIREDATE LIKE '1981%';

SELECT D.DNAME, MIN(E.SAL) AS 'MIN', MAX(E.SAL) AS 'MAX', ROUND(AVG(E.SAL),2) AS 'MEDIA'
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME;

SELECT E.ENAME, E.SAL, D.DNAME, E.HIREDATE 
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.HIREDATE BETWEEN '1987/01/01' AND '1987/12/31';
-- OU
SELECT E.ENAME, E.SAL, D.DNAME, E.HIREDATE 
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.HIREDATE >= '1987/01/01' AND E.HIREDATE <= '1987/12/31';

SELECT A.ENAME, A.JOB, A.SAL, B.DNAME
FROM EMP A INNER JOIN DEPT B ON A.DEPTNO = B.DEPTNO
ORDER BY A.JOB, A.ENAME;

SELECT D.DNAME, COUNT(*) AS "QTDE FUNC"
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME;

SELECT		B.DNAME AS DEPTO, SUM(A.SAL) "TOTAL SALÁRIOS"
FROM		EMP A INNER JOIN DEPT B
ON			A.DEPTNO = B.DEPTNO
GROUP BY	B.DNAME;

-- VIEW'S --
-- SALVA O COMANDO SELECT
CREATE VIEW V1 AS 
SELECT E.EMPNO, E.ENAME, E.JOB, D.DNAME 
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;
-- OU // REESCREVE A VIEW 
CREATE OR REPLACE VIEW V1 AS 
SELECT E.EMPNO, E.ENAME, E.JOB, D.DNAME 
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

SELECT * FROM V1;
SELECT * FROM V1 WHERE DNAME = 'SALES';
SELECT DNAME AS CARGOS, COUNT(*) AS "QTDE FUNC" FROM V1 GROUP BY DNAME;

CREATE OR REPLACE VIEW V2 AS 
SELECT * FROM EMP
WHERE DEPTNO = 20; 

SELECT * FROM V2;

CREATE OR REPLACE VIEW V3 AS 
SELECT EMPNO, ENAME, SAL FROM EMP;

SELECT V.EMPNO, V.ENAME, V.SAL, D.DNAME
FROM V2 V INNER JOIN DEPT D ON V.DEPTNO = D.DEPTNO;

INSERT INTO V2(EMPNO, ENAME, JOB) VALUES (1, 'LUIS', 'ANALYST');

SELECT * FROM V3;

INSERT INTO V3(EMPNO, ENAME, SAL) VALUES (2, 'CARLOS', 3400);

-- ASSIM QUE DADO O COMANDO DELETE, OS DADOS SERÃO APAGADOS NA TABELA BASE. 
DELETE FROM V2;

CREATE OR REPLACE VIEW V5 AS 
SELECT EMPNO, ENAME, SAL FROM EMP WHERE DEPTNO = 30 WITH CHECK OPTION; 

CREATE OR REPLACE VIEW V6 AS
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE SAL > 2500 WITH CHECK OPTION;

SELECT * FROM V5;

SELECT * FROM V6;

INSERT INTO V5(EMPNO, ENAME, SAL) VALUES (3, 'PAULA', 3000);

INSERT INTO V6(EMPNO, ENAME, SAL, DEPTNO) VALUES (4, 'MARIA', 2500, 30);

UPDATE V6 SET SAL = 2100 WHERE EMPNO = 7698;

UPDATE V6 SET SAL = 2100 WHERE EMPNO = 7902;

INSERT INTO V5(EMPNO, ENAME, SAL) VALUES (5, 'MARIO', 3400);

CREATE OR REPLACE VIEW V7 AS 
SELECT ENAME, SAL, JOB, DEPTNO FROM EMP WITH READ ONLY;

INSERT INTO V7(ENAME, SAL) VALUES ('PAULO', 2800);


COMMIT;

