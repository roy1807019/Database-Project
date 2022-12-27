drop table transactions;
drop table child;
drop table guardian;
drop table package;
drop table nanny;

--dropping trigger
drop trigger check_package_cost;

create table guardian (
  guardian_id number(6) not null,
  guardian_fname varchar(50),
  guardian_lname varchar(50),
  user_address varchar(100),
  phone varchar(20),
  primary key(guardian_id)
);

create table nanny (
  nanny_id number(6) not null,
  nanny_fname varchar(50),
  nanny_lname varchar(50),
  salary number(10),
  phone varchar(20),
  primary key(nanny_id)
);

create table child(
  child_id number(6) not null,
  child_fname varchar(100),
  child_lname varchar(100),
  age number(10),
  guardian_id number(6),
  primary key(child_id),
  foreign key(guardian_id) references guardian(guardian_id)
);

create table package(
  package_id number(6) not null,
  nanny_id number(6),
  package_cost number(10),
  primary key(package_id),
  foreign key (nanny_id) references nanny(nanny_id)
);

create table transactions(
  transactions_id number(6),
  transactions_date varchar(40),
  child_id number(6),
  primary key(transactions_id),
  foreign key(child_id) references  child(child_id)
);

describe guardian;
describe nanny;
describe child;
describe package;
