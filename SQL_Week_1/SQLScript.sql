/* 
To talk with any RDBMS application we required
SQL (Structure Query language)

DQL : (Data Query Language) : Select
DDL : (Data Definiation Language) : Create, alter truncate, drop, rename
DCL : (Data Control Language) : Grant, Revoke
DML : (Data Manipulation Language) : Insert, Update, Delete
TCL : (Transaction Control Language) : commit, Rollback, Savepoint
*/

-- In MySQL, You can import the data from CSV and JSON only.
Select * from EmployeeDB;
Select FirstName, LastName, Grade, Sales From EmployeeDB;
-- Order By Clause
Select FirstName, LastName, Grade, Sales From EmployeeDB
Order by Sales ASC;

Select FirstName, Sales, LastName, Grade, Sales From EmployeeDB
Order by Sales Desc;

Select FirstName, Sales, LastName, Grade, Sales From EmployeeDB
Order by Sales Desc, FirstName ASC, Grade Desc;

/* Where Clause
Using this clause we can filter the rows based on some 
specific conditions
*/
-- Logical Operators, Between, In, Like clause

Select * from EmployeeDB
Where Sales > 4000;

Select * from EmployeeDB
Where Sales >= 3000 and Sales <= 4000;

Select * from EmployeeDB
Where Sales >= 3000 OR Sales <= 4000;

Select * from EmployeeDB
Where Grade = 'A' AND Grade = 'B';

Select * from EmployeeDB
Where 1 != 1;

Select * from EmployeeDB
Where (YearlyIncome >= 60000 and Sales >= 3000)
AND (Grade = 'A' or Grade = 'B' or Grade = 'D')
Order by YearlyIncome ASC, Sales Desc;

-- I want all the records except above query's output
Select * from EmployeeDB
Where not(((YearlyIncome >= 60000 and Sales >= 3000)
AND (Grade = 'A' or Grade = 'B' or Grade = 'D')))
Order by YearlyIncome ASC, Sales Desc;

Select * from EmployeeDB
Where not(Sales >= 4000);

/* Between
Using this operator we can filter the data in specific range,
Between operator consider starting position and ends position
*/

Select * from EmployeeDB 
Where Sales between 3000 and 3307;

Select * from EmployeeDB 
Where Sales not between 3000 and 3307;

-- In Clause
Select * from EmployeeDb Where Grade in ('A','C','X','D')
And (Sales > 3000 and Sales <= 5000)
And (Occupation = 'Clerical' or Occupation = 'Professional');

-- Without In
Select * from EmployeeDb 
Where Grade = 'A' or Grade = 'C' or Grade = 'X' or Grade = 'D';

-- Beautify your query by Ctrl + B

-- Like Clause (WildCard : % and _)
-- % : Represent any series of char
-- _ : Represent a single char only

SELECT 
    *
FROM
    superstore_sales
WHERE
    `Customer Name` LIKE 'A%';

Select count(*) from superstore_sales
Where `Customer Name` Like 'A%';

Select * from superstore_sales
Where `Customer Name` Like 'A%Y';

Select * from superstore_sales
Where `Customer Name` like '__e%y'
and (sales >= 1000);

Create Database SQL_Constraint;

/* Primary Key:
Using primary key we can identify each row uniquely.
A PK key column can not contains any null value or duplicate value.
A table can have only 1 primary key at a time.
*/
Create Table Employees
(
	EmployeeID Int Primary key,
    EmpName varchar(50) not null,
    Department varchar(50) not null,
    City varchar(20) null
);

Select * from Employees;

Insert into Employees(EmployeeID,EmpName,Department,City)
values (101,'Ayush Kumar','Sales',null);

Insert into Employees(EmployeeID,EmpName,Department,City)
values (101,'Ayush Kumar','Sales',null);

Insert into Employees(EmployeeID,EmpName,Department,City)
values (null,'Mukesh Kumar','CS',null);

drop table employees;

/* Foreign Key:
Using FK we can define a relationship between two tables.
FK key column can contains null and duplicate as well.
A table can have as many foreign key.
*/

Create Table Departments
(
	DepartmentID int primary key,
    DepartmentName varchar(20) null
);

Insert into Departments(DepartmentID,DepartmentName)
Values 
(11,'Sales'),
(12, 'Finance'),
(21,'Marketing'),
(14,'HR'),
(15,'Admin'),
(16,'IT'),
(17,'AI-ML'),
(18,'Software Developer'),
(19,'Designer'),
(99,Null);

Select * from Departments;

Create Table Employees
(
	EmployeeID Int Primary key,
    EmpName varchar(50) not null,
    DeptID Int,
    City varchar(20) null,
    foreign key (DeptID) references Departments(DepartmentID)
);

Insert into Employees(EmployeeID,EmpName,DeptID,City)
values (101,'Ayush Kumar',19,null);

Select * from Employees;

Insert into Employees(EmployeeID,EmpName,DeptID,City)
values (102,'Abhisheak Saraswat',99,'Goa');

-- In Employee Table I want to add a column Email

Alter Table Employees
Add Column Email varchar(100) unique;

Select * from employees;

Select * from Employees;
update Employees set email = 'ayush.kumar@test.com' where
employeeid = 101;

update employees set email = 'abhisheak.saraswat@test.com'
where employeeid = 102;

Insert into Employees(EmployeeID,EmpName,DeptID,City,Email)
values (103,'Mr Modi',15,'Goa',null);

Insert into Employees(EmployeeID,EmpName,DeptID,City,Email)
values (104,'Mr Modi',15,'Goa',null);

Select * from Departments;
Delete from Departments where departmentId = 15;

-- About Unique Constraint:
/*
In MySQL workbench :
Unique key column can access multiple null value,
where as in ms sql you can supply only 1 time of null value.
*/


-- Check Constraint
Create Table Testing
(
	EmpId int primary key,
    age int check (age >= 18 and age < 59),
    salary decimal(10,2) check (salary > 25000)
);

insert into Testing(EmpId,Age,Salary)
values (1,50,50000);

insert into Testing(EmpId,Age,Salary)
values (2,20,24500);

Alter Table Testing Add Constraint YourCheckConstraintName check (YourCondition);

Alter Table Testing drop Check YourCheckConstraintName;

-- Default Constraint
Create Table Testing1
(
	id int primary key,
    name varchar(20) not null,
    age int default 20,
    salary decimal(10,2) default 250000.00

)
/* Primary key and Unique Key:

Primary and unique key can be created also combination of more than 1 column
if needed.
*/
/*
There was a question while learning 
How many rows would you get if you use the below query.
select * from table where salary <> NULL;
Answer is 0
Explanation: Though the query is wrong, the MySQL workbench does not through an error, rather it returns no rows.

I didn't understand why the answer is 0.
*/

Select * from employees
where email is not null;

Select count(*) as NullCount from employees
where email is  null;

Select * from Employees
where email = Null;

Select * from Employees
where email != Null;

Select * from Employees
where email <> Null;

/*
my friend who is also an engineer said that you can try
select * from table where salary <> 'NULL'
*/

Select * from Employees
where email <> 'Null';

Select * from Employees
where email = 'Null'; -- no records

-- ----------------------------------------------------
# Question 1:
# 1) Create a Database Bank.
Create DataBase Bank;
Use Bank;

Create Table Bank_Inventory
(
	Product char(10),
    Quantity int,
    Price real,
    Purchase_cost decimal (6,2),
    estimated_sale_price float
);

# Question 2:
# 2) Create a table with the name “Bank_Inventory” with the following columns
-- Product  with string data type and size 10 --
-- Quantity with numerical data type --
-- Price with data type that can handle all real numbers
-- purchase_cost with data type which always shows two decimal values --
-- estimated_sale_price with data type float --

# Question 3:
# 3) Display all column names and their datatype and size in Bank_Inventory.
describe Bank_Inventory;

# Question 4:
# 4) Insert the below two records into Bank_Inventory table .
-- 1st record with values --
			-- Product : PayCard
			-- Quantity: 2 
			-- price : 300.45 
			-- Puchase_cost : 8000.87
			-- estimated_sale_price: 9000.56 --
-- 2nd record with values --
			-- Product : PayPoints
			-- Quantity: 4
			-- price : 200.89 
			-- Puchase_cost : 7000.67
			-- estimated_sale_price: 6700.56
Insert into Bank_Inventory(Product,Quantity,Price,Purchase_cost,
estimated_sale_price)
values ('PayCard',2,300.45,8000.87,9000.56),
('PayPoints',4,200.89,7000.67,6700.56);

Select * from Bank_Inventory;

# Question 5:
# 5) Add a column : Geo_Location to the existing Bank_Inventory table with data type varchar and size 20 .
Alter Table Bank_Inventory add geo_location varchar(20);

# Question 6:
# 6) What is the value of Geo_Location for product : ‘PayCard’?
Select geo_location from Bank_Inventory Where Product = 'PayCard';

# Question 7:
# 7) How many characters does the  Product : 
-- ‘PayCard’ store in the Bank_Inventory table.
Select char_length(product) from Bank_Inventory
Where Product = 'PayCard';


# Question 8:
# a) Update the Geo_Location field from NULL to ‘Delhi-City’ 
Update Bank_Inventory set Geo_Location = 'Delhi-City'
Where Geo_Location is Null;

Set SQL_Safe_updates = 0;
Select * from Bank_inventory;
# b) How many characters does the  Geo_Location field value ‘Delhi-City’ stores in the Bank_Inventory table
Select char_length(geo_location) from bank_inventory where geo_location='delhi-city';

# Question 9:
# 9) update the Product field from CHAR to VARCHAR size 10 in Bank_Inventory 
Alter Table Bank_Inventory Modify Product varchar(10);

# Question 10:
# 10) Reduce the size of the Product field from 10 to 6 and check if it is possible. 
Alter Table Bank_Inventory Modify Product varchar(6);

/*
12:30:49	Alter Table Bank_Inventory Modify Product varchar(6)	
Error Code: 1265. Data truncated for column 'Product' at row 1	0.062 sec
*/

Select * from Bank_Inventory;


# Question 11:
# 11) Bank_inventory table consists of ‘PayCard’ product details .
-- For ‘PayCard’ product, Update the quantity from 2 to 10  
update bank_inventory set quantity = 10 where product = 'paycard';
Select * from bank_inventory;
 # Question 12:
# 12) Create a table named as Bank_Holidays with below fields 
-- a) Holiday field which displays or accepts only date 
-- b) Start_time field which also displays or accepts date and time both.  
-- c) End_time field which also displays or accepts date and time along with the timezone also. 
Create Table Bank_Holidays
(	
	holiday date,
    start_time datetime,
    end_time timestamp
);

 # Question 13:
# 13) Step 1: Insert today’s date details in all fields of Bank_Holidays 
-- Step 2: After step1, perform the below 
-- Postpone Holiday to next day by updating the Holiday field 
Insert into Bank_Holidays(holiday,start_time,end_time)
values (current_Date(),current_date(),current_date());

Select * from bank_holidays;

update bank_holidays set holiday = date_add(holiday, interval 1 day);

Select * from bank_holidays;
# Question 14:
# 14) Modify  the Start_time data with today's datetime in the Bank_Holidays table 

update bank_holidays set start_time = current_timestamp();

# Question 15:
# 15) Update the End_time with UTC time(GMT Time) in the Bank_Holidays table. 
update bank_holidays set end_time = utc_timestamp();
Select * from bank_holidays;
# Question 16:
# 16) Select all columns from Bank_Inventory without mentioning any column name
Select * from bank_inventory limit 1;
# Question 17:
# 17)  Display output of PRODUCT field as NEW_PRODUCT in  Bank_Inventory table 
Select Product as new_Product from Bank_Inventory;
# Question 18:
# 18)  Display only one record from bank_Inventory 
Select * from bank_inventory limit 1; -- MySQL
-- Select Top 1 * from Bank_Inventory; -- MS SQL
# Question 19:
# 19) Modify  the End_time data with today's datetime in the Bank_Holidays table 
update bank_holidays set end_time = current_timestamp();
Select * from bank_holidays;
# Question 20:
# 20) Display the first five rows of the Geo_location field of Bank_Inventory.
Select * from bank_inventory limit 5;

/* 
ReCap:
Select Statement
Order by
Where 
Logical Operators (And, or, not)
In, Between and Like Clause

Constraints:
Primary Key,
Foreign Key
Unique Key
Default
Null
NotNull
Check

Your In-Class Excercise.

*/

-- https://www.youtube.com/playlist?list=PLWuFHho1zKhUf5ZMYHnPC0Yoe3XtpMp4e

