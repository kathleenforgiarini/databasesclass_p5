SPOOL C:\BD2\Project5Q1.txt
SELECT to_char(sysdate, 'DD Month YYYY HH:MI:SS') FROM dual;

--select * from term;
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE p5question1 AS
    CURSOR t_term IS
      SELECT term_id, term_desc, status
      FROM term;
      v_termid term.term_id%TYPE;
      v_termdesc term.term_desc%TYPE;
      v_status term.status%TYPE;
BEGIN
    OPEN t_term;
    
  FETCH t_term INTO v_termid, v_termdesc, v_status;
  WHILE t_term%FOUND LOOP
  DBMS_OUTPUT.PUT_LINE(v_status || ' - ' || v_termdesc || ' - ' || v_termid);
  
  FETCH t_term INTO v_termid, v_termdesc, v_status;
  END LOOP;
  CLOSE t_term;
END;
/

exec p5question1;

Spool off;