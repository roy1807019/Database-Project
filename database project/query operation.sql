--select query
SELECT * FROM guardian;
SELECT * FROM nanny;
SELECT * FROM child;
SELECT * FROM package;
SELECT * FROM transactions;

--ALTER QUERY
--ADD COLUMN
ALTER TABLE guardian
ADD temporary_column VARCHAR(20);
DESCRIBE guardian;

--DROP COLUMN
ALTER TABLE guardian
DROP COLUMN temporary_column;
DESCRIBE guardian;

--MODIFY COLUMN
ALTER TABLE package 
MODIFY package_cost VARCHAR(20);
DESCRIBE package;    --if the column has already inserted data then it is not possible to modify the column

--RENAME COLUMN
ALTER TABLE package
RENAME COLUMN package_cost TO cost;
DESCRIBE package;    

--UPDATE OPERATION
UPDATE guardian 
SET user_address='Nilphamari'
WHERE guardian_id=1;
SELECT * FROM guardian;

--DELETE A ROW
DELETE FROM guardian
WHERE guardian_id=1;
SELECT * FROM guardian;

--CALCULATE FIELD
SELECT (salary/2) AS half_salary FROM nanny;

--APPLYING CONDITIONS
SELECT salary 
FROM nanny
WHERE nanny_id=101;

--RANGE SEARCH
SELECT nanny_id,nanny_fname,salary 
FROM nanny
WHERE  nanny_id BETWEEN 101 AND 102;

SELECT nanny_id,nanny_fname,salary
FROM nanny
WHERE nanny_id>=101 AND nanny_id<=102;

SELECT nanny_id,nanny_fname,salary
FROM nanny
WHERE nanny_id>=101 OR nanny_id<=100;

--SET MEMBERSHIP
SELECT nanny_id,nanny_fname,salary
FROM nanny
WHERE nanny_id IN (101,102,104);

SELECT nanny_id,nanny_fname,salary
FROM nanny
WHERE nanny_id NOT IN (101,102,104);

--ORDER BY OPERATION
SELECT nanny_id,nanny_fname,salary
FROM nanny
ORDER BY nanny_id DESC;

SELECT nanny_id,nanny_fname,salary
FROM nanny
ORDER BY nanny_id DESC,salary;

--DISTINCT OPERATION
SELECT DISTINCT (salary) FROM nanny;

--SEARCH STRING OPERATION
SELECT nanny_id,nanny_fname,salary
FROM nanny
WHERE nanny_fname LIKE '%ma';


--AGGREGATE FUNCTION
SELECT MAX(salary) FROM nanny;

SELECT MIN(salary) FROM nanny;

SELECT SUM(salary) FROM nanny;

SELECT COUNT(nanny_id) FROM nanny;

SELECT COUNT(*) FROM nanny;

SELECT COUNT(DISTINCT(salary)) FROM nanny;

SELECT AVG(salary) FROM nanny;

SELECT AVG(NVL(nanny_id,0)) FROM nanny;


--GROUP BY CLAUSE
SELECT nanny_lname, COUNT(nanny_id)
FROM nanny
GROUP BY nanny_lname;

SELECT nanny_lname,COUNT(nanny_id)
FROM nanny
WHERE salary>20000
GROUP BY nanny_lname

--HAVING CLAUSE
SELECT nanny_lname, COUNT(nanny_id)
FROM nanny
GROUP BY nanny_lname
HAVING COUNT(salary)>1;


--NESTED QUERY
SELECT  MAX(salary)
FROM nanny
WHERE salary NOT IN (
    SELECT MAX(SALARY)
    FROM nanny
);

--UNION
SELECT nanny_id,nanny_fname
FROM nanny
WHERE nanny_lname='roy'
UNION
SELECT nanny_id,nanny_fname
FROM nanny
WHERE nanny_lname='hasan';

--INTERSECTION
SELECT nanny_id,nanny_fname,salary
FROM nanny
WHERE nanny_lname='roy'
INTERSECT 
SELECT nanny_id,nanny_fname,salary
FROM nanny
WHERE salary=30000;

--MINUS
SELECT nanny_id,nanny_fname,salary
FROM nanny
WHERE nanny_lname='roy'
MINUS
SELECT nanny_id,nanny_fname,salary
FROM nanny
WHERE salary=30000;


--JOIN
SELECT C.child_fname,F.guardian_fname
FROM guardian F JOIN child C
ON F.guardian_id=C.guardian_id;

--NATURAL JOIN
SELECT child_fname,guardian_fname
FROM guardian NATURAL JOIN child;

SELECT child_fname,transactions_date
FROM child NATURAL JOIN transactions;

--INNER JOIN
SELECT C.child_fname,F.guardian_fname
FROM guardian F INNER JOIN child C
ON F.guardian_id=C.guardian_id;

SELECT p.package_id,p.package_cost,n.nanny_fname,n.salary
from package p INNER JOIN nanny n 
ON p.nanny_id=n.nanny_id;

--CROSS JOIN
SELECT child_fname,guardian_fname
FROM guardian CROSS JOIN child;

--LEFT OUTER JOIN
SELECT C.child_fname,F.guardian_fname,F.user_address
FROM guardian F LEFT OUTER JOIN child C
ON F.guardian_id=C.guardian_id;

--RIGHT OUTER JOIN
SELECT C.child_fname,F.guardian_fname,F.user_address
FROM guardian F RIGHT OUTER JOIN child C
ON F.guardian_id=C.guardian_id;


--FULL OUTER JOIN
SELECT C.child_fname,F.guardian_fname,F.user_address
FROM guardian F FULL OUTER JOIN child C
ON F.guardian_id=C.guardian_id;

--SELF JOIN (min salary)
SELECT P.salary
FROM nanny P 
MINUS
select q.salary
from nanny p join nanny q 
on p.salary<q.salary;   --  for p.salary> q.salary it will output highest salary


--PL/SQL BLOCK
--CURSOR
SET SERVEROUTPUT ON
DECLARE
CURSOR var_cur IS SELECT nanny_id,salary FROM nanny;
var_salary var_cur%ROWTYPE;

BEGIN
OPEN var_cur;
LOOP
FETCH var_cur INTO var_salary;
EXIT WHEN var_cur%ROWCOUNT>4; --VAR_CUR%NOTFOUND ALL DATA WILL BE PRINTED
DBMS_OUTPUT.PUT_LINE('ID : ' || var_salary.nanny_id || ' ' || 'SALARY :' || var_salary.salary);
END LOOP;
CLOSE var_cur;
END;
/

--FUNCTION IN PL/SQL
CREATE OR REPLACE FUNCTION avg_salary  RETURN NUMBER IS
avg_sal nanny.salary%TYPE;

BEGIN
SELECT AVG(salary) INTO avg_sal
FROM nanny;
RETURN avg_sal;
END;
/

SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE('Average salary : '|| avg_salary);
END;
/

--PROCEDURE IN PL/SQL
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE babysitter IS
babysitter_id nanny.nanny_id%TYPE;
babysitter_lname nanny.nanny_lname%TYPE;

BEGIN
babysitter_id :=104;
SELECT nanny_lname INTO babysitter_lname
FROM nanny
WHERE babysitter_id=nanny_id;
DBMS_OUTPUT.PUT_LINE('Last name : '|| babysitter_lname);
END;
/
--to call a procedure
BEGIN
babysitter;
END;
/

--Transection
CREATE TABLE dummy_table(
    roll NUMBER(20),
    val NUMBER(20)
);
insert into dummy_table values (1807050,22);

insert into dummy_table values (1807056,23);

commit;

insert into dummy_table values (1807060,24);

SAVEPOINT x_save;

insert into dummy_table values (1807053,25);

insert into dummy_table values (1807054,26);

SAVEPOINT y_save;

insert into dummy_table values (1807055,27);

select * from dummy_table;

rollback to y_save;

select * from dummy_table;

rollback to x_save;

select * from dummy_table;


--view create

CREATE VIEW dummy_packag AS
SELECT package_cost from package;
select * from dummy_packag;


