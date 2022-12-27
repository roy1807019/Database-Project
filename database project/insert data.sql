insert into guardian (guardian_id,guardian_fname,guardian_lname,user_address,phone)values(1,'anup','roy','khulna',01884567631);
insert into guardian (guardian_id,guardian_fname,guardian_lname,user_address,phone)values(2,'bikash','das','barishal',01665984735);
insert into guardian (guardian_id,guardian_fname,guardian_lname,user_address,phone)values(3,'rafsan','hasan','jessore',01784689345);
insert into guardian (guardian_id,guardian_fname,guardian_lname,user_address,phone)values(4,'Sankar','roy','khulna',01894567631);
insert into guardian (guardian_id,guardian_fname,guardian_lname,user_address,phone)values(5,'subal','roy','panchagarah',01784567631);
insert into guardian (guardian_id,guardian_fname,guardian_lname,user_address,phone)values(6,'sabbir','hossain','khulna',01894567631);
insert into guardian (guardian_id,guardian_fname,guardian_lname,user_address,phone)values(7,'saurav','dev','jessore',01884767631);
insert into guardian (guardian_id,guardian_fname,guardian_lname,user_address,phone)values(8,'asu','bose','feni',01884597631);
insert into guardian (guardian_id,guardian_fname,guardian_lname,user_address,phone)values(9,'nafi','alom','rangpur',01804567631);
insert into guardian (guardian_id,guardian_fname,guardian_lname,user_address,phone)values(10,'badhan','debnath','magura',01684567631);



insert into nanny (nanny_id,nanny_fname,nanny_lname,salary,phone)values(101,'shika','roy',20000,0138547553);
insert into nanny (nanny_id,nanny_fname,nanny_lname,salary,phone)values(102,'fatima','hasan',30000,0174658569);
insert into nanny (nanny_id,nanny_fname,nanny_lname,salary,phone)values(103,'jahara','rahman',10000,0184783789);
insert into nanny (nanny_id,nanny_fname,nanny_lname,salary,phone)values(104,'teresa','gomez',20000,01784576946);
insert into nanny (nanny_id,nanny_fname,nanny_lname,salary,phone)values(105,'happy','hasan',28000,01794576946);
insert into nanny (nanny_id,nanny_fname,nanny_lname,salary,phone)values(106,'moumita','roy',30000,0138647553);
insert into nanny (nanny_id,nanny_fname,nanny_lname,salary,phone)values(107,'nishat','moni',22000,0139547553);
insert into nanny (nanny_id,nanny_fname,nanny_lname,salary,phone)values(108,'upoma','roy',26000,0168547553);
insert into nanny (nanny_id,nanny_fname,nanny_lname,salary,phone)values(109,'sushmita','bose',20000,0188547553);
insert into nanny (nanny_id,nanny_fname,nanny_lname,salary,phone)values(110,'mishu','hasan',27000,0178547553);

insert into child (child_id,child_fname,child_lname,age,guardian_id)values(201,'raton','roy',4,1);
insert into child (child_id,child_fname,child_lname,age,guardian_id)values(202,'jami','hasan',5,3);
insert into child (child_id,child_fname,child_lname,age,guardian_id)values(203,'rakib','hasan',6,3);
insert into child (child_id,child_fname,child_lname,age,guardian_id)values(204,'rabbi','rahman',7,5);
insert into child (child_id,child_fname,child_lname,age,guardian_id)values(205,'sagor','roy',3,7);
insert into child (child_id,child_fname,child_lname,age,guardian_id)values(206,'alamin','haque',8,10);
insert into child (child_id,child_fname,child_lname,age,guardian_id)values(207,'antor','roy',4,6);
insert into child (child_id,child_fname,child_lname,age,guardian_id)values(208,'dibyo','roy',6,2);
insert into child (child_id,child_fname,child_lname,age,guardian_id)values(209,'shorif','talukdar',4,4);
insert into child (child_id,child_fname,child_lname,age,guardian_id)values(210,'bilas','chandra',5,2);
insert into child (child_id,child_fname,child_lname,age,guardian_id)values(211,'sampad','dey',4,2);
insert into child (child_id,child_fname,child_lname,age,guardian_id)values(212,'otin','pal',9,7);

insert into package(package_id,nanny_id,package_cost)values(1001,101,2000);
insert into package(package_id,nanny_id,package_cost)values(1002,102,3000);
insert into package(package_id,nanny_id,package_cost)values(1003,103,4000);
insert into package(package_id,nanny_id,package_cost)values(1004,101,2400);
insert into package(package_id,nanny_id,package_cost)values(1005,105,2000);
insert into package(package_id,nanny_id,package_cost)values(1006,106,2900);
insert into package(package_id,nanny_id,package_cost)values(1007,109,1800);
insert into package(package_id,nanny_id,package_cost)values(1008,110,2100);
insert into package(package_id,nanny_id,package_cost)values(1009,106,2070);
insert into package(package_id,nanny_id,package_cost)values(1010,108,2090);


insert into transactions(transactions_id,transactions_date,child_id)values(2001,'14-7-2022',201);
insert into transactions(transactions_id,transactions_date,child_id)values(2002,'15-7-2022',203);
insert into transactions(transactions_id,transactions_date,child_id)values(2003,'17-7-2022',202);
insert into transactions(transactions_id,transactions_date,child_id)values(2004,'14-7-2022',205);
insert into transactions(transactions_id,transactions_date,child_id)values(2005,'14-5-2022',204);
insert into transactions(transactions_id,transactions_date,child_id)values(2006,'11-7-2022',206);
insert into transactions(transactions_id,transactions_date,child_id)values(2007,'14-4-2022',207);
insert into transactions(transactions_id,transactions_date,child_id)values(2008,'19-7-2022',203);
insert into transactions(transactions_id,transactions_date,child_id)values(2009,'14-1-2022',201);
insert into transactions(transactions_id,transactions_date,child_id)values(2010,'24-7-2022',202);


select *from guardian;
select *from nanny;
select *from child;
select *from package;
select *from transactions;