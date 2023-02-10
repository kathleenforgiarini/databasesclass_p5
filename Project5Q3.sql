SPOOL C:\BD2\Project5Q3.txt
SELECT to_char(sysdate, 'DD Month YYYY HH:MI:SS') FROM dual;


SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE p5question3 (in_perc NUMBER) AS
    CURSOR t_inv_price IS
        SELECT inv_price, inv_id
        FROM   inventory;
        old_price inventory.inv_price%TYPE;
        new_price NUMBER;
        v_inv_id inventory.inv_id%TYPE;
BEGIN
    OPEN t_inv_price;
    FETCH t_inv_price INTO old_price, v_inv_id;
    WHILE t_inv_price%FOUND LOOP
        new_price := old_price + old_price * in_perc/100;
        UPDATE inventory SET inv_price = new_price WHERE inv_id = v_inv_id;
        DBMS_OUTPUT.PUT_LINE('Old price: $' || old_price || '. New price: $' || new_price);
        FETCH t_inv_price INTO old_price, v_inv_id;
    END LOOP;
    CLOSE t_inv_price;
END;
/

exec p5question3(10);

Spool off;