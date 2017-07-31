-- triggers.sql
-- Jody Kirton
-- Triggers for Final Project


-- Customer table trigger to convert cname to  upper case when inserting or updating

CREATE OR REPLACE TRIGGER customer_insert_update_upper
BEFORE INSERT OR UPDATE OF cname ON customer
FOR EACH ROW
    WHEN(NEW.cname != UPPER(NEW.cname))
BEGIN
    :NEW.cname:=UPPER(:NEW.cname);
END;
/

-- Car table trigger to convert to upper case when inserting or updating

CREATE OR REPLACE TRIGGER car_before_insert_update_upper
BEFORE INSERT OR UPDATE OF serial, cname, make, model, color, purchinv ON car
FOR EACH ROW
    WHEN(NEW.serial != UPPER(NEW.serial)
      OR NEW.cname != UPPER(NEW.cname)
      OR NEW.make != UPPER(NEW.make) 
      OR NEW.model != UPPER(NEW.model) 
      OR NEW.color != UPPER(NEW.color)
      OR NEW.purchinv != UPPER(New.purchinv))
BEGIN
    :NEW.serial:=UPPER(:NEW.serial);
    :NEW.cname:=UPPER(:NEW.cname);
    :NEW.make:=UPPER(:NEW.make);
    :NEW.model:=UPPER(:NEW.model);
    :NEW.color:=UPPER(:NEW.color);
    :NEW.purchinv:=UPPER(:NEW.purchinv);
END;
/

-- Saleinv table trigger to convert cname, salesman, serial, tradeserial to upper case when inserting or updating

CREATE OR REPLACE TRIGGER saleinv_insert_update_upper
BEFORE INSERT OR UPDATE OF cname, salesman, serial, tradeserial ON saleinv
FOR EACH ROW
    WHEN(NEW.cname != UPPER(NEW.cname)
      OR NEW.salesman != UPPER(NEW.salesman)
      OR NEW.serial != UPPER(NEW.serial)
      OR NEW.tradeserial != UPPER(NEW.tradeserial))
BEGIN
    :NEW.cname:=UPPER(:NEW.cname);
    :NEW.salesman:=UPPER(:NEW.salesman);
    :NEW.serial:=UPPER(:NEW.serial);
    :NEW.tradeserial:=UPPER(:NEW.tradeserial);
END;
/