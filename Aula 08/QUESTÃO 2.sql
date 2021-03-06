DECLARE

NOME_VENDEDOR VENDEDOR.NM_VDD%TYPE;
QUANTIDADE_VENDIDA FLOAT(5);
SOMA_PARCELAS PARCELA.VL_PAR%TYPE;

BEGIN

SELECT VDD.NM_VDD, SUM(QT_VEN) INTO NOME_VENDEDOR, QUANTIDADE_VENDIDA
FROM VENDEDOR VDD, VENDA V, ITEM_VENDA IV
WHERE V.CD_VEN = 3 
  AND V.CD_LOJ = 1
  AND V.CD_VEN = IV.CD_VEN
  AND VDD.CD_VDD = V.CD_VDD
  GROUP BY VDD.NM_VDD;

DBMS_OUTPUT.put_line('Nome do vendedor: ' || NOME_VENDEDOR || 
                    ' - Qtde. vendida: ' || QUANTIDADE_VENDIDA);

IF QUANTIDADE_VENDIDA > 3 THEN

SELECT SUM(VL_PAR) INTO SOMA_PARCELAS
FROM PARCELA P
WHERE P.CD_VEN = 3 AND P.CD_LOJ = 1;

DBMS_OUTPUT.put_line('Valor total R$: ' || SOMA_PARCELAS);

END IF;

END;