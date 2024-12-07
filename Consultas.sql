-- Relação dos Clientes:
SELECT * FROM Clientes;
-- Relação de Contas ATIVAS:
SELECT * FROM ContasBancarias WHERE cbStatus = true;
-- Quantos clientes tem mais de uma conta?
SELECT CONCAT(c.p_nome,' ',c.sobreNome) AS Nome_Completo, COUNT(*) AS Numero_de_Contas
	FROM Clientes c
    INNER JOIN ContasBancarias cB ON c.cpf = cB.titular
    GROUP BY Nome_Completo
    HAVING Numero_de_Contas >1;
-- Relação de Transações por Clientes:
SELECT CONCAT(c.p_nome,' ',c.sobreNome) AS Nome_Completo, t.tipoOperacao, SUM(t.valor)
	FROM Trasacoes t
		INNER JOIN Clientes c ON t.titular = c.cpf
        GROUP BY Nome_Completo, t.tipoOperacao;