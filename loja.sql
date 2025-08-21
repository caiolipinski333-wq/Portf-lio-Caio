CREATE DATABASE LOJA_CENTRAL_PROVA_MÓDULO_05_p2;

USE LOJA_CENTRAL_PROVA_MÓDULO_05;


CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT, 
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_FK_CLIENTE INT UNIQUE,

	FOREIGN KEY(ID_FK_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT, 
	TIPO ENUM('RES','COM','CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_FK_CLIENTE INT,

	FOREIGN KEY(ID_FK_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

/* ENDERECO - OBRIGATORIO 
CADASTRO DE SOMENTE UM.

TELEFONE - NAO OBRIGATORIO
CADASTRO DE MAIS DE UM (OPCIONAL) /*

/*
CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA
QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERENCIA ENTRE
REGISTROS */

/* EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */

/* EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARA SEMPRE NA
CARDINALIDADE N */

DESC CLIENTE;
+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int(11)       | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','M','JCELIA@IG.COM','5767876889');

SELECT * FROM CLIENTE;
+-----------+--------+------+----------------+-------------+
| IDCLIENTE | NOME   | SEXO | EMAIL          | CPF         |
+-----------+--------+------+----------------+-------------+
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 |
|         2 | CARLOS | M    | CARLOSA@IG.COM | 5464553466  |
|         3 | ANA    | F    | ANA@IG.COM     | 456545678   |
|         4 | CLARA  | F    | NULL           | 5687766856  |
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  |
|         6 | CELIA  | M    | JCELIA@IG.COM  | 5767876889  |
+-----------+--------+------+----------------+-------------+

DESC ENDERECO;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| IDENDERECO    | int(11)     | NO   | PRI | NULL    | auto_increment |
| RUA           | varchar(30) | NO   |     | NULL    |                |
| BAIRRO        | varchar(30) | NO   |     | NULL    |                |
| CIDADE        | varchar(30) | NO   |     | NULL    |                |
| ESTADO        | char(2)     | NO   |     | NULL    |                |
| ID_FK_CLIENTE | int(11)     | YES  | UNI | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+

INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);

SELECT * FROM ENDERECO;
+------------+--------------------+----------+----------------+--------+---------------+
| IDENDERECO | RUA                | BAIRRO   | CIDADE         | ESTADO | ID_FK_CLIENTE |
+------------+--------------------+----------+----------------+--------+---------------+
|          1 | RUA ANTONIO SA     | CENTRO   | B. HORIZONTE   | MG     |             4 |
|          2 | RUA CAPITAO HERMES | CENTRO   | RIO DE JANEIRO | RJ     |             1 |
|          3 | RUA PRES VARGAS    | JARDINS  | SAO PAULO      | SP     |             3 |
|          4 | RUA ALFANDEGA      | ESTACIO  | RIO DE JANEIRO | RJ     |             2 |
|          5 | RUA DO OUVIDOR     | FLAMENGO | RIO DE JANEIRO | RJ     |             6 |
|          6 | RUA URUGUAIANA     | CENTRO   | VITORIA        | ES     |             5 |
+------------+--------------------+----------+----------------+--------+---------------+

DESC TELEFONE;
+---------------+-------------------------+------+-----+---------+----------------+
| Field         | Type                    | Null | Key | Default | Extra          |
+---------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE    | int(11)                 | NO   | PRI | NULL    | auto_increment |
| TIPO          | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO        | varchar(10)             | NO   |     | NULL    |                |
| ID_FK_CLIENTE | int(11)                 | YES  | MUL | NULL    |                |
+---------------+-------------------------+------+-----+---------+----------------+

INSERT INTO TELEFONE VALUES(NULL,'CEL','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',2);

SELECT * FROM TELEFONE;
+------------+------+----------+---------------+
| IDTELEFONE | TIPO | NUMERO   | ID_FK_CLIENTE |
+------------+------+----------+---------------+
|          1 | CEL  | 78458743 |             5 |
|          2 | RES  | 56576876 |             5 |
|          3 | CEL  | 87866896 |             1 |
|          4 | COM  | 54768899 |             2 |
|          5 | RES  | 99667587 |             1 |
|          6 | CEL  | 78989765 |             3 |
|          7 | CEL  | 99766676 |             3 |
|          8 | COM  | 66687899 |             1 |
|          9 | RES  | 89986668 |             5 |
|         10 | CEL  | 88687909 |             2 |
+------------+------+----------+---------------+

/* SELECAO, PROJECAO E JUNCAO */

/* PROJECAO -> TUDO QUE QUEREMOS VER NA TELA*/

SELECT NOW() AS DATA_ATUAL;

SELECT 2 + 2 AS SOMA;

SELECT 2 + 2 AS SOMA, NOME, NOW() AS DATA_ATUAL
FROM CLIENTE;

SELECT 2 + 2 AS SOMA, CPF, NOW() AS DATA_ATUAL
FROM CLIENTE;

/* SELECAO -> É UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTROS DE UMA TABELA
A CLAUSULA DE SELECAO É O WHERE
*/

SELECT NOME, SEXO, EMAIL /* PROJECAO */
FROM CLIENTE /* ORIGEM */
WHERE SEXO = 'F'; /* SELECAO */

SELECT NUMERO /* PROJECAO */
FROM TELEFONE /* ORIGEM */
WHERE TIPO = 'CEL'; /* SELECAO */

/* JUNCAO -> JOIN */

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

+--------+----------------+-----------+
| NOME   | EMAIL          | IDCLIENTE |
+--------+----------------+-----------+
| JOAO   | JOAOA@IG.COM   |         1 |
| CARLOS | CARLOSA@IG.COM |         2 	
| ANA    | ANA@IG.COM     |         3 |
| CLARA  | NULL           |         4 |
| JORGE  | JORGE@IG.COM   |         5 |
| CELIA  | JCELIA@IG.COM  |         6 |
+--------+----------------+-----------+

SELECT ID_FK_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;

+------------+----------+----------------+
| ID_CLIENTE | BAIRRO   | CIDADE         |
+------------+----------+----------------+
|          4 | CENTRO   | B. HORIZONTE   |
|          1 | CENTRO   | RIO DE JANEIRO |
|          3 | JARDINS  | SAO PAULO      |
|          2 | ESTACIO  | RIO DE JANEIRO |
|          6 | FLAMENGO | RIO DE JANEIRO |
|          5 | CENTRO   | VITORIA        |
+------------+----------+----------------+

/* NOME, SEXO, BAIRRO, CIDADE */

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */
FROM CLIENTE, ENDERECO /*ORIGEM */
WHERE IDCLIENTE = ID_FK_CLIENTE; /* JUNCAO */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_FK_CLIENTE;

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

/* WHERE = SELECAO */

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE, ENDERECO 
WHERE IDCLIENTE = ID_FK_CLIENTE
AND SEXO = 'F'; 

+-------+------+---------+--------------+
| NOME  | SEXO | BAIRRO  | CIDADE       |
+-------+------+---------+--------------+
| ANA   | F    | JARDINS | SAO PAULO    |
| CLARA | F    | CENTRO  | B. HORIZONTE |
+-------+------+---------+--------------+

/* MAIS EXEMPLOS DE JOIN VISANDO QUE O = ID CHAVE PRIMÁRIA = ID CHAVE ESTRANGEIRA JÁ NOS
 TRAZEM UMA EXATIDÃO E TABELA VERDADE */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_FK_CLIENTE;

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */ 
FROM CLIENTE /* ORIGEM */
	INNER JOIN ENDERECO /*JUNCAO */
	ON IDCLIENTE = ID_FK_CLIENTE
WHERE SEXO = 'F'; /* SELECAO */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
	INNER JOIN ENDERECO
	ON IDCLIENTE = ID_FK_CLIENTE
WHERE SEXO = 'F'; 
+-------+------+---------+--------------+
| NOME  | SEXO | BAIRRO  | CIDADE       |
+-------+------+---------+--------------+
| ANA   | F    | JARDINS | SAO PAULO    |
| CLARA | F    | CENTRO  | B. HORIZONTE |
+-------+------+---------+--------------+

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
	INNER JOIN ENDERECO
	ON IDCLIENTE = ID_FK_CLIENTE
WHERE SEXO = 'M'; 
+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

/* NOME, SEXO, EMAIL, TIPO, NUMERO */

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE 
INNER JOIN TELEFONE
ON IDCLIENTE = ID_FK_CLIENTE;
+--------+------+----------------+------+----------+
| NOME   | SEXO | EMAIL          | TIPO | NUMERO   |
+--------+------+----------------+------+----------+
| JOAO   | M    | JOAOA@IG.COM   | CEL  | 87866896 |
| JOAO   | M    | JOAOA@IG.COM   | RES  | 99667587 |
| JOAO   | M    | JOAOA@IG.COM   | COM  | 66687899 |
| CARLOS | M    | CARLOSA@IG.COM | COM  | 54768899 |
| CARLOS | M    | CARLOSA@IG.COM | CEL  | 88687909 |
| ANA    | F    | ANA@IG.COM     | CEL  | 78989765 |
| ANA    | F    | ANA@IG.COM     | CEL  | 99766676 |
| JORGE  | M    | JORGE@IG.COM   | CEL  | 78458743 |
| JORGE  | M    | JORGE@IG.COM   | RES  | 56576876 |
| JORGE  | M    | JORGE@IG.COM   | RES  | 89986668 |
+--------+------+----------------+------+----------+

/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, 
TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE 
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_FK_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_FK_CLIENTE;

+--------+------+---------+----------------+------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+--------+------+---------+----------------+------+----------+
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 54768899 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 89986668 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 88687909 |
+--------+------+---------+----------------+------+----------+

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_FK_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_FK_CLIENTE;

+--------+------+---------+----------------+------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+--------+------+---------+----------------+------+----------+
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 54768899 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 89986668 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 88687909 |
+--------+------+---------+----------------+------+----------+


/*
	AULA 08  UNIDADE 05
	DML - DATA MANIPULATION LANGUAGE = TODOS OS COMANDOS QUE ALTEREM DADOS.
	DDL - DATA DEFINITION LANGUAGE
	DCL - DATA CONTROL LANGUAGE
	TCL - TRANSACTION CONTROL LANGUAGE

*/

/* INSERT */

+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int(11)       | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

INSERT INTO CLIENTE VALUES(NULL,'SAMANTHA','M','sa_mantha_123@gmial.com','7743749345');

+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| IDENDERECO    | int(11)     | NO   | PRI | NULL    | auto_increment |
| RUA           | varchar(30) | NO   |     | NULL    |                |
| BAIRRO        | varchar(30) | NO   |     | NULL    |                |
| CIDADE        | varchar(30) | NO   |     | NULL    |                |
| ESTADO        | char(2)     | NO   |     | NULL    |                |
| ID_FK_CLIENTE | int(11)     | YES  | UNI | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+

INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA SILVA','ALVORADA','NITEROI','RJ',7);

SELECT * FROM CLIENTE;

/* FILTROS */

SELECT * FROM CLIENTE
WHERE SEXO = 'M';

+-----------+----------+------+-------------------------+-------------+
| IDCLIENTE | NOME     | SEXO | EMAIL                   | CPF         |
+-----------+----------+------+-------------------------+-------------+
|         1 | JOAO     | M    | JOAOA@IG.COM            | 76567587887 |
|         2 | CARLOS   | M    | CARLOSA@IG.COM          | 5464553466  |
|         3 | ANA      | F    | ANA@IG.COM              | 456545678   |
|         4 | CLARA    | F    | NULL                    | 5687766856  |
|         5 | JORGE    | M    | JORGE@IG.COM            | 8756547688  |
|         6 | CELIA    | M    | JCELIA@IG.COM           | 5767876889  |
|         7 | SAMANTHA | M    | sa_mantha_123@gmial.com | 7743749345  |
+-----------+----------+------+-------------------------+-------------+

/* UPDATE */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 7;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 6;

/* DELETE */ 

+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int(11)       | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

INSERT INTO CLIENTE VALUES(NULL,'ADAMASTOR XXX DA SILVA','M',NULL,'333456789');
INSERT INTO CLIENTE VALUES(NULL,'ADAMASTINA DA SILVA','F',NULL,'333545888');
INSERT INTO CLIENTE VALUES(NULL,'SILVIA DA SILVA','F',NULL,'5525545888');


SELECT * FROM CLIENTE
WHERE IDCLIENTE = 8;

DELETE FROM CLIENTE WHERE IDCLIENTE = 8;

/* 
  DDL - DATA DEFINITION LANGUAGE
*/

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10,2) NOT NULL
);

/* ALTER TABLE */

/* ALTERANDO O NOME DE UMA COLUNA - CHANGE */

ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

LÓGICA DO CHANGE.
ALTER TABLE PRODUTO
CHANGE (CAMPO NOME ATUAL COLUNA) (CAMPO MANTER OU MUDAR O NOME DA COLUNA);

ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO INT;   (ERRADO NÃO DUPLICAR O NOME DA COLUNA.)

QUANDO USAMOS CHANGE ELE SERVIRÁ MAIS PARA MUDAR OS NOMES DAS COLUNAS, POR ISSO
SEMPRE TENHO QUE USAR O PREENCHIMENTO DOS DOIS CAMPOS.

ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT;

ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO VALOR_PRODUTO INT;

ALTER TABLE PRODUTO
CHANGE VALOR_PRODUTO VALOR_UNITARIO INT;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
CHANGE VALOR_PRODUTO VALOR_UNITARIO VARCHAR(50); 
(COMANDO ERRADO USANDO CHANGE)

COMANDO CHANGE APENAS VAI MODIFICAR OS NOMES E A REGRA BASE DO ATRIBUTO, MAS NÃO
MODIFICARÁ O ATRIBUTO PARA OUTRO.

/* MODIFY - ALTERANDO O TIPO */ 
COMANDO MAIS RECOMENDADO PARA MODIFICAR OS ATRIBUTOS.

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

/* ADICIONANDO COLUNAS */

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

/* APAGANDO UMA COLUNA */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA */

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

ALTER TABLE PRODUTO
DROP COLUMN PESO;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;

ALTER TABLE PRODUTO
DROP COLUMN PESO;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER VALOR_UNITARIO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


/* AULA 09  UNIDADE 05 */

IFNULL & VIEW

SELECT NOME, EMAIL, ESTADO
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_FK_CLIENTE;
INNER JOIN TELEFONE
ON IDCLIENTE = ID_FK_CLIENTE;

/* NOMECLATURAS SÃO MUITO INTERESSANTES, POIS ELAS PROJETAM O NOME DE TABELAS DE 
ACORDO COM A MINHA NOMECLATURA, MAS É MUITO BOM DE USAR PARA ABREVIAR NOMES DE TABELAS */

SELECT CL.NOME, CL.EMAIL, EN.ESTADO, TEL.NUMERO
FROM CLIENTE CL
INNER JOIN ENDERECO EN
ON CL.IDCLIENTE = EN.ID_FK_CLIENTE
INNER JOIN TELEFONE TEL
ON CL.IDCLIENTE = TEL.ID_FK_CLIENTE;

/* PARA TER GARANTIA DE FUNCIONALIDADE DO CODE INNER JOIN, USAR AS NOMECLATURAS */

/* ABAIXO VEJA O CODE ERRADO */

SELECT NOME, EMAIL, ESTADO, NUMERO
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_FK_CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_FK_CLIENTE;

ERROR 1052 (23000): Column 'ID_FK_CLIENTE' in on clause is ambiguous
CODIGO ACIMA ESTÁ ERRADO!!!

VAMOS INSERIR ALGUNS DADOS NOVOS COM EMAL NULO

INSERT INTO CLIENTE VALUES(NULL,'ADAMASTOR XXX DA SILVA','M',NULL,'333456789');
INSERT INTO CLIENTE VALUES(NULL,'ADAMASTINA DA SILVA','F',NULL,'333545888');
INSERT INTO CLIENTE VALUES(NULL,'SILVIA DA SILVA','F',NULL,'5525545888');

/* nome, email, numero, estado */

SELECT C.NOME, 
	C.EMAIL, 
	E.ESTADO, 
	T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_FK_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_FK_CLIENTE;

+--------+----------------+--------+----------+
| NOME   | EMAIL          | ESTADO | NUMERO   |
+--------+----------------+--------+----------+
| JORGE  | JORGE@IG.COM   | ES     | 78458743 |
| JORGE  | JORGE@IG.COM   | ES     | 56576876 |
| JOAO   | JOAOA@IG.COM   | RJ     | 87866896 |
| CARLOS | CARLOSA@IG.COM | RJ     | 54768899 |
| JOAO   | JOAOA@IG.COM   | RJ     | 99667587 |
| ANA    | ANA@IG.COM     | SP     | 78989765 |
| ANA    | ANA@IG.COM     | SP     | 99766676 |
| JOAO   | JOAOA@IG.COM   | RJ     | 66687899 |
| JORGE  | JORGE@IG.COM   | ES     | 89986668 |
| CARLOS | CARLOSA@IG.COM | RJ     | 88687909 |
+--------+----------------+--------+----------+

SELECT * FROM CLIENTE;
+-----------+------------------------+------+-------------------------+-------------+
| IDCLIENTE | NOME                   | SEXO | EMAIL                   | CPF         |
+-----------+------------------------+------+-------------------------+-------------+
|         1 | JOAO                   | M    | JOAOA@IG.COM            | 76567587887 |
|         2 | CARLOS                 | M    | CARLOSA@IG.COM          | 5464553466  |
|         3 | ANA                    | F    | ANA@IG.COM              | 456545678   |
|         4 | CLARA                  | F    | NULL                    | 5687766856  |
|         5 | JORGE                  | M    | JORGE@IG.COM            | 8756547688  |
|         6 | CELIA                  | F    | JCELIA@IG.COM           | 5767876889  |
|         7 | SAMANTHA               | F    | sa_mantha_123@gmial.com | 7743749345  |
|         8 | ADAMASTOR XXX DA SILVA | M    | NULL                    | 333456789   |
|        10 | ADAMASTINA DA SILVA    | F    | NULL                    | 333545888   |
|        11 | SILVIA DA SILVA        | F    | NULL                    | 5525545888  |
+-----------+-

SELECT NOME, EMAIL
FROM CLIENTE;

+------------------------+-------------------------+
| NOME                   | EMAIL                   |
+------------------------+-------------------------+
| JOAO                   | JOAOA@IG.COM            |
| CARLOS                 | CARLOSA@IG.COM          |
| ANA                    | ANA@IG.COM              |
| CLARA                  | NULL                    |
| JORGE                  | JORGE@IG.COM            |
| CELIA                  | JCELIA@IG.COM           |
| SAMANTHA               | sa_mantha_123@gmial.com |
| ADAMASTOR XXX DA SILVA | NULL                    |
| ADAMASTINA DA SILVA    | NULL                    |
| SILVIA DA SILVA        | NULL                    |
+------------------------+-------------------------+

IFNULL()

SELECT  C.NOME, 
		IFNULL(C.EMAIL,'NAO TEM EMAIL')
		FROM CLIENTE C;

SELECT  C.NOME, 
		IFNULL(C.EMAIL,'************')
		FROM CLIENTE C;

SELECT  C.NOME, 
		IFNULL(C.EMAIL,'SEM EMAIL') AS "E-MAIL"		
FROM CLIENTE C;

+------------------------+-------------------------+
| NOME                   | E-MAIL                  |
+------------------------+-------------------------+
| JOAO                   | JOAOA@IG.COM            |
| CARLOS                 | CARLOSA@IG.COM          |
| ANA                    | ANA@IG.COM              |
| CLARA                  | SEM EMAIL               |
| JORGE                  | JORGE@IG.COM            |
| CELIA                  | JCELIA@IG.COM           |
| SAMANTHA               | sa_mantha_123@gmial.com |
| ADAMASTOR XXX DA SILVA | SEM EMAIL               |
| ADAMASTINA DA SILVA    | SEM EMAIL               |
| SILVIA DA SILVA        | SEM EMAIL               |
+------------------------+-------------------------+

/* VIEW */

SELECT  C.NOME, 
		C.SEXO, 
		C.EMAIL, 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_FK_CLIENTE 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_FK_CLIENTE;

+---------------------+------+----------------+------+----------+---------+----------------+--------+
| NOME                | SEXO | EMAIL          | TIPO | NUMERO   | BAIRRO  | CIDADE         | ESTADO |
+---------------------+------+----------------+------+----------+---------+----------------+--------+
| JOAO                | M    | JOAOA@IG.COM   | CEL  | 87866896 | CENTRO  | RIO DE JANEIRO | RJ     |
| JOAO                | M    | JOAOA@IG.COM   | RES  | 99667587 | CENTRO  | RIO DE JANEIRO | RJ     |
| JOAO                | M    | JOAOA@IG.COM   | COM  | 66687899 | CENTRO  | RIO DE JANEIRO | RJ     |
| ANA                 | F    | ANA@IG.COM     | CEL  | 78989765 | JARDINS | SAO PAULO      | SP     |
| ANA                 | F    | ANA@IG.COM     | CEL  | 99766676 | JARDINS | SAO PAULO      | SP     |
| CARLOS              | M    | CARLOSA@IG.COM | COM  | 54768899 | ESTACIO | RIO DE JANEIRO | RJ     |
| CARLOS              | M    | CARLOSA@IG.COM | CEL  | 88687909 | ESTACIO | RIO DE JANEIRO | RJ     |
| JORGE               | M    | JORGE@IG.COM   | CEL  | 78458743 | CENTRO  | VITORIA        | ES     |
| JORGE               | M    | JORGE@IG.COM   | RES  | 56576876 | CENTRO  | VITORIA        | ES     |
| JORGE               | M    | JORGE@IG.COM   | RES  | 89986668 | CENTRO  | VITORIA        | ES     |
| ADAMASTINA DA SILVA | F    | NULL           | CEL  | 99687909 | CENTRO  | B. HORIZONTE   | MG     |
| ADAMASTINA DA SILVA | F    | NULL           | CEL  | 88687939 | CENTRO  | B. HORIZONTE   | MG     |
| ADAMASTINA DA SILVA | F    | NULL           | CEL  | 98987923 | CENTRO  | B. HORIZONTE   | MG     |
| ADAMASTINA DA SILVA | F    | NULL           | CEL  | 98987923 | CENTRO  | B. HORIZONTE   | MG     |
+---------------------+------+----------------+------+----------+---------+----------------+--------+

CREATE VIEW RELATORIO_VIEW_CODEBACKUP AS
SELECT  C.NOME, 
		C.SEXO, 
		C.EMAIL, 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_FK_CLIENTE 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_FK_CLIENTE;

SELECT * FROM RELATORIO_VIEW_CODEBACKUP;

CREATE VIEW RELATORIO_OTIMIZADO AS
SELECT  C.NOME, 
		C.SEXO, 
		C.EMAIL		
FROM CLIENTE C;

SELECT * FROM RELATORIO_OTIMIZADO;

mysql> SELECT * FROM RELATORIO_OTIMIZADO;
+------------------------+------+-------------------------+
| NOME                   | SEXO | EMAIL                   |
+------------------------+------+-------------------------+
| JOAO                   | M    | JOAOA@IG.COM            |
| CARLOS                 | M    | CARLOSA@IG.COM          |
| ANA                    | F    | ANA@IG.COM              |
| CLARA                  | F    | NULL                    |
| JORGE                  | M    | JORGE@IG.COM            |
| CELIA                  | F    | JCELIA@IG.COM           |
| SAMANTHA               | F    | sa_mantha_123@gmail.com |
| ADAMASTOR XXX DA SILVA | M    | NULL                    |
| ADAMASTINA DA SILVA    | F    | NULL                    |
| SILVIA DA SILVA        | F    | NULL                    |
+------------------------+------+-------------------------+

SHOW TABLES;
SHOW DATABASES;
SHOW VIEW; -- NAO EXISTE

/* APAGANDO UMA VIEW */

DROP VIEW RELATORIO;
DROP VIEW RELATORIO_OTIMIZADO;

/* INSERINDO UM PREFIXO */

CREATE VIEW V_RELATORIO AS
SELECT  C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'CLIENTE SEM EMAIL') AS "E-MAIL", 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_FK_CLIENTE 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_FK_CLIENTE;

SELECT * FROM V_RELATORIO;

mysql> SELECT * FROM V_RELATORIO;
+--------+------+----------------+------+----------+---------+----------------+--------+
| NOME   | SEXO | E-MAIL         | TIPO | NUMERO   | BAIRRO  | CIDADE         | ESTADO |
+--------+------+----------------+------+----------+---------+----------------+--------+
| JORGE  | M    | JORGE@IG.COM   | CEL  | 78458743 | CENTRO  | VITORIA        | ES     |
| JORGE  | M    | JORGE@IG.COM   | RES  | 56576876 | CENTRO  | VITORIA        | ES     |
| JOAO   | M    | JOAOA@IG.COM   | CEL  | 87866896 | CENTRO  | RIO DE JANEIRO | RJ     |
| CARLOS | M    | CARLOSA@IG.COM | COM  | 54768899 | ESTACIO | RIO DE JANEIRO | RJ     |
| JOAO   | M    | JOAOA@IG.COM   | RES  | 99667587 | CENTRO  | RIO DE JANEIRO | RJ     |
| ANA    | F    | ANA@IG.COM     | CEL  | 78989765 | JARDINS | SAO PAULO      | SP     |
| ANA    | F    | ANA@IG.COM     | CEL  | 99766676 | JARDINS | SAO PAULO      | SP     |
| JOAO   | M    | JOAOA@IG.COM   | COM  | 66687899 | CENTRO  | RIO DE JANEIRO | RJ     |
| JORGE  | M    | JORGE@IG.COM   | RES  | 89986668 | CENTRO  | VITORIA        | ES     |
| CARLOS | M    | CARLOSA@IG.COM | CEL  | 88687909 | ESTACIO | RIO DE JANEIRO | RJ     |
+--------+------+----------------+------+----------+---------+----------------+--------+

CREATE VIEW V_RELATORIO_OTIMIZADO AS
SELECT  C.NOME, 
		C.SEXO, 
		C.EMAIL		
FROM CLIENTE C;

SELECT * FROM V_RELATORIO_OTIMIZADO;

mysql> SELECT * FROM V_RELATORIO_OTIMIZADO;
+------------------------+------+-------------------------+
| NOME                   | SEXO | EMAIL                   |
+------------------------+------+-------------------------+
| JOAO                   | M    | JOAOA@IG.COM            |
| CARLOS                 | M    | CARLOSA@IG.COM          |
| ANA                    | F    | ANA@IG.COM              |
| CLARA                  | F    | NULL                    |
| JORGE                  | M    | JORGE@IG.COM            |
| CELIA                  | F    | JCELIA@IG.COM           |
| SAMANTHA               | F    | sa_mantha_123@gmial.com |
| ADAMASTOR XXX DA SILVA | M    | NULL                    |
| ADAMASTINA DA SILVA    | F    | NULL                    |
| SILVIA DA SILVA        | F    | NULL                    |
+------------------------+------+-------------------------+

mysql> SHOW TABLES;
+------------------------+
| Tables_in_loja_central |
+------------------------+
| cliente                |
| endereco               |
| produto                |
| relatorio_otimizado    |
| telefone               |
| v_relatorio            |
| v_relatorio_otimizado  |
+------------------------+



/* AULA 11  UNIDADE 05 */


/* ORDER BY */

CREATE TABLE ALUNOS(
	NUMERO INT,
	NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1,'JOAO');
INSERT INTO ALUNOS VALUES(1,'MARIA');
INSERT INTO ALUNOS VALUES(2,'ZOE');
INSERT INTO ALUNOS VALUES(2,'ANDRE');
INSERT INTO ALUNOS VALUES(3,'CLARA');
INSERT INTO ALUNOS VALUES(1,'CLARA');
INSERT INTO ALUNOS VALUES(4,'MAFRA');
INSERT INTO ALUNOS VALUES(5,'JANAINA');
INSERT INTO ALUNOS VALUES(1,'JANAINA');
INSERT INTO ALUNOS VALUES(3,'MARCELO');
INSERT INTO ALUNOS VALUES(4,'GIOVANI');
INSERT INTO ALUNOS VALUES(5,'ANTONIO');
INSERT INTO ALUNOS VALUES(6,'ANA');
INSERT INTO ALUNOS VALUES(6,'VIVIANE'); 

SELECT * FROM ALUNOS
ORDER BY NUMERO;

SELECT * FROM ALUNOS
ORDER BY 1;

SELECT * FROM ALUNOS
ORDER BY 2;

/* ORDENANDO POR MAIS DE UMA COLUNA */

SELECT * FROM ALUNOS
ORDER BY 1;

SELECT * FROM ALUNOS
ORDER BY NUMERO, NOME;

SELECT * FROM ALUNOS
ORDER BY 1, 2;

/* MESCLANDO ORDER BY COM PROJECAO */
 
SELECT NOME FROM ALUNOS
ORDER BY 1, 2;

SELECT NOME FROM ALUNOS
ORDER BY NUMERO, NOME;


/* ORDER BY DESC / ASC */

SELECT * FROM ALUNOS
ORDER BY 1, 2;

SELECT * FROM ALUNOS
ORDER BY 1 ASC;

SELECT * FROM ALUNOS
ORDER BY 1 DESC;

SELECT * FROM ALUNOS
ORDER BY 1, 2 DESC;

SELECT * FROM ALUNOS
ORDER BY 1 DESC, 2 DESC;

/* ORDENANDO COM JOINS */


SELECT  C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'CLIENTE SEM EMAIL') AS "E-MAIL", 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY 1;

SHOW TABLES;

SELECT * FROM V_RELATORIO
ORDER BY 1;

/* Delimitador */

SELECT  C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'CLIENTE SEM EMAIL') AS "E-MAIL", 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY 1

STATUS /* Comando STATUS, é um comando de estrutura de dados e não é um comando MYSQL, portanto
não será necessário delimitar com ponto e virgula. */