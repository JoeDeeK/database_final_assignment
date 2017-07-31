-- d.sql
-- Jody Kirton
-- Option d: Inquire a vehicle inventory record


SET SERVEROUTPUT ON;
SET HEADING OFF;
SET VERIFY OFF;

ACCEPT p_serial PROMPT "Enter Car Serial Number: ";
DECLARE 
	v_vehicle car%ROWTYPE;
	v_recoptions SYS_REFCURSOR;
	v_ocode options.ocode%TYPE;
	v_odesc options.odesc%TYPE;
	v_olist options.olist%TYPE;
BEGIN
	display_vehicle('&p_serial', v_vehicle, v_recoptions);
	DBMS_OUTPUT.PUT_LINE(CHR(9)||CHR(9)||'--Vehicle Inventory Record--'||CHR(10)||CHR(10)||
			'Serial Number | Make    |  Model   | Year | Exterior Color | Trim'||CHR(10)||
			v_vehicle.serial||CHR(9)||'     '||v_vehicle.make||' '||v_vehicle.model||'   '||
			v_vehicle.cyear||'  '|| v_vehicle.color||'     '||v_vehicle.trim||CHR(10)||CHR(10)||
            CHR(9)||'Optional Equipment and Accessories - Factory'||CHR(10)||CHR(10)||
			'Code'||' | '||'Description          '||CHR(9)||CHR(9)||CHR(9)||CHR(9)||'    | List Price');
	LOOP 
		FETCH v_recoptions
		INTO  v_ocode, v_odesc, v_olist;
		EXIT WHEN v_recoptions%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(v_ocode || '   ' || v_odesc || '    ' || v_olist);
	END LOOP;
	CLOSE v_recoptions;

	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE( 'Incorrect car serial number, no data found');
		WHEN VALUE_ERROR THEN
			DBMS_OUTPUT.PUT_LINE( 'Car serial number is too large or type incorrect.  Please re-enter a new car serial number no more than 8 characters.');
END;
/

EXIT;