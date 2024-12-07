-- CLIENTES
INSERT INTO Clientes
	VALUES ('12345678901','ABCDE','FGHIJKL','1234 ABCD'),
			('22345678902','BBCDE','GGHIJKL','2234 BBCD'),
            ('32345678903','CBCDE','HGHIJKL','3234 CBCD'),
            ('42345678904','DBCDE','IGHIJKL',NULL),
            ('52345678905','EBCDE','JGHIJKL','5234 EBCD'),
            ('62345678906','FBCDE','KGHIJKL','6234 FBCD');
-- CONTAS BANCARIAS
INSERT INTO ContasBancarias(titular,tipoConta,saldoInicial,saldo,cbStatus)
	VALUES (12345678901,'Corrente',DEFAULT,250.00,DEFAULT),
			(22345678902,'Poupança',100.0,100.0,DEFAULT),
            ('32345678903',DEFAULT,345.0,345.0,DEFAULT),
            ('42345678904','Corrente',DEFAULT,DEFAULT,DEFAULT),
            ('52345678905','Salário',500.0,500.0,DEFAULT),
            ('62345678906','Poupança',DEFAULT,400.0,DEFAULT),
            ('42345678904','Poupança',400.0,400.0,DEFAULT);
-- CONTAS CORRENTE
INSERT INTO Correntes(numeroDaConta,titular,tarifa)
VALUES (7,'12345678901',DEFAULT),
		(2,'32345678903',0.005),
		(3,'42345678904',DEFAULT);
-- CONTAS POUPANÇA
INSERT INTO Poupancas(numeroDaConta,titular,rendimento)
VALUES	(1,'22345678902',0.01),
		(5,'62345678906',DEFAULT),
        (6,'42345678904',DEFAULT);
-- CONTAS SALÁRIOS
INSERT INTO CSalarios(numeroDaConta,titular)
VALUES (4,'52345678905');
-- TRANSAÇÕES
INSERT INTO Trasacoes(numeroDaConta,titular,tipoOperacao,Tdata,valor,contaTrasacao)
VALUES (4,'52345678905','Saque','2024-12-06 18:10:05',500.0,NULL),
		(6,'42345678904','Depósito','2024-12-06 19:15:00',1500.0,6),
        (3,'42345678904','Depósito','2024-12-06 20:00:50',200.0,188),
        (7,'12345678901','Transferência','2024-12-06 20:06:00',50.0,8896),
        (2,'32345678903','Investimento','2024-12-06 20:35:10',300.0,NULL);