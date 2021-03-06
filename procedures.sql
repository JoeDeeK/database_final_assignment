-- procedures.sql
-- Jody Kirton
-- Procedures for each option



-- Option a: Create a new customer

CREATE OR REPLACE PROCEDURE enter_new_customer
    (
		v_cname IN customer.cname%TYPE,
		v_cstreet IN customer.cstreet%TYPE,
		v_ccity IN customer.ccity%TYPE,
		v_cprov IN customer.cprov%TYPE,
		v_cpostal IN customer.cpostal%TYPE,
		v_chphone IN customer.chphone%TYPE,
		v_cbphone IN customer.cbphone%TYPE
    )
AS
BEGIN
    INSERT INTO customer (cname, cstreet, ccity, cprov, cpostal, chphone, cbphone)
	VALUES (v_cname, v_cstreet, v_ccity, v_cprov, v_cpostal, v_chphone, v_cbphone);
END; 
/

--Options b: Inquire a customer

CREATE OR REPLACE PROCEDURE display_customer
	(
		pl_name IN customer.cname%TYPE,
		pl_customer OUT customer%ROWTYPE
	)
AS
BEGIN
	SELECT * 
	INTO pl_customer
	FROM customer
	WHERE UPPER(cname) = UPPER(pl_name);
END;
/


--Option c: Create a new vehicle inventory record

CREATE OR REPLACE PROCEDURE enter_new_car
	(
		v_serial IN car.serial%TYPE,
		v_cname IN car.cname%TYPE,
		v_make IN car.make%TYPE,
		v_model IN car.model%TYPE,
		v_cyear IN car.cyear%TYPE,
		v_color IN car.color%TYPE,
		v_trim IN car.trim%TYPE,
		v_enginetype IN car.enginetype%TYPE,
		v_purchinv IN car.purchinv%TYPE,
		v_purchdate IN car.purchdate%TYPE,
		v_purchfrom IN car.purchfrom%TYPE,
		v_purchcost IN car.purchcost%TYPE,
		v_freightcost IN car.freightcost%TYPE,
		v_totalcost IN car.totalcost%TYPE,
		v_listprice IN car.listprice%TYPE
	)
AS
BEGIN
	INSERT INTO car (serial, cname, make, model, cyear, color, trim, enginetype, purchinv, purchdate, purchfrom, purchcost, freightcost, totalcost, listprice)
	VALUES (v_serial, v_cname, v_make, v_model, v_cyear, v_color, v_trim, v_enginetype, v_purchinv, v_purchdate, v_purchfrom, v_purchcost, v_freightcost, v_totalcost, v_listprice);
END;
/

--Option d: Inquire a vehicle inventory record

CREATE OR REPLACE PROCEDURE display_vehicle
	(
		v_serial IN car.serial%TYPE,
		v_vehicle OUT car%ROWTYPE,
		v_recoptions OUT SYS_REFCURSOR
	)
AS
BEGIN 
	SELECT * 
	INTO v_vehicle
	FROM car
	WHERE serial = v_serial;

	OPEN v_recoptions FOR
	SELECT options.ocode, options.odesc, options.olist
	FROM options
	JOIN baseoption ON baseoption.ocode = options.ocode 
	WHERE serial = v_serial
	ORDER BY options.ocode;
END;
/


--Option e: Create a new sales invoice

CREATE OR REPLACE PROCEDURE	enter_new_sale
	(
		v_cname IN saleinv.cname%TYPE,
		v_salesman IN saleinv.salesman%TYPE,
		v_saledate IN saleinv.saledate%TYPE,
		v_serial IN saleinv.serial%TYPE,
		v_totalprice IN saleinv.totalprice%TYPE,
		v_discount IN saleinv.discount%TYPE,
		v_net IN saleinv.net%TYPE,
		v_tax IN saleinv.tax%TYPE,
		v_licfee IN saleinv.licfee%TYPE,
		v_commission IN saleinv.commission%TYPE,
		v_tradeserial IN saleinv.tradeserial%TYPE,
		v_tradeallow IN saleinv.tradeallow%TYPE,
		v_fire IN saleinv.fire%TYPE,
		v_collision IN saleinv.collision%TYPE,
		v_liability IN saleinv.liability%TYPE,
		v_property IN saleinv.property%TYPE
	)
AS
BEGIN
	INSERT INTO saleinv (saleinv, cname, salesman, saledate, serial, totalprice, discount, net, tax, licfee, commission, tradeserial, tradeallow, fire, collision, liability, property)
	VALUES('I' || TO_CHAR(saleinv_seq.NEXTVAL, 'FM00000'), v_cname, v_salesman, v_saledate, v_serial, v_totalprice, v_discount, v_net, v_tax, v_licfee, v_commission, v_tradeserial, v_tradeallow, v_fire, v_collision, v_liability, v_property);
END;
/


--Option f: Inquire a sales invoice

CREATE OR REPLACE PROCEDURE display_saleinv
	(
		v_saleinv IN saleinv.saleinv%TYPE,
		v_saleinvrow OUT saleinv%ROWTYPE,
		v_car OUT car%ROWTYPE,
		v_customer OUT customer%ROWTYPE,
		v_tradein OUT car%ROWTYPE,
		v_curoptions OUT SYS_REFCURSOR,
		v_serial OUT car.serial%TYPE
	)
AS
BEGIN 
	--Fill saleinvrow
	SELECT *
	INTO v_saleinvrow
	FROM saleinv
	WHERE UPPER(saleinv) = UPPER(v_saleinv);
	
	--Fill car row with new car info
	SELECT car.serial, car.cname, car.make, car.model, car.cyear, car.color, car.trim, car.enginetype, car.purchinv, car.purchdate, car.purchfrom, car.purchcost, car.freightcost, car.totalcost, car.listprice
	INTO v_car
	FROM car, saleinv
	WHERE UPPER(car.serial) = UPPER(saleinv.serial)
	AND UPPER(saleinv.saleinv) = UPPER(v_saleinv);
	
	--Fill customer row
	SELECT customer.cname, cstreet, ccity, cprov, cpostal, chphone, cbphone
	INTO v_customer
	FROM customer, saleinv
	WHERE customer.cname = saleinv.cname
	AND UPPER(saleinv.saleinv) = UPPER(v_saleinv);
	
	--Fill tradein car row
	SELECT car.serial, car.cname, car.make, car.model, car.cyear, car.color, car.trim, car.enginetype, car.purchinv, car.purchdate, car.purchfrom, car.purchcost, car.freightcost, car.totalcost, car.listprice
	INTO v_tradein
	FROM car, saleinv
	WHERE UPPER(car.serial) = UPPER(saleinv.tradeserial)
	AND UPPER(saleinv.saleinv) = UPPER(v_saleinv);
	
	--Fill v_serial with tradeserial serial #
	SELECT tradeserial
	INTO v_serial
	FROM saleinv
	WHERE UPPER(v_saleinv) = UPPER(saleinv.saleinv);
	
	--Fill cursor with options
	OPEN v_curoptions FOR
    SELECT options.ocode, options.odesc, options.olist
    FROM options JOIN baseoption 
    ON baseoption.ocode = options.ocode 
    WHERE UPPER(serial) = UPPER(v_serial)
    ORDER BY options.ocode;
END;
/