-- b.sql
-- Jody Kirton
-- Option b: Inquire a customer


SET SERVEROUTPUT ON;
SET HEADING OFF;
SET VERIFY OFF;

ACCEPT p_name PROMPT "Enter a Customer Name: ";
DECLARE
  v_customer customer%ROWTYPE;
  BEGIN
    display_customer('&p_name', v_customer);
	    
    DBMS_OUTPUT.PUT_LINE('----------- Customer Information -----------' || CHR(10) ||
					'Name: ' || CHR(9) || CHR(9) || v_customer.cname || CHR(10) ||
					'Address: ' || CHR(9) || v_customer.cstreet || CHR(10) || 
					CHR(9) || CHR(9) || v_customer.ccity || ' ' || v_customer.cprov || CHR(10) ||
					CHR(9) || CHR(9) || v_customer.cpostal || CHR(10) ||
					'Phone: ' || CHR(9) || CHR(9) || v_customer.chphone || ' ' || v_customer.cbphone);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE( 'Customer name entered not found');
END;
/

EXIT;