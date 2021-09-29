CREATE TABLE IF NOT EXISTS clientes (
	cpf int(11) NOT NULL,
	rg int(10) NOT NULL,
    cnh int NOT NULL,
    endereco varchar(200) NOT NULL,
	nome varchar(100) NOT NULL,
	email varchar(100) NOT NULL,
	nascimento date NOT NULL,
	PRIMARY KEY (cpf)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS funcionarios (
	cpf int(11) NOT NULL,
	nome varchar(100) NOT NULL,
	email varchar(100) NOT NULL,
	nascimento date NOT NULL,
	PRIMARY KEY (cpf)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS carro (
	placa varchar(100) NOT NULL,
    modelo varchar(200) NOT NULL,
	marca varchar(100) NOT NULL,
	cor varchar(100) NOT NULL,
	ano date NOT NULL,
	PRIMARY KEY (placa)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS pedido_locacao (
	id int NOT NULL AUTO_INCREMENT,
    cpf_cliente int(11) NOT NULL,
    cpf_funcionario int(11) NOT NULL,
	placa_carro varchar(100) NOT NULL,
	data_pedido date NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY(cpf_cliente) REFERENCES clientes(cpf),
    FOREIGN KEY(cpf_funcionario) REFERENCES funcionarios(cpf),
    FOREIGN KEY(placa_carro) REFERENCES carro(placa)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS nota_fiscal (
	id int NOT NULL AUTO_INCREMENT,
    id_pedido int(11) NOT NULL,
	data_retirada date NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY(id_pedido) REFERENCES pedido_locacao(id)
) ENGINE=InnoDB;