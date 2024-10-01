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

SELECT emp_name, ROUND(salary*1.15,2) AS new_salary FROM employee;

SELECT CONCAT(emp_name," - ",job_name) AS employee_job FROM employee;

SELECT emp_id,emp_name,salary,DATE_FORMAT(hire_date, '%M %d,%Y') AS formatted_hire_date FROM employee;

SELECT emp_name,LENGTH(REPLACE(emp_name,"","")) AS name_length FROM employee;

SELECT emp_id,salary,commission FROM employee;

SELECT * FROM employee WHERE dep_id NOT IN(2001);

SELECT * FROM employee WHERE hire_date < '1991-01-01';

SELECT AVG(salary) AS avg_salary FROM employee WHERE job_name='ANALYST';

SELECT * FROM employee WHERE emp_name="BLAZE";

SELECT * FROM employee WHERE (salary*1.25) > 3000;

SELECT * FROM employee WHERE MONTH(hire_date)=2;

SELECT * FROM employee WHERE hire_date<'1991-04-01';

SELECT emp_name,salary FROM employee WHERE emp_name="FRANK" AND salary BETWEEN 
(SELECT MIN(salary) FROM employee) AND (SELECT MAX(salary) FROM employee);

SELECT * FROM employee WHERE job_name NOT IN('PRESIDENT','MANAGER') ORDER BY salary ASC;

SELECT * FROM employee WHERE salary=(SELECT MAX(salary) FROM employee);

SELECT job_name,AVG(salary) AS avg_salary ,AVG(salary+commission) AS avg_renumeration 
FROM employee GROUP BY job_name;

SELECT * FROM employee WHERE dep_id IN (1001 ,2001);

SELECT manager_id,COUNT(emp_id) AS NO_OF_EMPLOYEES FROM employee
GROUP BY manager_id ORDER BY manager_id ASC;

SELECT dep_id,COUNT(emp_id) AS emp_count 
FROM employee 
GROUP BY dep_id
HAVING COUNT(emp_id)>=2;

SELECT * FROM employee
WHERE emp_name LIKE '%AR%';

ALTER TABLE employee
ADD COLUMN gender VARCHAR(10);
SET SQL_SAFE_UPDATES = 0;
UPDATE employee
SET gender= CASE emp_name
    WHEN 'KAYLING' THEN 'F'
    WHEN 'BLAZE' THEN 'M'
    WHEN 'CLARE' THEN 'F'
    WHEN 'JONAS' THEN 'M'
    WHEN 'SCARLET' THEN 'F'
    WHEN 'FRANK' THEN 'M'
    WHEN 'SANDRINE' THEN 'F'
    WHEN 'ADELYN' THEN 'F'
    WHEN 'WADE' THEN 'M'
    WHEN 'MADDEN' THEN 'M'
    WHEN 'TUCKER' THEN 'M'
    WHEN 'ADNRES' THEN 'F'
    WHEN 'JULIUS' THEN 'M'
    WHEN 'MARKER' THEN 'M'
    ELSE NULL  
END;

SELECT emp_name,job_name,
CASE WHEN job_name IN ('PRESIDENT','MANAGER','ANALYST') THEN 'MANAGMENT LEVEL'
WHEN job_name IN ('SALESMAN','CLERK') THEN 'EMPLOYEE LEVEL'
ELSE 'Other Level'
END AS level 
FROM employee;