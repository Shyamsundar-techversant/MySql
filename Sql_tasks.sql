CREATE DATABASE office;
USE office;
CREATE TABLE department(id INT PRIMARY KEY,dep_name VARCHAR(20),dep_location VARCHAR(20));
INSERT INTO department VALUES(1001,"Java","Kollam"),(2001,"Python","Alappuzha"),(3001,"Javascript","Thrissur");
SELECT * FROM department;


CREATE TABLE employee(emp_id INT PRIMARY KEY,emp_name VARCHAR(20),job_name VARCHAR(20),manager_id INT,hire_date DATE,
salary FLOAT,commission FLOAT,dep_id INT,FOREIGN KEY(dep_id) REFERENCES department(id));
INSERT INTO employee VALUES(68319,"KAYLING","PRESIDENT", 1,"1991-11-18",6000,0,1001);
SELECT * FROM employee ;
INSERT INTO employee VALUES(66928,"BLAZE","MANAGER",68319,'1991-05-01',2750,0,3001),
							(67832,"CLARE","MANAGER",68319,'1991-06-09',2550,0,1001),
                            (65646,"JONAS","MANAGER",68319,'1991-04-02',2957,0,2001),
							(67858,"SCARLET","ANALYST",65646,'1997-04-19',3100,0,2001),
                            (69062,"FRANK","ANALYST",65646,'1991-12-03',3100,0,2001),
                            (63679,"SANDRINE","CLERK",69062,'1990-12-18',900,0,2001),
                            (64989,"ADELYN","SALESMAN",66928,'1991-02-20',1700,400,3001),
                            (65271,"WADE","SALESMAN",66928,'1991-02-22',1350,600,3001),
                            (66564,"MADDEN","SALESMAN",66928,'1991-09-28',1350,1500,3001),
                            (68454,"TUCKER","SALESMAN",66928,'1991-09-08',1600,0,3001),
                            (68736,"ADNRES","CLERK",67858,'1997-05-23',1200,0,2001),
                            (69000,"JULIUS","CLERK",66928,'1991-12-03',1050,0,3001),
                            (69324,"MARKER","CLERK",67832,'1991-02-23',1400,0,1001);
SELECT * FROM employee;

SELECT salary FROM employee;

SELECT DISTINCT job_name FROM employee;
