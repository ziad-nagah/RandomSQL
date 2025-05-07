CREATE TABLE patient(
PA_id int,
name varchar2(17),
age int,
CONSTRAINT dir_did_pk PRIMARY KEY (PA_id)
);

CREATE TABLE doctor(
doc_id varchar2(17),
name varchar2(17),
salary int,
patients int,
CONSTRAINT docs FOREIGN KEY (patients) REFERENCES patient (PA_id)
);

---------------------------
CREATE TABLE teacher(
T_id int unique,
name varchar2(17),
salary int,
CONSTRAINT dir_did_pk PRIMARY KEY(name)
);


CREATE TABLE lang(
name varchar2(17),
T_id int,
CONSTRAINT docs FOREIGN KEY (T_id) REFERENCES teacher (T_id)
);
-----------------------------
CREATE TABLE empoloyee(
emp_id int ,
name varchar2(17),
salary int,
CONSTRAINT pk PRIMARY KEY(emp_id)
);


CREATE TABLE phone(
num int UNIQUE ,
emp_id int UNIQUE ,
CONSTRAINT fk FOREIGN KEY (emp_id) REFERENCES empoloyee (emp_id)
);

------------------------------
