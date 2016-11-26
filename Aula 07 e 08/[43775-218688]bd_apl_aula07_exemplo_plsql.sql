 DECLARE
 WSAL_TOTAL NUMBER(12,2);
  WNR_VEN NUMBER(5);
 BEGIN
   DBMS_OUTPUT.PUT_LINE('MEU PRIMEIRO PROGRAMA');
    DECLARE
    WNM_VDD VENDEDOR.NM_VDD%TYPE;
   WVL_SAL VENDEDOR.VL_SAL%TYPE;
	BEGIN
       SELECT NM_VDD,VL_SAL, COUNT(*) 
	       INTO WNM_VDD,WVL_SAL, WNR_VEN 
       FROM VENDEDOR VDD, VENDA V 
	   WHERE V.CD_VDD = VDD.CD_VDD AND V.CD_VDD=1
	   GROUP BY NM_VDD,VL_SAL;
       DBMS_OUTPUT.PUT('VENDEDOR= '||WNM_VDD||
	  								  ' SALARIO= '||WVL_SAL||
									  'NRO VENDAS= '||WNR_VEN);
    EXCEPTION
	  WHEN NO_DATA_FOUND THEN
	    DBMS_OUTPUT.PUT_LINE('VENDEDOR INEXISTENTE');
	END;
   SELECT SUM(VL_SAL) INTO WSAL_TOTAL FROM VENDEDOR; 
   DBMS_OUTPUT.PUT_LINE(' SOMA SALARIAL= '||WSAL_TOTAL);
 EXCEPTION
 WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE('ERRO INESPERADO... CONTATE O ADM');
 END;
 