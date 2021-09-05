CREATE TABLE IF NOT EXISTS funcionarios(
    id SERIAL, 
    nome VARCHAR(100),
    gerente INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (gerente) REFERENCES funcionarios(id)
);


INSERT INTO funcionarios (nome, gerente) VALUES ('Batman',null);
INSERT INTO funcionarios (nome, gerente) VALUES ('Goku',1);
INSERT INTO funcionarios (nome, gerente) VALUES ('Vegeta',1);
INSERT INTO funcionarios (nome, gerente) VALUES ('Gohan',2);
INSERT INTO funcionarios (nome, gerente) VALUES ('Goten',2);


CREATE OR REPLACE RECURSIVE VIEW vw_func(id, gerente, funcionario) AS(
    SELECT id, gerente, nome
    FROM funcionarios
    WHERE gerente IS NULL

    UNION ALL

    SELECT funcionarios.id, funcionarios.gerente, funcionarios.nome
    FROM funcionarios
    JOIN vw_func ON vw_func.id = funcionarios.gerente
);


SELECT id, gerente, funcionario
from vw_func;

