CREATE TABLE Employees (
name varchar2(17) ,
age int ,
CONSTRAINT age_check CHECK (age >=18) 
CONSTRAINT salary_check CHECK (salary > 3000 AND salary < 10000)
);

CREATE TABLE products (
name varchar2(17) ,
price int ,
CONSTRAINT salary_check CHECK (price > 0)
);

CREATE TABLE students (
name varchar2(17) ,
grade varchar2(1),
CONSTRAINT salary_check CHECK (grade IN ('A' , 'B' , 'C' , 'D' , 'F'))
);
----------------
CREATE TABLE customer (
id int,
name varchar2(17) ,
email varchar2(18),
);
CREATE TABLE orders (
name varchar2(17) ,
customer_id int,
);
CREATE TABLE acounts (
id int  ,
balance int ,
);
CREATE TABLE departments (
id int,
sections int ,
);


ALTER TABLE customer ADD CONSTRAINT cust_email UNIQUE (email);
ALTER TABLE ordes ADD CONSTRAINT fk FOREIGN KEY (customer_id) REFERENCES customers(id);
ALTER TABLE acounts ADD CHECK (balance >= 0);
ALTER TABLE departments ADD CONSTRAINT pk PRIMARY KEY (id);
--------------
CREATE TABLE Employees (
name varchar2(17) ,
age int ,
CONSTRAINT age_check CHECK (age >=18) 
CONSTRAINT chk_salary CHECK (salary > 3000 AND salary < 10000)
);

CREATE TABLE users (
id int,
name varchar2(17) ,
email varchar2(18),
CONSTRAINT uq UNIQUE (email)
);

CREATE TABLE products (
id int ,
name varchar2(17) ,
price int ,
CONSTRAINT pk PRIMARY KEY  (id)
);
CREATE TABLE orders (
name varchar2(17) ,
customer_id int,
CONSTRAINT fk_order_customer FOREIGN KEY (customer_id) REFERENCES customers (id)
);

CREATE TABLE phone (
phone int,
CONSTRAINT not_null_phone NOT NULL  (phone)
);

ALTER TABLE Empioyees DROP CONSTRAINT chk_salary;
ALTER TABLE users DROP CONSTRAINT uq ;
ALTER TABLE products DROP CONSTRAINT pk ;
ALTER TABLE ORDERS  DROP CONSTRAINT fk_order_customer ;
ALTER TABLE ORDERS  DROP CONSTRAINT not_null_phone ;
--------
ALTER TABLE students RENAME CONSTRAINT chk_age TO check_min_age;
ALTER TABLE employees RENAME CONSTRAINT fk_emp_dept TO fk_employee_department;
ALTER TABLE users RENAME CONSTRAINT pk TO pk_users_id;
ALTER TABLE users RENAME CONSTRAINT user_name_clmn TO uk_user_name;
--------
ALTER TABLE orders DISABLE CONSTRAINT fk_customer_order;
ALTER TABLE products DISABLE CONSTRAINT *; -- i dont know
ALTER TABLE acounts DISABLE CONSTRAINT chk_balnce;
--------
ALTER TABLE ORDERS  ENABLE CONSTRAINT fk_customer_order;
ALTER TABLE products ENABLE CONSTRAINT *; -- idont know
ALTER TABLE departments_copy ENABLE CONSTRAINT dept_cpy_id_pk;














