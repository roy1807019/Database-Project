CREATE OR REPLACE TRIGGER check_package_cost BEFORE INSERT OR UPDATE ON package 
FOR EACH ROW

DECLARE
c_min constant number(8,2) := 1000.0;
c_max constant number(8,2) := 500000.0;
BEGIN
IF :new.package_cost > c_max OR :new.package_cost < c_min THEN
RAISE_APPLICATION_ERROR(-20000,'New COST is too small or large');
END IF;
END;
/