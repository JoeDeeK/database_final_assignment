-- e.sql
-- Jody Kirton
-- Option e: Create a new sales invoice


SET SERVEROUTPUT ON;
SET HEADING OFF;
SET VERIFY OFF;

ACCEPT p_cname PROMPT "Enter Customer Name: "; 
ACCEPT p_salesman PROMPT "Enter Salesman Name: "; 
ACCEPT p_saledate PROMPT "Enter Sales Date: "; 
ACCEPT p_serial PROMPT "Enter Car Serial Number: "; 
ACCEPT p_totalprice PROMPT "Enter Total Price: "; 
ACCEPT p_discount PROMPT "Enter discount: "; 
ACCEPT p_net PROMPT "Enter Net: "; 
ACCEPT p_tax PROMPT "Enter Tax: "; 
ACCEPT p_licfee PROMPT "Enter License Fee: ";
ACCEPT p_commission PROMPT "Enter Commission: "; 
ACCEPT p_tradeserial PROMPT "Enter Trade Serial: "; 
ACCEPT p_tradeallow PROMPT "Enter Trade in Allowance: "; 
ACCEPT p_fire PROMPT "Enter Y for yes, or N for no. Does the vehicle have fire insurance? "; 
ACCEPT p_collision PROMPT "Enter Y for yes, or N for no. Does the vehicle have collision insurance? "; 
ACCEPT p_liability PROMPT "Enter Y for yes, or N for no. Does the vehicle have liability insurance? "; 
ACCEPT p_property PROMPT "Enter Y for yes, or N for no. Does the vehicle have property insurance? "; 

BEGIN

	enter_new_sale('&p_cname', '&p_salesman', '&p_saledate', '&p_serial', '&p_totalprice', '&p_discount', '&p_net', '&p_tax', '&p_licfee', '&p_commission', '&p_tradeserial', '&p_tradeallow', '&p_fire', '&p_collision', '&p_liability', '&p_property');
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('New Sales Record successfully added to Sales Invoice');
	
END;
/

EXIT;
