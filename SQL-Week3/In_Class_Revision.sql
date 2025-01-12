-- Inner Join (Natural Join)
-- Left Join (Left Outer Join)
-- Right Join (Right Outer Join)
-- Cross Join 
-- Full Join (Full Outer Join)

use hr_database;

Select * from employees;

Select * from departments;

/* Inner Join
Inner Join will give you the common records between the tables.

 In this query we are joining employees and department table,
from department_tbl I want to find out their department_name, location_id.
*/

Select employee_id, first_name, job_id, salary, manager_id, E.department_id,
department_name, D.location_id, street_address, city,country_id
from employees as E
Inner Join Departments as D
On E.department_id = D.department_id
Inner Join Locations as L
on D.location_id = L.location_id;


-- I need Department wise Employee Count based on Above Query
Select department_name, count(*) as EmployeeCount From 
(
	Select employee_id, first_name, job_id, salary, manager_id, E.department_id,
	department_name, D.location_id, street_address, city,country_id
	from employees as E
	Inner Join Departments as D
	On E.department_id = D.department_id
	Inner Join Locations as L
	on D.location_id = L.location_id
) as Tmp
Group by department_name
Order by Employeecount desc;

Select employee_id, first_name, job_id, salary, manager_id, E.department_id,
department_name, D.location_id,country_name,C.region_id, region_name,street_address, city,L.country_id
from employees as E
Inner Join Departments as D
On E.department_id = D.department_id
Inner Join Locations as L
on L.location_id = D.location_id
Inner Join countries as C
on L.country_id = C.country_id
Inner Join regions as R
on C.region_id = R.region_id;


Select * from employees
Order by employee_id;

Select M.employee_id, E.Salary,  concat(M.First_Name, ' ',M.Last_Name) as Employee_Name,
concat(E.First_Name, ' ',E.Last_Name) as ManagerName
From employees as E
Inner Join Employees as M
On M.Manager_id = E.employee_id ;
-- Where concat(E.First_Name, ' ',E.Last_Name) = 'Abhisheak King'
Select M.employee_id, E.Salary,  concat(M.First_Name, ' ',M.Last_Name) as Employee_Name,
concat(E.First_Name, ' ',E.Last_Name) as ManagerName
From employees as M
Inner Join Employees as E
On M.Manager_id = E.employee_id;


Select E1.Employee_id as EmpID,
E1.First_Name as EmployeeName,
E2.First_Name as ManagerName
From Employees as E1
Left Join Employees as E2
on E1.Manager_Id = E2.Employee_id;

-- Orders and returned
Select * from Orders;
Select count(*) as Records from Orders; -- 5000

Select * from Returned;
Select count(*) as Records from Returned; -- 2000

Select O.`Order ID`, O.Customer,O.City, Quantity, Price, State from Orders as O
Inner Join Returned 
on O.`Order ID` = Returned.`Order ID`;

-- Inner Join : 89
-- Left Join :  5000
-- Right Join : 2000
-- Left Join : (It includes Left Table Recording with Matching Records)

Select O.`Order ID`, O.Customer,O.City, Quantity, Price, State from Orders as O
Left Join Returned 
on O.`Order ID` = Returned.`Order ID`;

-- From above Query, Is it possible to find out inner Join result
Select O.`Order ID`, O.Customer,O.City, Quantity, Price, State from Orders as O
Left Join Returned 
on O.`Order ID` = Returned.`Order ID`
Where State is not null;

-- I want to apply Right Join 

Select O.`Order ID`, O.Customer,O.City, Price, State from Orders as O
Right Join Returned 
on O.`Order ID` = Returned.`Order ID`;

-- Can I have Inner Join from Right Join 
Select O.`Order ID`, O.Customer,O.City, Price, State from Orders as O
Right Join Returned 
on O.`Order ID` = Returned.`Order ID`
Where Price is not null;

-- Full Outer Join

Select O.`Order ID`, O.Customer,O.City, Price, State from Orders as O
Left Join Returned 
on O.`Order ID` = Returned.`Order ID`
Union 
Select O.`Order ID`, O.Customer,O.City, Price, State from Orders as O
Right Join Returned 
on O.`Order ID` = Returned.`Order ID`;

-- From above query we found 7000 but in Full Join it shoule be 6911 (4911+1911+89 = 6911)





