--Tabela Cliente
CREATE TABLE CLIENTE(
COD_CLI NUMBER(5) PRIMARY KEY,
NOME_CLI VARCHAR2(30) NOT NULL,
RG_CLI VARCHAR2(10) NOT NULL,
ENDERECO_CLI VARCHAR2(30) NOT NULL,
CIDADE_CLI VARCHAR2(30) NOT NULL,
TELEFONE_CLI VARCHAR2(15) NOT NULL,
DT_INSC_CLI DATE NOT NULL,
PNT_FID_CLI NUMBER(3)
);

--Tabela Cartão de Crédito
CREATE TABLE CARTAOCRED(
NUMERO_CC VARCHAR2(20) PRIMARY KEY,
BANDEIRA_CC VARCHAR2(15) NOT NULL,
CODSEG_CC NUMBER(3) NOT NULL,
BANCO_CC VARCHAR2(15) NOT NULL,
DT_VENC_CC VARCHAR2(5) NOT NULL,
COD_CLI NUMBER(5) NOT NULL,
FOREIGN KEY (COD_CLI) REFERENCES CLIENTE(COD_CLI)
);

--Tabela Categoria
CREATE TABLE CATEGORIA(
COD_CATEG NUMBER(5) PRIMARY KEY,
TIPO_CATEG VARCHAR2(15) NOT NULL
);

--Tabela Veículo
CREATE TABLE VEICULO(
COD_VEIC NUMBER(5) PRIMARY KEY,
MARCA_VEIC VARCHAR2(20) NOT NULL,
PLACA_VEIC VARCHAR(7) NOT NULL,
COD_CATEG NUMBER(5) NOT NULL,
FOREIGN KEY (COD_CATEG) REFERENCES CATEGORIA(COD_CATEG)
);

--Tabela Locação
CREATE TABLE LOCACAO(
COD_LOC NUMBER(5) PRIMARY KEY,
DT_LOCACAO_LOC DATE NOT NULL,
DT_DEV_LOC DATE,
VALOR_DIARIA_LOC NUMBER(5) NOT NULL,
VALOR_TOTAL_LOC DECIMAL(5,2) NOT NULL,
DESC_LOC DECIMAL(5,2) NOT NULL,
COD_CLI NUMBER(5) NOT NULL,
NUMERO_CC VARCHAR2(20) NOT NULL,
COD_VEIC NUMBER(5) NOT NULL,
FOREIGN KEY (COD_CLI) REFERENCES CLIENTE(COD_CLI),
FOREIGN KEY (NUMERO_CC) REFERENCES CARTAOCRED(NUMERO_CC),
FOREIGN KEY (COD_VEIC) REFERENCES VEICULO(COD_VEIC)
);

--Tabela Seguro
CREATE TABLE SEGURO(
COD_SEG NUMBER(5) PRIMARY KEY,
TIPO_SEG VARCHAR(20) NOT NULL
);

--Tabela Seguro Locacao
CREATE TABLE SEGLOC(
COD_LOC NUMBER(5),
COD_SEG NUMBER(5),
FOREIGN KEY (COD_LOC) REFERENCES LOCACAO(COD_LOC),
FOREIGN KEY (COD_SEG) REFERENCES SEGURO(COD_SEG)
);

--Inclusão na tabela Cliente
INSERT INTO CLIENTE
VALUES(1,'Pedro Fernandez da Silva','658793450','Ruas das Pedras 749', 'Itapetininga','32457698','02/03/2015',0);
INSERT INTO CLIENTE
VALUES(2,'Ricardo Carneiro Souza','329085462','Rua dos Bosque Verde 126','Sorocaba','32547865','05/03/2015',0); 
INSERT INTO CLIENTE
VALUES(3,'Vladimir da Concessão','659826517','Rua 28 de Junho 915','Sorocaba','32091567','15/03/2015',0);
INSERT INTO CLIENTE
VALUES(4,'Antonio Joaquim Silva','650935712','Avenida Venezuela 749','Votorantim','32256709','18/04/2015',0);
INSERT INTO CLIENTE
VALUES(5,'Rafael Souza Campos','858361946','Rua Capitão Silva 376','Botucatu','32546719','04/05/2015',0);
INSERT INTO CLIENTE
VALUES(6,'Fabricio Cesar da Silva','958344560','Rua Deodora da Souza','Piedade','32327698','06/05/2015',0);
INSERT INTO CLIENTE
VALUES(7,'Robson Fernandez Filho','126540367','Rua das Provincias','Sorocaba','32234589','13/06/2015',0);
INSERT INTO CLIENTE
VALUES(8,'Francisco Francis Filho','896592349','Avenida dos Paises Baixos','Bauru','32437609','20/06/2015',0);
INSERT INTO CLIENTE
VALUES(9,'Carlos João Silva','860346495','Rua 8 de Março','Votorantim','32092367','22/06/2015',0);
INSERT INTO CLIENTE
VALUES(10,'Maria Francisca da Silva','650925687','Rua das Marias da Silva','Sorocaba','32435678','02/07/2015',0);
INSERT INTO CLIENTE
VALUES(11,'Francisca Maria da Silva','659871239','Rua Rosada Risa 743','Votorantim','32325476','03/07/2015',0);

--Inclusão na tabela CARTAOCRED
INSERT INTO CARTAOCRED
VALUES('5487124598673478','MASTERCARD',656,'SANTADER','09/22',4);
INSERT INTO CARTAOCRED
VALUES('7612058492658749','VISA',540,'BRADESCO','08/20',2);
INSERT INTO CARTAOCRED
VALUES('8712560923728947','VISA',438,'BANCO DO BRASIL','01/25',1);
INSERT INTO CARTAOCRED
VALUES('9275347848293745','MASTERCARD',948,'ITAU','04/19',5);
INSERT INTO CARTAOCRED
VALUES('8543424257428894','VISA',175,'BRADESCO','08/25',3);
INSERT INTO CARTAOCRED
VALUES('8549037543764327','MASTERCARD',348,'ITAU','01/22',9);
INSERT INTO CARTAOCRED
VALUES('5839785947354379','MASTERCARD',045,'BANCO DO BRASIL','07/19',6);
INSERT INTO CARTAOCRED
VALUES('4729478237487237','VISA',377,'SANTANDER','05/23',10);
INSERT INTO CARTAOCRED
VALUES('6932943724872364','VISA',763,'ITAU','09/20',8);
INSERT INTO CARTAOCRED
VALUES('3290246362545734','MASTERCARD',874,'BRADESCO','04/18',7);
INSERT INTO CARTAOCRED
VALUES('6826432653509895','MASTERCARD',786,'BANCO DO BRASIL','03/19',11);


--Inclusão na tabela Seguro
INSERT INTO SEGURO
VALUES(1,'SIMPLES');
INSERT INTO SEGURO
VALUES(2,'CONTRA TERCEIROS');
INSERT INTO SEGURO
VALUES(3,'CONTRA ROUBO');
INSERT INTO SEGURO
VALUES(4,'TOTAL');

--Inclusão na tabela Categoria
INSERT INTO CATEGORIA
VALUES(1,'COMPACTO');
INSERT INTO CATEGORIA
VALUES(2,'MEDIO');
INSERT INTO CATEGORIA
VALUES(3,'GRANDE');
INSERT INTO CATEGORIA
VALUES(4,'SUPER LUXO');

--Inclusão na tabela Veículo
INSERT INTO VEICULO
VALUES(1,'TOYOTA','GEH9476',3);
INSERT INTO VEICULO
VALUES(2,'HONDA','FDO5720',2);
INSERT INTO VEICULO
VALUES(3,'HYUNDAI','DSD7632',3);
INSERT INTO VEICULO
VALUES(4,'VW','KWV5803',1);
INSERT INTO VEICULO
VALUES(5,'BENTLEY','DFD0983',4);

--Inclusão na tabela Locação
INSERT INTO LOCACAO
VALUES(1,'15/03/2015',NULL,500.00,0.00,0.00,3,'8543424257428894',5);
INSERT INTO LOCACAO
VALUES(2,'10/03/2015',NULL,180.00,0.00,0.00,1,'5487124598673478',3);
INSERT INTO LOCACAO
VALUES(3,'24/03/2015',NULL,100.00,0.00,0.00,4,'9275347848293745',4);
INSERT INTO LOCACAO
VALUES(4,'26/04/2015',NULL,150.00,0.00,0.00,2,'7612058492658749',2);
INSERT INTO LOCACAO
VALUES(5,'08/05/2015',NULL,160.00,0.00,0.00,5,'8543424257428894',1);
INSERT INTO LOCACAO
VALUES(6,'15/05/2015',NULL,150.00,0.00,0.00,8,'6932943724872364',2);
INSERT INTO LOCACAO
VALUES(7,'01/06/2015',NULL,100.00,0.00,0.00,9,'8549037543764327',4);
INSERT INTO LOCACAO
VALUES(8,'10/06/2015',NULL,500.00,0.00,0.00,6,'5839785947354379',5);
INSERT INTO LOCACAO
VALUES(9,'22/06/2015',NULL,100.00,0.00,0.00,10,'4729478237487237',4);
INSERT INTO LOCACAO
VALUES(10,'05/07/2015',NULL,180.00,0.00,0.00,7,'3290246362545734',3);
INSERT INTO LOCACAO
VALUES(11,'18/07/2015',NULL,160.00,0.00,0.00,3,'8543424257428894',1);
INSERT INTO LOCACAO
VALUES(12,'01/08/2015',NULL,100.00,0.00,0.00,9,'8549037543764327',4);
INSERT INTO LOCACAO
VALUES(13,'04/08/2015',NULL,100.00,0.00,0.00,10,'4729478237487237',4);
INSERT INTO LOCACAO
VALUES(14,'07/08/2015',NULL,100.00,0.00,0.00,3,'8543424257428894',4);
INSERT INTO LOCACAO
VALUES(15,'10/08/2015',NULL,100.00,0.00,0.00,8,'6932943724872364',4);
INSERT INTO LOCACAO
VALUES(16,'13/08/2015',NULL,100.00,0.00,0.00,7,'3290246362545734',4);
INSERT INTO LOCACAO
VALUES(17,'16/08/2015',NULL,100.00,0.00,0.00,10,'4729478237487237',4);
INSERT INTO LOCACAO
VALUES(18,'19/08/2015',NULL,100.00,0.00,0.00,4,'9275347848293745',4);
INSERT INTO LOCACAO
VALUES(19,'22/08/2015',NULL,100.00,0.00,0.00,8,'6932943724872364',4);
INSERT INTO LOCACAO
VALUES(20,'25/08/2015',NULL,100.00,0.00,0.00,6,'5839785947354379',4);
INSERT INTO LOCACAO
VALUES(21,'26/08/2015',NULL,160.00,0.00,0.00,7,'3290246362545734',1);
INSERT INTO LOCACAO
VALUES(22,'28/08/2015',NULL,100.00,0.00,0.00,9,'8549037543764327',4);
INSERT INTO LOCACAO
VALUES(23,'31/08/2015',NULL,100.00,0.00,0.00,5,'8543424257428894',4);
INSERT INTO LOCACAO
VALUES(24,'05/09/2015',NULL,150.00,0.00,0.00,6,'5839785947354379',2);
INSERT INTO LOCACAO
VALUES(25,'16/09/2015',NULL,180.00,0.00,0.00,9,'8549037543764327',3);
INSERT INTO LOCACAO
VALUES(26,'28/09/2015',NULL,150.00,0.00,0.00,5,'8543424257428894',2);
INSERT INTO LOCACAO
VALUES(27,'04/10/2015',NULL,100.00,0.00,0.00,2,'7612058492658749',4);
INSERT INTO LOCACAO
VALUES(28,'12/10/2015',NULL,180.00,0.00,0.00,8,'6932943724872364',3);
INSERT INTO LOCACAO
VALUES(29,'21/10/2015',NULL,160.00,0.00,0.00,1,'5487124598673478',1);
INSERT INTO LOCACAO
VALUES(30,'26/10/2015',NULL,500.00,0.00,0.00,7,'3290246362545734',5);
INSERT INTO LOCACAO
VALUES(31,'01/10/2015',NULL,100.00,0.00,0.00,9,'8549037543764327',4);
INSERT INTO LOCACAO
VALUES(32,'04/10/2015',NULL,100.00,0.00,0.00,10,'4729478237487237',4);
INSERT INTO LOCACAO
VALUES(33,'07/10/2015',NULL,100.00,0.00,0.00,3,'8543424257428894',4);
INSERT INTO LOCACAO
VALUES(34,'10/10/2015',NULL,100.00,0.00,0.00,8,'6932943724872364',4);
INSERT INTO LOCACAO
VALUES(35,'13/10/2015',NULL,100.00,0.00,0.00,7,'3290246362545734',4);
INSERT INTO LOCACAO
VALUES(36,'16/10/2015',NULL,100.00,0.00,0.00,10,'4729478237487237',4);
INSERT INTO LOCACAO
VALUES(37,'19/10/2015',NULL,100.00,0.00,0.00,4,'9275347848293745',4);
INSERT INTO LOCACAO
VALUES(38,'22/10/2015',NULL,100.00,0.00,0.00,8,'6932943724872364',4);
INSERT INTO LOCACAO
VALUES(39,'25/10/2015',NULL,100.00,0.00,0.00,6,'5839785947354379',4);
INSERT INTO LOCACAO
VALUES(40,'26/10/2015',NULL,160.00,0.00,0.00,7,'3290246362545734',1);
INSERT INTO LOCACAO
VALUES(41,'28/10/2015',NULL,100.00,0.00,0.00,9,'8549037543764327',4);
INSERT INTO LOCACAO
VALUES(42,'31/10/2015',NULL,100.00,0.00,0.00,5,'8543424257428894',4);

--Inclusão na tabela Seguro Locação
INSERT INTO SEGLOC
VALUES(1,4);
INSERT INTO SEGLOC
VALUES(2,2);
INSERT INTO SEGLOC
VALUES(3,1);
INSERT INTO SEGLOC
VALUES(4,3);
INSERT INTO SEGLOC
VALUES(5,4);

--4.1 Adicionar o campo Data de Inclusão na tabela Locacao
ALTER TABLE LOCACAO  ADD DT_INC_LOC DATE;

UPDATE LOCACAO
SET DT_INC_LOC = SYSDATE;

--4.2 Retornar o nome dos clientes que possuiem Silva como sobrenome
SELECT COD_CLI, NOME_CLI
FROM CLIENTE
WHERE NOME_CLI LIKE '%Silva';

--4.3 Retornar o código e nome do carro que estão na categoria Grande ou Super Luxo
SELECT COD_VEIC, MARCA_VEIC
FROM VEICULO
WHERE COD_CATEG = 4 OR COD_CATEG = 3;

--4.4  Retorna o código e nome dos clientes que foram cadastrados no meu de Março
SELECT COD_CLI, NOME_CLI
FROM CLIENTE
WHERE DT_INSC_CLI BETWEEN '01/03/2015' AND '31/03/2015';

--4.5 Junção da tabela Cliente e Cartão de Crédito
SELECT *
FROM CLIENTE 
INNER JOIN CARTAOCRED ON CLIENTE.COD_CLI = CARTAOCRED.COD_CLI;

--4.6 Junção da tabela Cliente, Locacao e Veículo
SELECT *
FROM CLIENTE
INNER JOIN LOCACAO ON CLIENTE.COD_CLI = LOCACAO.COD_CLI
INNER JOIN VEICULO ON VEICULO.COD_VEIC = LOCACAO.COD_VEIC;

--4.7 Retornar a quantidade de locações realizadas
SELECT COUNT(*)
FROM LOCACAO;

--4.8 Retornar a soma dos valores das locações realizadas
SELECT SUM(VALOR_TOTAL_LOC)
FROM LOCACAO;

--4.9 Retornar o nome do veiculo e sua diaria e retornar a quantidade de locações e o nome do cliente
--GROUP BY serve para agrupar um determinado campo pelo tipo de grupo 
SELECT MARCA_VEIC AS "Marca do Veículo", VALOR_DIARIA_LOC AS "Diária"
FROM VEICULO, LOCACAO
WHERE LOCACAO.COD_VEIC = VEICULO.COD_VEIC
GROUP BY MARCA_VEIC, VALOR_DIARIA_LOC;

SELECT COUNT(LOCACAO.COD_CLI) AS "Quantidade de Locações", CLIENTE.NOME_CLI AS "Nome do Cliente"
FROM CLIENTE, LOCACAO
WHERE LOCACAO.COD_CLI = CLIENTE.COD_CLI 
GROUP BY CLIENTE.NOME_CLI;

--4.10 Retornar a quantidade de locações e os nomes dos clientes que fizeram mais de 2 locações no segundo semestre de 2015
--O HAVING serve para filtra o retorno do agrupamento
SELECT COUNT(LOCACAO.COD_CLI) AS "Quantidade de Locações", CLIENTE.NOME_CLI AS "Nome do Cliente"
FROM CLIENTE, LOCACAO
WHERE LOCACAO.COD_CLI = CLIENTE.COD_CLI AND LOCACAO.DT_LOCACAO_LOC BETWEEN '01/07/2015' AND '31/12/2015' 
GROUP BY CLIENTE.NOME_CLI
HAVING COUNT(LOCACAO.COD_CLI) > 2;

--4.11  Retorna os nomes de clientes em ordem alfabetica que moram em Sorocaba
--O ORDER BY serve para ordenar um determinar dados de forma crescente ou decrescente
SELECT NOME_CLI
FROM CLIENTE
WHERE CIDADE_CLI = 'Sorocaba'
ORDER BY NOME_CLI;

--4.12 Retorna o nome do cliente que locou o carro Bentley
SELECT NOME_CLI AS "Nome do Cliente"
FROM CLIENTE
WHERE COD_CLI = ANY ( SELECT COD_CLI
                      FROM LOCACAO
                      WHERE COD_VEIC = 5);

--4.13 Retornar o nome do cliente que possui a bandeira do Visa
SELECT NOME_CLI AS "Nome do Cliente"
FROM CLIENTE
WHERE COD_CLI IN ( SELECT COD_CLI
                   FROM CARTAOCRED
                   WHERE BANDEIRA_CC = 'VISA');
                   
--4.14 Retornar o nome do cliente que não fez locação
SELECT NOME_CLI AS "Nome do Cliente"
FROM CLIENTE
WHERE COD_CLI NOT IN ( SELECT LOCACAO.COD_CLI
                       FROM CLIENTE, LOCACAO
                       WHERE CLIENTE.COD_CLI = LOCACAO.COD_CLI);
                       
--4.15 Retornar a marca do veiculo e sua categoria que ja foram locados
SELECT MARCA_VEIC, CATEGORIA.TIPO_CATEG
FROM VEICULO, CATEGORIA
WHERE VEICULO.COD_CATEG = CATEGORIA.COD_CATEG AND EXISTS ( SELECT *
                                                           FROM LOCACAO, CLIENTE
                                                           WHERE LOCACAO.COD_CLI = CLIENTE.COD_CLI)
ORDER BY MARCA_VEIC;

--4.16 Retornar o nome e o banco do cliente de quem não locou um veiculo
SELECT NOME_CLI, BANCO_CC
FROM CLIENTE, CARTAOCRED
WHERE CARTAOCRED.COD_CLI = CLIENTE.COD_CLI AND NOT EXISTS ( SELECT *
                                                            FROM LOCACAO
                                                            WHERE CLIENTE.COD_CLI = LOCACAO.COD_CLI);
                                                            
--4.17 Atualizar o valor total das locações em 10%
UPDATE LOCACAO
SET VALOR_TOTAL_LOC = VALOR_TOTAL_LOC * 1.1
WHERE COD_VEIC IN ( SELECT COUNT(*)
                    FROM VEICULO, LOCACAO
                    WHERE LOCACAO.COD_VEIC = VEICULO.COD_VEIC);
                    
--4.18 Deletar o veículo que não teve locação
DELETE
FROM VEICULO
WHERE COD_VEIC NOT IN ( SELECT COD_VEIC
                        FROM LOCACAO
                        WHERE LOCACAO.COD_VEIC = VEICULO.COD_VEIC);
                        
--5.1 Criar um trigger que salva na tabela clienteapg o cliente excluido 
CREATE TABLE CLIENTEAPG (
CODIGO NUMBER(5),
NOME VARCHAR2(30),
TELEFONE VARCHAR(15),
DT_EXCLUSAO DATE,
USR_EXCLUSAO VARCHAR2(15)
);

create or replace trigger ExclusaoCliente
  before delete on cliente
  for each row
begin
  insert into clienteapg
  values(:old.cod_cli,:old.nome_cli,:old.telefone_cli,sysdate,user);
end ExclusaoCliente;

DELETE
FROM CLIENTE
WHERE COD_CLI = 11;

--5.2 Criar uma stored procedure que calcule o valor total a ser pago
CREATE TABLE VALORCLIENTE(
COD_LOC NUMBER(5),
NOME_CLI VARCHAR2(30),
DT_LOCACAO_LOC DATE,
VALOR_TOTAL_LOC DECIMAL(5,2)
);

select DT_DEV_LOC - DT_LOCACAO_LOC
from locacao
where COD_LOC = 1;

create or replace procedure cli_valort(codcli number)
as
  l_dias number(5);
  s_valor decimal(4,2);
  s_tipo varchar2(20);
begin
  select dt_dev_loc - dt_locacao_loc into l_dias
    from locacao
    where locacao.cod_cli = codcli;
  select seguro.cod_seg into s_tipo
    from locacao, segloc, seguro
    where locacao.cod_loc = segloc.cod_loc and seguro.cod_seg = segloc.cod_seg;
  if s_tipo = 1 then
    s_valor := 100;
  elsif s_tipo = 2 then
    s_valor := 150;
  elsif s_tipo = 3 then
    s_valor := 200;
  else
    s_valor := 450;
  end if;
  update locacao
    set valor_total_loc = (l_dias * valor_diaria_loc + s_valor);
end;

--5.3 Retornar a quantidade de ponto de fidelidade do cliente
create or replace trigger PontoFid
  before update on locacao
  for each row
declare
  pntfd number(3);
  veic number(5);
  l_dias number(5);
begin
  select veiculo.cod_categ into veic
    from veiculo, locacao
    where veiculo.cod_veic = locacao.cod_veic;
  select dt_dev_loc - dt_locacao_loc into l_dias
    from locacao;
  if veic = 1 then
    update cliente
      set pnt_fid_cli = 1 * l_dias;
  elsif veic = 2 then
    update cliente
      set pnt_fid_cli = 2 * l_dias;
  elsif veic = 3 then
    update cliente
      set pnt_fid_cli = 3 * l_dias;
  else
    update cliente
      set pnt_fid_cli = 4 * l_dias;
  end if;
end PontoFid;

--5.4 Retornar a quantidade de locações do cliente
create or replace function QtdeLoc(codcli number)
return number
as
cont number;
begin
  select count(locacao.cod_cli) into cont
  from locacao
  where locacao.cod_cli = codcli;
  exception
    when no_data_found then
      RAISE_APPLICATION_ERROR(-20001, 'O cliente nao existe!');
end;

--5.5 Criar uma stored procedura de manutenção do veiculo de outubro
CREATE TABLE MANPREVENOUT(
COD_VEIC NUMBER(5),
MES VARCHAR2(15),
DT_MANUT DATE
);

create or replace procedure ManPrevenOutubro (codveic number)
as
  cont number;
begin
  select count(locacao.cod_veic) into cont
    from locacao
    where locacao.cod_veic = codveic AND DT_LOCACAO_LOC BETWEEN '01/10/2015' AND '31/10/2015';
  if cont > 10 then
    insert into manprevenout
    values(codveic,'Outubro',sysdate);
    DBMS_OUTPUT.put_line('Veículo deverá passar por manutenção preventiva');
  end if;
end;

--5.6 Retornar o desconto do cliente
create or replace function DescPntFid (codcli number)
return number
as
  pntfid number;
begin
  select pnt_fid_cli into pntfid
    from cliente
    where cliente.cod_cli = codcli;
  if pntfid > 200 then
    DBMS_OUTPUT.put_line('Cliente tem direito a 10% de desconto no valor da diária');
  elsif pntfid >= 100 and pntfid <= 200 then
    DBMS_OUTPUT.put_line('Cliente tem direito a 5 de desconto no valor da diária');
  else
    DBMS_OUTPUT.put_line('Cliente não tem direito a desconto no valor da diária');
  end if;
end;