CREATE TABLE Doctor (
id int ,
name varchar2(18),
salary int,
address  varchar2(20));
-------------------------------------------------------------
INSERT ALL 
INTO Doctor (id, name , salary , address) VALUES(1,'Tarek',8000, 'Alex')
INTO Doctor (id, name , salary , address) VALUES(2,'Ali',8000, 'Alex')
INTO Doctor (id, name , salary , address) VALUES (3,'Fady',8000, 'Alex')
INTO Doctor (id, name , salary , address) VALUES (4,'Mrwan',8000, 'Alex')
INTO Doctor (id, name , salary , address) VALUES (5,'Ahmed',2000, 'Alex')
INTO Doctor (id, name , salary , address) VALUES (6,'Muhammad',8000, 'Alex')
INTO Doctor (id, name , salary , address) VALUES (7,'Ebraheem',1000, 'Alex')
INTO Doctor (id, name , salary , address) VALUES (8,'Eslam',8000, 'Alex')
INTO Doctor (id, name , salary , address) VALUES (9,'Zaid',3000, 'Alex')
SELECT * FROM dual ;
--------------------------------------------------------------
UPDATE Doctor SET salary = 20000 WHERE id = 3;
--------------------------------------------------------------
DELETE Doctor WHERE id = 9;
--------------------------------------------------------------
SELECT address,name || ', take sallary ' || salary , id FROM DOCTOR ;
--------------------------------------------------------------
SELECT id, name , salary*2 , address FROM Doctor ;
--------------------------------------------------------------
SELECT * FROM Doctor WHERE salary = 1000 OR salary = 2000 OR salary = 3000;
--------------------------------------------------------------
ALTER TABLE Doctor RENAME TO PRD_DOCTOR;
---------------------------------------------------------------
CREATE TABLE Employees (
EmployeeID int ,
FirstName varchar2(17),
LastNamevarchar2(15),
Department varchar2(10),
Salary int );
---------------------------------------------------------------
INSERT ALL 
INTO Employees (EmployeeID, FirstName, LastName, Department, Salary ) VALUES(101,'John1','Doe1','HR',20000)
INTO Employees (EmployeeID, FirstName, LastName, Department, Salary ) VALUES(102,'John2','Doe2','IT',50000)
INTO Employees (EmployeeID, FirstName, LastName, Department, Salary ) VALUES (103,'John3','Doe3','CS',40000)
INTO Employees (EmployeeID, FirstName, LastName, Department, Salary ) VALUES (104,'John4','Doe4','IT',10000)
INTO Employees (EmployeeID, FirstName, LastName, Department, Salary ) VALUES (105,'John5','Doe5','ZX',30000)
SELECT * FROM dual ;
----------------------------------------------------------------
UPDATE EMPLOYEES  SET Salary = 600000 WHERE id =101;
---------------------------------------------------------------
DROP TABLE Employees;
FLASHBACK TABLE Employees TO BEFORE DROP;
---------------------------------------------------------------
DELETE Employees WHERE SELECT Department FROM Employees WHERE id = 101;
----------------------------------------------------------------
SELECT EmployeeID,Firstname || ' ' || Lastname , Department,Salary FROM Employees ;
----------------------------------------------------------------












