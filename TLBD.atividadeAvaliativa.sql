USE master;
DROP DATABASE ESCOLA;
CREATE DATABASE ESCOLA;
USE ESCOLA;

CREATE TABLE DISCIPLINA (
		ID_DISCIPLINA	CHAR(5)		NOT NULL PRIMARY KEY,
		NOME_DISCIPLINA	VARCHAR(40)	NOT NULL,
		CARGA_HORARIA	INTEGER		NOT NULL
);

CREATE TABLE CURSO (
		NR_CURSO	INTEGER		NOT NULL PRIMARY KEY,
		NOME_CURSO	VARCHAR(50)	NOT NULL
);

CREATE TABLE ALUNO (
	MATRICULA	INTEGER		NOT NULL PRIMARY KEY,
	NOME		VARCHAR(40)	NOT NULL,
	SEXO		CHAR(1)		NOT NULL,
	NASCIMENTO	DATE		NOT NULL,
	NR_CURSO	INTEGER		NOT NULL,
	
	FOREIGN KEY (NR_CURSO) REFERENCES CURSO(NR_CURSO)
);

CREATE TABLE HISTORICO (
	MATRICULA		INTEGER		NOT NULL,
	ID_DISCIPLINA	CHAR(5)		NOT NULL,
	ANO				INTEGER		NOT NULL,
	SEMESTRE		INTEGER		NOT NULL,
	NOTA			NUMERIC(3,1),
	FREQUENCIA		INTEGER,
	
	PRIMARY KEY (MATRICULA, ID_DISCIPLINA, ANO, SEMESTRE),
	
	FOREIGN KEY (MATRICULA) REFERENCES ALUNO(MATRICULA),
	FOREIGN KEY (ID_DISCIPLINA) REFERENCES DISCIPLINA(ID_DISCIPLINA) 
);

INSERT INTO CURSO VALUES
	(100,	'SISTEMAS DE INFORMACAO'),
	(110,	'CIENCIAS ECONOMICAS'),
	(120,	'SANEAMENTO BASICO');

INSERT INTO ALUNO VALUES
	(1099,	'CASSIANO ABEL COUTO',		'M',	'1986-06-30',	110),
	(1100,	'CARLOS ALVES MONTEIRO',	'M',	'1997-02-04',	110),
	(1101,	'CARLOTA ALVES MONTEIRO',	'F',	'1989-02-17',	120),
	(1102,	'MARIANA GONCALVES SOUZA',	'F',	'1981-05-27',	120),
	(1103,	'RITA DE CASSIA FURLAN',	'F',	'1979-01-25',	110),
	(1104,	'MARCONDES FURLAN',			'M',	'1979-01-25',	100),
	(1105,	'ANA TORIBIO',				'F',	'1982-12-21',	100),
	(1106,	'ANABELLA SILVA',			'F',	'1987-10-01',	100);


INSERT INTO DISCIPLINA VALUES
	('IIA',	'INTRODUCAO A INTELIGENCIA ARTIFICIAL',	60),
	('ICA',	'INTELIGENCIA COMPUTACIONAL APLICADA',	90),
	('TBD',	'TECNOLOGIA DE BANCO DE DADOS',			90),
	('TME',	'TEORIA MACROECONOMICA',				90),
	('TMI',	'TEORIA MICROECONOMICA',				60),
	('RS',	'RESIDUOS SOLIDOS',						60),
	('TPR',	'TECNICAS DE PROGRAMACAO',				90),
	('EPB',	'ESTUDO DE PROBLEMAS BRASILEIROS',		45);
	
INSERT INTO HISTORICO VALUES
	(1099,	'EPB',	2012,	1,		40.5,	40),
	(1100,	'EPB',	2012,	1,		63.2,	40),
	(1101,	'EPB',	2012,	1,		80,		45),
	(1102,	'EPB',	2012,	1,		60,		23),
	(1103,	'EPB',	2012,	2,		90,		41),
	(1104,	'EPB',	2012,	2,		66.5,	44),
	(1105,	'EPB',	2012,	2,		69.3,	18),
	(1106,	'EPB',	2012,	2,		99,		38),
	(1105,	'ICA',	2012,	1,		92,		80),
	(1106,	'ICA',	2012,	1,		32,		80),
	(1104,	'ICA',	2012,	1,		71,		41),
	(1099,	'TME',	2012,	2,		60,		13),
	(1100,	'TME',	2012,	2,		59,		83);

--1
select dis.NOME_DISCIPLINA, dis.ID_DISCIPLINA, dis.CARGA_HORARIA
	from DISCIPLINA as dis
	where dis.CARGA_HORARIA >= 60;

--2
select dis.NOME_DISCIPLINA,dis.CARGA_HORARIA
	from	DISCIPLINA			as	dis
	where	dis.NOME_DISCIPLINA	like	'%INTELIGENCIA%';

--3
select dis.NOME_DISCIPLINA, his.ANO, his.SEMESTRE, alu.SEXO
	from	ALUNO		as	alu,
			DISCIPLINA	as	dis,
			HISTORICO	as	his
	where	his.SEMESTRE = 2
	and		his.ANO = 2012;

--4
select alu.MATRICULA, alu.NOME, dis.NOME_DISCIPLINA, his.NOTA, his.FREQUENCIA
	from	HISTORICO	as	his,
			ALUNO		as	alu,
			DISCIPLINA	as	dis
	where	alu.MATRICULA = 1105;

--5
/*[3.5]
	Exiba todas as alunas que cursaram pelo menos uma disciplina,
e suas respectivas matriculas. Ordene pelo nome das alunas */
select alu.*
	from	HISTORICO	as	his,
			ALUNO		as	alu
	where	alu.SEXO = 'F'
	and		alu.MATRICULA = his.MATRICULA
	order by alu.NOME;
