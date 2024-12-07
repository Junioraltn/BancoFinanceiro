CREATE DATABASE IF NOT EXISTS Banco;
USE Banco;

CREATE TABLE Clientes(
	cpf CHAR(11) PRIMARY KEY,
    p_nome VARCHAR(10) NOT NULL,
    sobreNome VARCHAR(45) NOT NULL,
    endereco VARCHAR(255)
);
CREATE TABLE ContasBancarias(
	numeroDaConta INT AUTO_INCREMENT PRIMARY KEY,
    titular CHAR(11) NOT NULL,
    tipoConta ENUM('Corrente','Poupança','Salário') DEFAULT 'Corrente',
    saldoInicial FLOAT DEFAULT 0,
    saldo FLOAT DEFAULT 0,
    cbStatus BOOLEAN DEFAULT true,
    CONSTRAINT fk_CB_titular FOREIGN KEY (titular) REFERENCES Clientes(cpf)
);
CREATE TABLE Correntes(
	idCorrente INT AUTO_INCREMENT PRIMARY KEY,
    numeroDaConta INT NOT NULL,
    titular CHAR(11) NOT NULL,
    tarifa FLOAT NOT NULL DEFAULT 0.002,
    CONSTRAINT fk_C_nConta FOREIGN KEY (numeroDaConta) REFERENCES ContasBancarias(numeroDaConta),
    CONSTRAINT fk_C_titular FOREIGN KEY (titular) REFERENCES ContasBancarias(titular)
);
CREATE TABLE Poupancas(
	idPoupanca INT AUTO_INCREMENT PRIMARY KEY,
	numeroDaConta INT NOT NULL,
    titular CHAR(11) NOT NULL,
    rendimento FLOAT NOT NULL DEFAULT 0.006,
    CONSTRAINT fk_P_nConta FOREIGN KEY (numeroDaConta) REFERENCES ContasBancarias(numeroDaConta),
    CONSTRAINT fk_P_titular FOREIGN KEY (titular) REFERENCES ContasBancarias(titular)
);
CREATE TABLE CSalarios(
	idCSalario INT AUTO_INCREMENT PRIMARY KEY,
	numeroDaConta INT NOT NULL,
    titular CHAR(11) NOT NULL,
    CONSTRAINT fk_S_nConta FOREIGN KEY (numeroDaConta) REFERENCES ContasBancarias(numeroDaConta),
    CONSTRAINT fk_S_titular FOREIGN KEY (titular) REFERENCES ContasBancarias(titular)
);
CREATE TABLE Trasacoes(
	idTrasacao INT AUTO_INCREMENT PRIMARY KEY,
	numeroDaConta INT NOT NULL,
    titular CHAR(11) NOT NULL,
    tipoOperacao ENUM('Saque', 'Depósito', 'Transferência', 'Investimento', 'Consulta') DEFAULT 'Consulta' NOT NULL,
    Tdata DATETIME NOT NULL,
    valor FLOAT NOT NULL,
    contaTrasacao INT,
	CONSTRAINT fk_T_nConta FOREIGN KEY (numeroDaConta) REFERENCES ContasBancarias(numeroDaConta),
    CONSTRAINT fk_T_titular FOREIGN KEY (titular) REFERENCES ContasBancarias(titular)
);