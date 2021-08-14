CREATE TABLE IF NOT EXISTS banco(
    numero INTEGER NOT NULL,
    nome VARCHAR(100) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (numero)
);

CREATE TABLE IF NOT EXISTS agencia(
    banco_numero INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    nome VARCHAR(80) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(banco_numero, numero),
    FOREIGN KEY(banco_numero) REFERENCES banco(numero)
);

CREATE TABLE IF NOT EXISTS cliente(
    numero BIGSERIAL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(250) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS conta_corrente(    
    banco_numero INTEGER NOT NULL,
    agencia_numero INTEGER NOT NULL,
    numero BIGINT NOT NULL,
    digito SMALLINT NOT NULL,
    cliente_numero BIGINT NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(banco_numero, agencia_numero, numero, digito, cliente_numero),
    FOREIGN KEY (banco_numero, agencia_numero) REFERENCES agencia (banco_numero, numero),
    FOREIGN KEY (cliente_numero) REFERENCES cliente (numero)
);

CREATE TABLE  IF NOT EXISTS tipo_tansacao(
    id SMALLSERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS cliente_transacoes(
    id BIGSERIAL PRIMARY KEY,
    banco_numero INTEGER NOT NULL,
    agencia_numero INTEGER NOT NULL,
    conta_corrente_numero BIGINT NOT NULL,
    conta_corrente_digito SMALLINT NOT NULL,
    cliente_numero BIGINT NOT NULL,
    tipo_tansacao_id SMALLINT NOT NULL,
    valor NUMERIC(15,2) NOT NULL,
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (banco_numero, agencia_numero,conta_corrente_numero, conta_corrente_digito, cliente_numero) REFERENCES conta_corrente (banco_numero, agencia_numero,numero,digito, cliente_numero)
);



-- CREATE TABLE IF NOT EXISTS banco (
-- 	numero INTEGER NOT NULL,
-- 	nome VARCHAR(50) NOT NULL,
-- 	ativo BOOLEAN NOT NULL DEFAULT TRUE,
-- 	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
-- 	PRIMARY KEY (numero)
-- );

-- CREATE TABLE IF NOT EXISTS agencia (
-- 	banco_numero INTEGER NOT NULL,
-- 	numero INTEGER NOT NULL,
-- 	nome VARCHAR(80) NOT NULL,
-- 	ativo BOOLEAN NOT NULL DEFAULT TRUE,
-- 	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
-- 	PRIMARY KEY (banco_numero,numero),
-- 	FOREIGN KEY (banco_numero) REFERENCES banco (numero)
-- );

-- CREATE TABLE IF NOT EXISTS cliente (
-- 	numero BIGSERIAL PRIMARY KEY,
-- 	nome VARCHAR(120) NOT NULL,
-- 	email VARCHAR(250) NOT NULL,
-- 	ativo BOOLEAN NOT NULL DEFAULT TRUE,
-- 	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE IF NOT EXISTS conta_corrente (
-- 	banco_numero INTEGER NOT NULL,
-- 	agencia_numero INTEGER NOT NULL,
-- 	numero BIGINT NOT NULL,
-- 	digito SMALLINT NOT NULL,
-- 	cliente_numero BIGINT NOT NULL,
-- 	ativo BOOLEAN NOT NULL DEFAULT TRUE,
-- 	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
-- 	PRIMARY KEY (banco_numero,agencia_numero,numero,digito,cliente_numero),
-- 	FOREIGN KEY (banco_numero,agencia_numero) REFERENCES agencia (banco_numero,numero),
-- 	FOREIGN KEY (cliente_numero) REFERENCES cliente (numero)
-- );

-- CREATE TABLE IF NOT EXISTS tipo_transacao (
-- 	id SMALLSERIAL PRIMARY KEY,
-- 	nome VARCHAR(50) NOT NULL,
-- 	ativo BOOLEAN NOT NULL DEFAULT TRUE,
-- 	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE IF NOT EXISTS cliente_transacoes (
-- 	id BIGSERIAL PRIMARY KEY,
-- 	banco_numero INTEGER NOT NULL,
-- 	agencia_numero INTEGER NOT NULL,
-- 	conta_corrente_numero BIGINT NOT NULL,
-- 	conta_corrente_digito SMALLINT NOT NULL,
-- 	cliente_numero BIGINT NOT NULL,
-- 	tipo_transacao_id SMALLINT NOT NULL,
-- 	valor NUMERIC(15,2) NOT NULL,
-- 	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
-- 	FOREIGN KEY (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero) REFERENCES conta_corrente(banco_numero,agencia_numero,numero,digito,cliente_numero)
-- );




-- CREATE TABLE IF NOT EXISTS teste_a (id serial primary key, valor varchar(10));
-- CREATE TABLE IF NOT EXISTS teste_b (id serial primary key, valor varchar(10));



-- INSERT INTO teste_a (valor) VALUES ('teste1');
-- INSERT INTO teste_a (valor) VALUES ('teste2');
-- INSERT INTO teste_a (valor) VALUES ('teste3');
-- INSERT INTO teste_a (valor) VALUES ('teste4');

-- INSERT INTO teste_b (valor) VALUES ('teste_a');
-- INSERT INTO teste_b (valor) VALUES ('teste_b');
-- INSERT INTO teste_b (valor) VALUES ('teste_c');
-- INSERT INTO teste_b (valor) VALUES ('teste_d');


-- SELECT tbla.valor, tblb.valor
-- FROM teste_a tbla
-- CROSS JOIN teste_b  tblb;


-- DROP TABLE IF EXISTS teste_a;
-- DROP TABLE IF EXISTS teste_b;