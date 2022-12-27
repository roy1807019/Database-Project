set SERVEROUTPUT on

DECLARE
author_id authors.id%type;

BEGIN
select max(id) into author_id from authors;
dbms_output.put_line('author id '|| author_id);

end;
/


set SERVEROUTPUT on

DECLARE
bdate inventory.status_date%type;
bname books.title%type:='Oracle DBA 101';
id books.isbn%type;

BEGIN
select status_date into bdate
from books natural join inventory

where books.isbn=inventory.isbn and books.title=bname;

dbms_output.put_line(bdate);

end;
/

set SERVEROUTPUT on
DECLARE
fname authors.first_name%type;
ct number(2):=1;

BEGIN
loop 
exit when ct>5;
select first_name into fname from authors where id=ct;
dbms_output.put_line(fname);
ct:=ct+1;
end loop;
end;
/

set SERVEROUTPUT on
DECLARE
CURSOR my_cur is SELECT title,price from books;
tmp_cur my_cur%rowtype;

BEGIN
open my_cur;
loop
FETCH my_cur into tmp_cur;
exit when my_cur%ROWCOUNT>5;
dbms_output.put_line(tmp_cur.title ||' ' || tmp_cur.price);
end loop;
close my_cur;
end;
/

set SERVEROUTPUT on
create or replace function f return number is
avg_salary employees.salary%type;

BEGIN
select max(salary) into avg_salary from employees;
return avg_salary;
end;
/

set SERVEROUTPUT on
BEGIN
dbms_output.put_line(f);
end;
/

set SERVEROUTPUT on
create or replace FUNCTION f
(
    sal  employees.salary%type,
    com  employees.commission_pct%type
)return number is

BEGIN
return (NVL(sal,0)+NVL(sal,0)*NVL(com,0));
end;
/

set SERVEROUTPUT on
declare 
id1 employees.employee_id%type;
id2 employees.last_name%type;
id3 number(19);
BEGIN
SELECT employee_id, last_name ,
f(salary,commission_pct) 
into id1,id2,id3
FROM employees
WHERE department_id=90;
end;
/

set SERVEROUTPUT on
create or replace trigger check_salary before insert or update on employees
for each row

BEGIN
if :new.salary not in (1000,2000,3000) or :new.salary<100 then
raise_application_error(-150000,'error');
end if;
end;
/

 insert into test2 values (7,'bbb');