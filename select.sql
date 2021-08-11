SELECT  numero, nome FROM banco;
SELECT banco_numero, nome FROM agencia;
SELECT numero, nome, email FROM cliente;
SELECT id, nome FROM tipo_transacao;
SELECT banco_numero, agencia_numero, numero, cliente_numero FROM conta_corrente;
SELECT banco_numero, agencia_numero, cliente_numero FROM cliente_transacoes;

SELECT * FROM information_schema.columns WHERE table_name = 'banco';
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'banco';


SELECT valor FROM cliente_transacoes;

SELECT AVG(valor) FROM cliente_transacoes;

SELECT COUNT(numero) FROM cliente;

SELECT COUNT(numero), email
FROM cliente
WHERE email ILIKE '%gmail.com'
GROUP BY email;


SELECT MAX(numero) FROM cliente;
SELECT MIN(numero) FROM cliente;
SELECT MAX(valor) FROM cliente_transacoes;
SELECT MIN(valor) FROM cliente_transacoes;


SELECT MAX(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;


SELECT MIN(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;

SELECT COUNT(id), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
HAVING COUNT(id) > 150;


SELECT SUM(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
ORDER BY tipo_transacao_id;