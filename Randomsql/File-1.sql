CREATE TABLE Manger (
id int ,
name varchar2(8),
age int,
birth_date DATE ,
address varchar2(50)
);
/*----------------------------------------*/
ALTER TABLE Manger DROP COLUMN address;
ALTER TABLE MANGER  ADD  (city_address varchar2(12), street varchar(13)); 
/*----------------------------------------*/
ALTER TABLE MANGER  RENAME COLUMN  name to full_name ;
/*-----------------------------------------*/
ALTER TABLE MANGER  READ ONLY;
/*-----------------------------------------*/
CREATE TABLE Owner AS SELECT id , full_name, birth_date FROM Manger ;
/*------------------------------------------*/
ALTER TABLE MANGER  RENAME TO Master;
/*------------------------------------------*/
DROP TABLE Master;
DROP TABLE Owner;
/*--------------------------------------------*/