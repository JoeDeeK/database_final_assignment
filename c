-- c.sql
-- Jody Kirton
-- Option c: Create a new vehicle inventory record


SET SERVEROUTPUT ON;
SET HEADING OFF;
SET VERIFY OFF;

ACCEPT p_serial PROMPT "Enter Car Serial Number: ";
ACCEPT p_cname PROMPT "Enter Customer Name: ";
ACCEPT p_make PROMPT "Enter Car Make: ";
ACCEPT p_model PROMPT "Enter Car Model: ";
ACCEPT p_cyear PROMPT "Enter Car Year: ";
ACCEPT p_color PROMPT "Enter Car Color: ";
ACCEPT p_trim PROMPT "Enter Car Trim: ";
ACCEPT p_enginetype PROMPT "Enter Car Engine Type: ";
ACCEPT p_purchinv PROMPT "Enter Purchase Invoice Number: ";
ACCEPT p_purchdate PROMPT "Enter Purchase Date: "; 
ACCEPT p_purchfrom PROMPT "Who was the vehicle purchased from? Enter seller: ";
ACCEPT p_purchcost PROMPT "Enter Purchase Cost: "; 
ACCEPT p_freightcost PROMPT "Enter Freight Cost: ";
ACCEPT p_totalcost PROMPT "Enter Total Cost of vehicle: ";
ACCEPT p_listprice PROMPT "Enter vehicle list price: ";

BEGIN
	enter_new_car('&p_serial', '&p_cname', '&p_make', '&p_model', '&p_cyear', '&p_color', '&p_trim', '&p_enginetype', '&p_purchinv', '&p_purchdate', '&p_purchfrom', '&p_purchcost', '&p_freightcost', '&p_totalcost', '&p_listprice');
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('New Vehicle successfully added into Inventory');
END;
/

EXIT;
