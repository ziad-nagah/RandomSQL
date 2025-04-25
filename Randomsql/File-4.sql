CREATE TABLE EMP_TEST(
NAME varchar2(18)
);

INSERT INTO EMP_TEST VALUES (' ziad ');
INSERT INTO EMP_TEST VALUES ('  amr  ');
INSERT INTO EMP_TEST VALUES (' amr ');
INSERT INTO EMP_TEST VALUES ('  ziad  ');
INSERT INTO EMP_TEST VALUES (' *alaa#');
INSERT INTO EMP_TEST VALUES (' **eslam## ');
INSERT INTO EMP_TEST VALUES (' **ehab** ');
INSERT INTO EMP_TEST VALUES (' ##samy## ');
INSERT INTO EMP_TEST VALUES ('**ahmed**');
INSERT INTO EMP_TEST VALUES ('##sameer##');
INSERT INTO EMP_TEST VALUES ('**salem##');

SELECT TRIM (BOTH ' ' FROM NAME ) trimmed_text from EMP_TEST;
SELECT LTRIM (NAME) l_trimmed_text from EMP_TEST;
SELECT RTRIM (NAME) r_trimmed_text from EMP_TEST;
SELECT TRIM (BOTH '*' FROM NAME ) trimmed_text from EMP_TEST;
SELECT TRIM (BOTH '#' FROM NAME ) trimmed_text from EMP_TEST;

----------
SELECT REPLACE('database','a','@') rpl FROM dual;
SELECT REPLACE('old world order','old','new') rpl FROM dual;

CREATE TABLE PRODUCT(
product_name varchar2(18)
);
INSERT INTO PRODUCT VALUES ('noodels');
INSERT INTO PRODUCT VALUES ('sugar');
INSERT INTO PRODUCT VALUES ('salt');

SELECT lpad(product_name,15,'*') pad FROM PRODUCT;
SELECT rpad(product_name,15,'#') pad FROM PRODUCT;
----------
SELECT to_char(sysdate,'DD-MON-YYYY') "Formatted Date" FROM dual;

SELECT to_char(sysdate,'Month-YYYY') "Formatted Date" FROM dual;

SELECT to_char(12345.67,'999,99.99') "Formatted salsry" from dual ;

SELECT to_char(12345.67,'999,99.99 $') "Formatted salary" from dual ;
----------
CREATE TABLE STUDENT(
name varchar2(18),
marks int
);

INSERT INTO STUDENT VALUES ('ziad', 90);
INSERT INTO STUDENT VALUES ('amr' ,  80);
INSERT INTO STUDENT VALUES ('amir' ,  70);
INSERT INTO STUDENT VALUES ('zaid', 50);
INSERT INTO STUDENT VALUES ('ali' ,  40);

SELECT name, CASE
                  WHEN marks >= 90 THEN 'A'
                          WHEN  80 <= marks AND  marks < 89   THEN 'B'
                          WHEN  70 <= marks AND  marks < 79  THEN 'C'
                          ELSE 'F'
                          END "GRADES"
                  FROM STUDENT;
--------
CREATE TABLE ORDERS(
STATUS varchar2(1)
);SELECT name, marks,
  DECODE(marks,
    100, 'A',
    90, 'A',
    85, 'B',
    75, 'C',
    60, 'F',
    'Unknown'
  ) AS grade
FROM student;

INSERT INTO ORDERS VALUES ('P');
INSERT INTO ORDERS VALUES ('S');
INSERT INTO ORDERS VALUES ('D');

SELECT DECODE(STATUS,'P','Pending',
                      'S' ,'Shipped',
                      'D' ,'Delivered') as STAT
FROM ORDERS;

------------

CREATE TABLE customers (
    full_name VARCHAR2(100)
);

INSERT INTO customers VALUES ('  Ahmed');
INSERT INTO customers VALUES ('Salma   ');
INSERT INTO customers VALUES ('  Mahmoud   ');


SELECT TRIM(full_name) AS trimmed_name FROM customers;


SELECT LTRIM(full_name) AS left_trimmed_name FROM customers;


SELECT RTRIM(full_name) AS right_trimmed_name FROM customers;


SELECT TRIM('$' FROM '$$Ali$$') AS trimmed_symbol FROM dual;

SELECT REPLACE('promotion', 'o', '0') AS replaced_text FROM dual;


SELECT REPLACE('This is a basic course', 'basic', 'advanced') AS updated_sentence FROM dual;


CREATE TABLE departments (
    dept_name VARCHAR2(50)
);


INSERT INTO departments VALUES ('HR');
INSERT INTO departments VALUES ('Finance');
INSERT INTO departments VALUES ('IT');


SELECT LPAD(dept_name, 15, '*') AS left_padded FROM departments;


SELECT RPAD(dept_name, 15, '-') AS right_padded FROM departments;


SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY') AS formatted_date FROM dual;

SELECT TO_CHAR(SYSDATE, 'Day, Month YYYY') AS long_format FROM dual;


SELECT TO_CHAR(1234567.89, '9,999,999.99') AS formatted_number FROM dual;


SELECT TO_CHAR(1500, '$9,999.00') AS salary_formatted FROM dual;


SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS full_timestamp FROM dual;

CREATE TABLE students (
    name VARCHAR2(50),
    score NUMBER
);


INSERT INTO students VALUES ('Ali', 95);
INSERT INTO students VALUES ('Sara', 83);
INSERT INTO students VALUES ('Omar', 75);
INSERT INTO students VALUES ('Mona', 65);
INSERT INTO students VALUES ('Kareem', 50);


SELECT name, score,
  CASE
    WHEN score >= 90 THEN 'A'
    WHEN score >= 80 THEN 'B'
    WHEN score >= 70 THEN 'C'
    ELSE 'F'
  END AS grade
FROM students;


SELECT name, score,
  CASE
    WHEN score >= 60 THEN 'Pass'
    ELSE 'Fail'
  END AS result
FROM students;


SELECT name, score,
  CASE
    WHEN score >= 90 THEN 'Excellent'
    WHEN score >= 80 THEN 'Good'
    WHEN score >= 70 THEN 'Average'
    ELSE 'Needs Improvement'
  END AS feedback
FROM students;

SELECT 'Today is ' || TO_CHAR(SYSDATE, 'Day') AS today_message FROM dual;


SELECT score,
  DECODE(score,
    100, 'A',
    90, 'B',
    80, 'C',
    'F'
  ) AS grade
FROM (SELECT 100 AS score FROM dual
      UNION ALL
      SELECT 90 FROM dual
      UNION ALL
      SELECT 80 FROM dual
      UNION ALL
      SELECT 60 FROM dual);

CREATE TABLE status_log (
    status_code CHAR(1)
);


INSERT INTO status_log VALUES ('N');
INSERT INTO status_log VALUES ('I');
INSERT INTO status_log VALUES ('C');


SELECT status_code,
  DECODE(status_code,
    'N', 'New',
    'I', 'In Progress',
    'C', 'Completed'
  ) AS status_description
FROM status_log;


SELECT product_name, quantity,
  DECODE(quantity,
    0, 'Out of Stock',
    'Available'
  ) AS stock_status
FROM (SELECT 'Mouse' AS product_name, 0 AS quantity FROM dual
      UNION ALL
      SELECT 'Keyboard', 10 FROM dual);


SELECT department,
  DECODE(department,
    'HR', 500,
    'IT', 1000,
    'Sales', 1500,
    300
  ) AS bonus
FROM (SELECT 'HR' AS department FROM dual
      UNION ALL
      SELECT 'IT' FROM dual
      UNION ALL
      SELECT 'Sales' FROM dual
      UNION ALL
      SELECT 'Support' FROM dual);
