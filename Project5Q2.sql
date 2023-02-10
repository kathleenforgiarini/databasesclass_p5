SPOOL C:\BD2\Project5Q2.txt
SELECT to_char(sysdate, 'DD Month YYYY HH:MI:SS') FROM dual;

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE p5question2 AS
    CURSOR t_inv_it IS
        SELECT i.item_desc, iv.inv_price, iv.color, iv.inv_qoh
        FROM   inventory iv, item i
        WHERE i.item_id = iv.item_id;
        i_desc item.item_desc%TYPE;
        iv_price inventory.inv_price%TYPE;
        iv_color inventory.color%TYPE;
        iv_qoh inventory.inv_qoh%TYPE;
BEGIN
    OPEN t_inv_it;
    FETCH t_inv_it INTO i_desc, iv_price, iv_color, iv_qoh;
    WHILE t_inv_it%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE('Item: ' || i_desc || '. Price: $' || iv_price || '. Color: ' || iv_color || '. Quantity on hand: ' || iv_qoh);
        FETCH t_inv_it INTO i_desc, iv_price, iv_color, iv_qoh;
    END LOOP;
    CLOSE t_inv_it;
END;
/

exec p5question2;

Spool off;