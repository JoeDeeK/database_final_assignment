-- f.sql
-- Jody Kirton
-- Option f: Inquire a sales invoice


SET SERVEROUTPUT ON;
SET HEADING OFF;
SET VERIFY OFF;

ACCEPT p_saleinv PROMPT "Enter Sales Invoice Number: ";
DECLARE 
    v_saleinvrow saleinv%ROWTYPE;
    v_customer customer%ROWTYPE;
    v_car car%ROWTYPE;
    v_tradein car%ROWTYPE;
	v_curoptions SYS_REFCURSOR;
    v_serial car.serial%TYPE;
    
    v_ocode options.ocode%TYPE;
	v_odesc options.odesc%TYPE;
	v_olist options.olist%TYPE;
BEGIN

	display_saleinv('&p_saleinv', v_saleinvrow, v_car, v_customer, v_tradein, v_curoptions, v_serial);
	
	DBMS_OUTPUT.PUT_LINE('------ SPECIALITY IMPORTS - SALES INVOICE ------' || CHR(10) || CHR(10) ||
                        'InvoiceNo ' || v_saleinvrow.saleinv || CHR(9) || 'Date: ' || v_saleinvrow.saledate || CHR(10) ||
                        'SOLD TO: Name: ' || v_customer.cname || CHR(10) || 
                        CHR(9) || 'Address: ' || v_customer.cstreet || CHR(10) ||
                        CHR(9) || 'City: ' || v_customer.ccity || CHR(10) ||
                        CHR(9) || 'State: ' || v_customer.cprov || CHR(9) || 'Postal Code: ' || v_customer.cpostal || CHR(10) ||
                        CHR(9) || 'Telephone: ' || v_customer.chphone || CHR(10) ||
                        'Salesman: ' || v_saleinvrow.salesman || CHR(10) || CHR(10) ||
                        'Serial Number |   Make   |   Model   | Year |  Color ' || CHR(10) ||
                        v_car.serial || CHR(9) || CHR(9) || v_car.make || CHR(9) || v_car.model || CHR(9) || v_car.cyear || CHR(9) || v_car.color || CHR(10) || CHR(10) ||
                        '------ Insurance Coverage Includes ------' || CHR(10) || CHR(10) ||
                        'Fire and Theft [' || v_saleinvrow.fire || ']' || CHR(9) || CHR(9) || 'Liability [' || v_saleinvrow.liability || ']' || CHR(10) ||
                        'Collision    [' || v_saleinvrow.collision || ']' || CHR(9) || 'PropertyDamage [' || v_saleinvrow.property || ']' || CHR(10) || CHR(10) ||
                        '------ OPTIONS ------' || CHR(10));
	LOOP 
		FETCH v_curoptions
		INTO  v_ocode, v_odesc, v_olist;
		EXIT WHEN v_curoptions%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(v_ocode || '   ' || v_odesc || '    ' || v_olist);
	END LOOP;
	CLOSE v_curoptions;	
  
	DBMS_OUTPUT.PUT_LINE(CHR(10)||CHR(10)||'------ TRADE-IN ------'||CHR(10)||CHR(10)||
                       'SerialNo. |  Make  |  Model  |  Year  |  Allowance' || CHR(10) ||
                       v_tradein.serial||CHR(9)||v_tradein.make||CHR(9)||v_tradein.model||CHR(9)||v_tradein.cyear||CHR(9)||v_saleinvrow.tradeallow||CHR(10)||CHR(10)||
                       'Total Price: ' || v_saleinvrow.totalprice || CHR(10) ||
                       'Trade-In Allowance: ' || v_saleinvrow.tradeallow || CHR(10) ||
                       'Discount: ' || v_saleinvrow.discount || CHR(10) ||
                       'Net: ' || v_saleinvrow.net || CHR(10) ||
                       'Taxes: ' || v_saleinvrow.tax || CHR(10) );
	
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE( 'Null values were returned, please try a different sales invoice number');
		WHEN TOO_MANY_ROWS THEN
			DBMS_OUTPUT.PUT_LINE( 'Too many rows inserted, pleasse try a different sales invoice number');
		WHEN VALUE_ERROR THEN
			DBMS_OUTPUT.PUT_LINE( 'Invoice number is too large, or type incorrect.  Please re-enter a new sales invoice number no more than 6 characters.');
END;
/


EXIT;
