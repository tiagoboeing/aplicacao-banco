DECLARE
  CURSOR CINQ IS
    SELECT * FROM INQUILINO;
    CURSOR CCON(PINQ NUMBER)IS
      SELECT COUNT(*) AS CONTRATOS FROM CONTRATOS WHERE CD_INQ = PINQ;
      
BEGIN
  FOR RINQ IN CINQ LOOP
    FOR RCON IN CCON(RINQ.CD_INQ)LOOP
      IF RCON.CONTRATOS < 1 THEN
        DBMS_OUTPUT.PUT_LINE('INQUILINO: ' || RINQ.NM_INQ);
      ENDIF;
    ENDLOOP;
  END LOOP;
END;