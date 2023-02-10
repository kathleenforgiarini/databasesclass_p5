SPOOL C:\BD2\Project5Q5.txt
SELECT to_char(sysdate, 'DD Month YYYY HH:MI:SS') FROM dual;

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE p5question5 (p_num_sal IN NUMBER) AS
  top_salary NUMBER;
  cursor top_salaries is
    select sal
    from emp
    order by sal desc;
  l_salary emp.sal%type;
  l_count number := 0;
BEGIN
  open top_salaries;
  loop
    fetch top_salaries into l_salary;
    exit when top_salaries%notfound;
    l_count := l_count + 1;
    if l_count = p_num_sal then
      top_salary := l_salary;
      exit;
    end if;
  end loop;
  close top_salaries;

  DBMS_OUTPUT.PUT_LINE('Employees who make the top ' || p_num_sal || ' salary are:');
  FOR cur_emp IN (SELECT ename, sal
                  FROM emp
                  WHERE sal >= top_salary)
  LOOP
    DBMS_OUTPUT.PUT_LINE(cur_emp.ename || ' ' || cur_emp.sal);
  END LOOP;
END;
/

exec p5question5(2);


Spool off;