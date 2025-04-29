CREATE TABLE Player (
id NUMBER NOT NULL  UNIQUE ,
name varchar2(18) UNIQUE ,
age NUMBER
);

CREATE TABLE Manger  (
id NUMBER PRIMARY ,
name varchar2(18) NOT NULL  ,
CONSTRAINT mgr UNIQUE(id,name)
);

CREATE TABLE Manager2 (
id   NUMBER CONSTRAINT idm PRIMARY KEY,
name varchar2(18) ,
age NUMBER