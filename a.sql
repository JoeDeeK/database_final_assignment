-- a.sql
-- Jody Kirton
-- Option a: Create a new customer


SET SERVEROUTPUT ON;
SET HEADING OFF;
SET VERIFY OFF;

ACCEPT p_cname PROMPT "Enter Customer Name: ";
ACCEPT p_cstreet PROMPT "Enter Street: ";
ACCEPT p_ccity PROMPT "Enter City: ";
ACCEPT p_cprov PROMPT "Enter Province: ";
ACCEPT p_cpostal PROMPT "Enter Postal: "; 
ACCEPT p_chphone PROMPT "Enter Home Phone Number: ";
ACCEPT p_cbphone PROMPT "Enter Business Phone Number: ";

BEGIN
	enter_new_customer('&p_cname', '&p_cstreet', '&p_ccity', '&p_cprov', '&p_cpostal', '&p_chphone', '&p_cbphone');
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('New Customer has been added to the customer table');	
END;
/

EXIT;