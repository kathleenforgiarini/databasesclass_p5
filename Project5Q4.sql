SPOOL C:\BD2\Project5Q4.txt
SELECT to_char(sysdate, 'DD Month YYYY HH:MI:SS') FROM dual;

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE p5question4 (num_employees IN NUMBER) AS
v_num NUMBER := num_employees;
BEGIN
  FOR cur_emp IN (SELECT ename, sal
                  FROM emp
                  ORDER BY sal DESC)
  LOOP
    DBMS_OUTPUT.PUT_LINE(cur_emp.ename || ' ' || cur_emp.sal);
    v_num := v_num - 1;
    IF v_num = 0 THEN
      EXIT;
    END IF;
  END LOOP;
END;
/
EXEC p5question4(2)
EXEC p5question4(3)
EXEC p5question4(4)
EXEC p5question4(5)

Spool off;