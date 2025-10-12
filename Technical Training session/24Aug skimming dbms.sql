Ques 1:
use rev

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2),
    ManufactureDate DATE
);

INSERT INTO Products (ProductID, ProductName, Price, ManufactureDate) VALUES
(1, 'Laptop Pro 15', 95000, '2024-11-15'),
(2, 'Wireless Mouse', 1500, '2025-02-05'),
(3, 'Gaming Keyboard', 4200, '2024-12-25'),
(4, 'Smartphone Ultra', 68000, '2025-01-18');



Ques 3
use adobe
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

-- Create Employees table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT NULL,
    Salary INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);





SELECT * FROM Departments
-- Insert data into Departments
INSERT INTO Departments (DeptID, DeptName, Location) VALUES
(10, 'HR', 'Delhi'),
(20, 'IT', 'Mumbai'),
(30, 'Finance', 'Pune'),
(50, 'Marketing', 'Chennai');

-- Insert data into Employees
INSERT INTO Employees (EmpID, EmpName, DeptID, Salary) VALUES
(1, 'Akash', 10, 50000),
(2, 'Nisha', 20, 60000),
(4, 'Simran', 30, 70000),
(5, 'Meena', 30, 55000);     -- Dept 40 does not exist in Departments




Ques 4:
use adobe

CREATE TABLE StudentMarks (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Marks INT
);
INSERT INTO StudentMarks (StudentID, StudentName, Marks) VALUES
(101, 'Aditi', 92),
(102, 'Bharat', 88),
(103, 'Charan', 95),
(104, 'Divya', 92),
(105, 'Esha', 90);





Ques 5:

use adobe

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Marks INT,
    City VARCHAR(50)
);

INSERT INTO Student (StudentID, StudentName, Marks, City) VALUES
-- Delhi Students
(101, 'Aditi', 92, 'Delhi'),
(102, 'Bharat', 88, 'Delhi'),
(103, 'Charan', 95, 'Delhi'),
(104, 'Divya', 92, 'Delhi'),
(105, 'Esha', 90, 'Delhi'),

-- Mumbai Students
(201, 'Farhan', 91, 'Mumbai'),
(202, 'Gauri', 85, 'Mumbai'),
(203, 'Harsh', 96, 'Mumbai'),
(204, 'Isha', 89, 'Mumbai'),
(205, 'Jay', 92, 'Mumbai'),

-- Bangalore Students
(301, 'Kiran', 94, 'Bangalore'),
(302, 'Laksh', 90, 'Bangalore'),
(303, 'Meera', 88, 'Bangalore'),
(304, 'Nikhil', 95, 'Bangalore'),
(305, 'Om', 91, 'Bangalore');








































1
SELECT *,
DATEADD(MONTH,18,ManufactureDate) AS WARRENTY_EXPIRY,
DATEDIFF(DAY,GETDATE(),DATEADD(MONTH,18,ManufactureDate)) AS REMAINING_DAYS
FROM Products
WHERE GETDATE()<DATEADD(MONTH,18,ManufactureDate)

2->https://leetcode.com/problems/rising-temperature/description/


3
SELECT D.DeptName,COUNT(E.EmpID) AS COUNTS,AVG(E.Salary) AS AVERAGE,
CASE 
WHEN COUNT(E.EmpID)=0 THEN 'NO EMPLOYESS'
WHEN AVG(E.Salary) >=60000 THEN 'HIGH AVG'
WHEN AVG(E.Salary) BETWEEN 50000 AND 60000 THEN 'MEDUIM AVG'
ELSE 'LOW AVG'
END  AS 'SALARY_ CATEGORY' 
FROM Departments AS D
LEFT JOIN Employees AS E
ON D.DeptID=E.DeptID
GROUP BY D.DeptName



4->

 with s_Rank as(
 Select *,
rank() over(order by marks desc) as rk
 from StudentMarks
 )
 SELECT * FROM s_Rank
 where rk=4

  with s_Rank as(
 Select *,
dense_rank() over(order by marks desc) as rk
 from StudentMarks
 )
 SELECT * FROM s_Rank
 where rk=3



5->


 WITH CTE AS(
 SELECT *,
ROW_NUMBER()	OVER(PARTITION BY CITY ORDER BY MARKS DESC) AS ROW_NUM
 FROM Student
 )
 SELECT City,StudentName,Marks FROM CTE
 WHERE ROW_NUM=1


Lag->


 ---
 WITH CTE1 AS(
 SELECT *,
	LAG(MARKS)	OVER(ORDER BY STUDENTID) AS PREV_STUDENT_MARKS
 FROM StudentMarks 
 )

 SELECT *, 
 CASE WHEN PREV_STUDENT_MARKS IS NULL OR Marks>PREV_STUDENT_MARKS
 THEN 'I AM THE BEST'
 ELSE
 ' NOT BEST'
 END AS 'STATUS'
 FROM CTE1







LEAD-


WITH CTE1 AS(
 SELECT *,
	Lead(MARKS)	OVER(ORDER BY STUDENTID) AS next_STUDENT_MARKS
 FROM StudentMarks 
 )

 SELECT *, 
 CASE WHEN  next_STUDENT_MARKS is NULL OR Marks>next_STUDENT_MARKS
 THEN 'I AM THE BEST'
 ELSE
 ' NOT 