SELECT numero, nome, ativo 
FROM banco 
ORDER BY numero;

UPDATE banco SET ativo = false WHERE numero = 0; 

BEGIN;
UPDATE banco SET ativo = true WHERE  numero = 0;
SELECT numero, nome, ativo FROM banco WHERE numero = 0;
ROLLBACK;


BEGIN;
SELECT numero, nome, ativo FROM banco WHERE numero = 0;
COMMIT;