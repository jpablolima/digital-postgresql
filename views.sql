SELECT nome, numero, ativo
from banco;


CREATE OR REPLACE VIEW vw_bancos AS (
    SELECT numero, nome, ativo
    FROM banco
);

-- Chamando view
SELECT numero, nome, ativo
FROM vw_bancos;


CREATE OR REPLACE VIEW vw_bancos_2 (banco_numero, banco_nome, banco_ativo) AS (
    SELECT numero, nome, ativo
    FROM banco;
);

SELECT banco_numero, banco_nome, banco_ativo
FROM vw_bancos_2;


INSERT INTO vw_bancos_2 (banco_numero, banco_nome, banco_ativo)
VALUES(51, 'Banco Boa Ideia', TRUE);


SELECT banco_numero, banco_nome, banco_ativo
FROM vw_bancos_2 WHERE banco_numero = 51;

UPDATE vw_bancos_2 
SET banco_ativo = FALSE 
WHERE banco_numero = 51;


CREATE OR REPLACE TEMPORARY VIEW vw_agencias AS (
    SELECT nome 
    FROM agencia
);


CREATE OR REPLACE VIEW vw_bancos_ativos AS(
    SELECT numero, nome, ativo
    FROM banco
    WHERE ativo IS TRUE
) WITH LOCAL CHECK OPTION;


INSERT INTO vw_bancos_ativos (numero, nome, ativo)
VALUES (51,'Bancod Dragon Ball', FALSE);

SELECT numero, nome, ativo
FROM vw_bancos_ativos 
WHERE numero = 52;



CREATE OR REPLACE VIEW vw_bancos_com_h AS (
    SELECT numero, nome, ativo
    FROM vw_bancos_ativos
    WHERE nome ILIKE 'h%'
) WITH LOCAL CHECK OPTION;


SELECT nome
FROM vw_bancos_com_h
WHERE nome = '%h';
