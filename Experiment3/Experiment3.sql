
--------------------EXPERIMENT 03: (EASY LEVEL)
/*
PS: YOU ARE GIVEN WITH EMPLOYEE TABLE WITH ONLY ONE ATTRIBUTE THAT IS EMP_ID WHICH CONTAINS VALUES AS:
										EMPLOYEE (EMP_ID)
                    						2
                                4
                                4
                                6
                                6
                                7
                                8
                                8
                                8
  TASK: FIND THE MAXIMUM VALUE FOR EMP_ID, BUT EXCLUDING THE DUPLICATE EMPLOYEE ID'S. (ONLY WITH SUB-QUERIES)
  OUTPUT: 7  
  
  EXPLAINATION: IF WE EXCLUDE DUPLICATES SUCH AS, 4, 6, AND 8, & FROM THE REST I.E., 2,7 THE MAXIMUM IS 7.

  */





--------------------EXPERIMENT 03: (MEDIUM LEVEL)
CREATE TABLE department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

drop table employee
-- Create Employee Table
CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);


-- Insert into Department Table
INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

-- Insert into Employee Table
INSERT INTO employee (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);

select d.dept_name, e.name, e.salary
from Employee as e
join department as d
on e.department_id = d.id
where e.salary in 
(
    select max(e2.salary) 
    from employee as e2
    group by e2.department_id
);

select d.dept_name, e.name, e.salary
from Employee as e
join department as d
on e.department_id = d.id
where e.salary in 
(
    select max(e2.salary) 
    from employee as e2
    where e2.department_id = e.department_id
)

create table a1(
    empID varchar(50),
    eName varchar(50),
    salary int,
)

create table b1(
    empID varchar(50),
    eName varchar(50),
    salary int,
)

INSERT INTO a1 (empID, eName, salary) VALUES
(1, 'AA', 1000),
(2, 'BB', 300);

INSERT INTO b1 (empID, eName, salary) VALUES
(2, 'BB', 400),
(3, 'CC', 100);
 
WITH c1 AS (
    SELECT * FROM a1
    UNION
    SELECT * FROM b1
)
SELECT *
FROM c1
WHERE salary IN (
    SELECT MIN(salary)
    FROM c1
    GROUP BY empID
);

-- or 



