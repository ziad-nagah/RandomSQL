SELECT * FROM EMPLOYEES  WHERE employee_id BETWEEN  100 and 105 ;
---------
SELECT * FROM employees WHERE employee_id IN  (151 , 152 , 153 , 154 , 155) ;
---------
SELECT * FROM employees WHERE upper(first_name) LIKE 'P%';
---------
SELECT * FROM employees WHERE upper(first_name) LIKE '%A';
---------
SELECT * FROM employees WHERE upper(first_name) LIKE '%A%';
---------
SELECT * FROM employees WHERE upper(first_name) LIKE '__E%';
---------
SELECT * FROM employees WHERE manager_id IS NULL ;
---------
SELECT * FROM employees WHERE manager_id IS NOT NULL ;
---------
INSERT INTO EMPLOYEES (EMPLOYEE_ID , FIRST_NAME , LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,DEPARTMENT_ID) VALUES 
(207 , 'Ziad' , 'Nagah' , 'ziad@ziad.com' , '123456' , sysdate , 'IT_PROG' , '11000' , 0.3 ,  100);
---------
SELECT *    FROM employees WHERE JOB_ID  IN ('AD_VP' , 'IT_PROG');
---------
SELECT * FROM employees ORDER BY FIRST_NAME  ASC  ;
---------
SELECT * FROM employees ORDER BY HIRE_DATE DESC  ;
---------
select * from employees order by first_name asc, salary desc;
---------
SELECT EMPLOYEE_ID , FIRST_NAME , lower(LAST_NAME),EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,DEPARTMENT_ID ,DEPARTMENT_ID FROM employees  ;
---------
SELECT EMPLOYEE_ID , upper(FIRST_NAME) , upper(LAST_NAME),EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,DEPARTMENT_ID ,DEPARTMENT_ID FROM employees  ;
---------
SELECT EMPLOYEE_ID , INITCAP(FIRST_NAME) , INITCAP(LAST_NAME),EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,DEPARTMENT_ID ,DEPARTMENT_ID FROM employees  ;
---------
SELECT * FROM employees WHERE lower(last_name) = 'smith';
---------

