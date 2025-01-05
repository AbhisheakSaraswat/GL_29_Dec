Select * from employees;
select * from regions;
select * from departments;
select * from  countries;
select * from  job_history;
select * from   jobs;
select * from  locations;

Select * from employees;

Select First_Name, Last_Name, email, salary, manager_id, department_id
from Employees;

Select * from superstore;

-- How to find out Region wise Sales
-- SQL Aggregated Function
/* SUM, MAX, MIN, AVG, COUNT */

SELECT sum(sales) as totalSales from Superstore;
SELECT round(sum(sales),2) as totalSales from Superstore;

Select Max(Sales) as MaxSales from Superstore;

Select ROUND(SUM(sales),2) as TotalSales,
Max(Sales) as MaxSales,
Min(Sales) as MinSales,
round(Avg(Sales),2) as AvgSales,
Count(*) as TotalTransaction
From Superstore;

-- Region Wise Sales
Select Region, ROUND(Sum(Sales),2) as TotalSales
From Superstore
Group By Region;

-- Region and Categories Wise 

Select Region, Category, ROUND(Sum(Sales),2) as TotalSales
From Superstore
Group By Region,Category;

Select Region, Category, Segment,ROUND(Sum(Sales),2) as TotalSales
From Superstore
Group By Region,Category,Segment;

Select Region, Category, Segment,ROUND(Sum(Sales),2) as TotalSales
From Superstore
Where Segment = 'Corporate'
Group By Category,Segment,Region;

-- From above I want all the records where TotalSales 60K
-- Having Clause
/*
If we want to filter the aggregated result then we can utilize having clause.
*/

Select Region, Category, Segment,ROUND(Sum(Sales),2) as TotalSales
From Superstore
Where Segment = 'Corporate'
Group By Category,Segment,Region
Having TotalSales > 60000 -- MS SQL (this query will not work:to resolve this follow the below query)
Order by TotalSales;


Select Region, Category, Segment,ROUND(Sum(Sales),2) as TotalSales
From Superstore
Where Segment = 'Corporate'
Group By Category,Segment,Region
Having  Sum(Sales) > 60000
Order by TotalSales;

Select Region, category, Sales, subcategory from
superstore
having sales  between 5000 and 10000
and category = 'Technology'
and Region = 'East';


Select Region, Category, Segment,ROUND(Sum(Sales),2) as TotalSales
From Superstore
Where Totalsales > 60000 -- Invalid Query
Group By Category,Segment,Region
Order by TotalSales;

-- Now tell me How to filter totalsales with the help of where clause only.
Select * From 
(
Select Region, Category, Segment,ROUND(Sum(Sales),2) as TotalSales
From Superstore
Where Segment = 'Corporate'
Group By Category,Segment,Region
Order by TotalSales
) as Temp
Where TotalSales > 60000;

SELECT 
    Region,
    Category,
    SubCategory,
    COUNT(*) AS totalRecs,
    SUM(Quantity) AS TotalOrder,
    ROUND(SUM(sales), 0) AS TotalSales,
    ROUND(AVG(sales), 0) AS AvgSales,
    ROUND(SUM(profit), 0) AS TotalProfit
FROM
    superstore
GROUP BY region , category , subcategory
HAVING totalorder > 100
ORDER BY totalorder , totalsales;

-- Store the result into table
Create Table Superstore_Summary
(
SELECT 
    Region,
    Category,
    SubCategory,
    COUNT(*) AS totalRecs,
    SUM(Quantity) AS TotalOrder,
    ROUND(SUM(sales), 0) AS TotalSales,
    ROUND(AVG(sales), 0) AS AvgSales,
    ROUND(SUM(profit), 0) AS TotalProfit
FROM
    superstore
GROUP BY region , category , subcategory
HAVING totalorder > 100
ORDER BY totalorder , totalsales
);

Select * from  Superstore_Summary;

Select count(Distinct Subcategory) as cnt from superstore;


Select * from EmployeeDb;

Select count(*) as TotalRec from EmployeeDb;
Select count(deptId) as cnt from EmployeeDb;
update employeedb set sales = null where empid = 3727
set sql_safe_updates = 0;


Select count(sales) as cnt from Employeedb

update employeedb set sales = 3727 where sales is null

-- UnSigned : (Positive Value  and 0)
-- Signed : (Negative, Positive and 0)

/* Unique : Every value should be distinct,
we can have as many unique key per table.
*/

Create Table RamKrishna
(
Email varchar(100) Unique

)

Insert  into RamKrishna(Email)
values ('ram.krishna@gmail.com'),
(Null)

Insert  into RamKrishna(Email)
values 
(Null),(null),(null)


Select * from RamKrishna

-- Cast

Select cast('2025-01-05' as Date) as convertedDate
Select cast(456.67 as char) as Result

Select cast(453.45 as unsigned) as WholeNumber

-- Date and Time
Select Curdate() as currentDate;
Select curtime() as currentTime;
Select now() as CurrentDateTime;

Select now() as Result
Union All
Select Date_format(now(), '%Y-%m-%d %H-%i-%s')
Union all
Select Date_format(now(), '%Y-%M-%D %H-%i-%s')
Union all
Select Date_format(now(), '%y-%m-%d %H-%i-%s')
Union all
Select Date_format(now(), '%a %d %M %Y');

-- For Date and time
-- https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html

Select Quarter(now()) as Result;

Select Date_Add(now(), interval 10 day) as Result;


Select Date_Add(now(), interval -10 day) as Result;

Select Date_Add(now(), interval -10 month) as Result;

Select Date_Add(now(), interval -10 year) as Result;

Select Date_Add(now(), interval -10 quarter) as Result;


Select Year(curdate()) as CurrentYear;
Select month(now()) as CurrentMonth;
Select quarter(now()) as CurrentQtr;
Select day(now()) as CurrentDay;


Select str_to_date('June 8, 2024', '%M %d, %Y') as Result;

Select date_format(str_to_date('June 8, 2024', '%M %d, %Y'), '%y/%M/%d') as Result;

Select * from Superstore Limit 5;

Select year(order_date) as Order_Year,
Round(sum(sales),2) as TotalSales,
Sum(quantity) as TotalQty from Superstore
Where order_date is not null
group by Order_Year
Order by Order_Year Desc;

Select distinct date_format(Order_date,'%Y') as YearNumber
from superstore
order by YearNumber;

Alter Table Superstore Modify Column ShipDate Date;


Select 1 as Result
Union 
Select 2
Union 
Select 5
Union 
Select 2
Union 
Select 1
Union 
Select 4;


Select 1 as Result
Union All
Select 2
Union All
Select 5
Union All
Select 2
Union All
Select 1
Union All
Select 4;

-- COALESCE
/*
Using this function we can find out first non-null value from the column
*/

Select coalesce(Null, 'Rama', 'Krishna') as Result;

Create Table CoalesceTable
(
	Id int,
    empName varchar(20),
    email varchar(50) unique,
    city varchar(20)
);

Insert into CoalesceTable(id,empname,email,city)
values (1,'Rama','rama@info.in',null),
(2, 'Ayush',null,'goa'),
(3, 'Abhisheak', null,null);

Select * from CoalesceTable;

Select empName, coalesce(email,city,'not_found') as Contact_Information
From CoalesceTable;

-- SQL Strings | IF | CaseStatement

-- -------------------------------------------------------- IN CLASS SOLUTION ----------------------
-- --------------------------------------------------------
# Datasets Used: cricket_1.csv, cricket_2.csv
-- cricket_1 is the table for cricket test match 1.
-- cricket_2 is the table for cricket test match 2.
-- --------------------------------------------------------

# Q1. Find all the unique players in both cricket 1 and 2 tables

Select * from cricket_1
union
Select * from cricket_2;
 
# Q2. Write a query to extract the player details player_id, runs and player_name from the table “cricket_1” who
#  scored runs more than 50

Select player_id, runs, player_name from cricket_1 where runs > 50;



# Q3. Write a query to extract all the columns from cricket_1 where player_name starts with ‘y’ and ends with ‘v’.
Select * from cricket_1 where Player_Name like '%y%v' ;
-- --------------------------------------------------------
# Dataset Used: cric_combined.csv 
-- --------------------------------------------------------

# Q5. Write a MySQL query to add a column PC_Ratio to the table that contains the divsion ratio 
# of popularity to charisma .(Hint :- Popularity divide by Charisma)
Select * from cric_combined;
Alter Table cric_combined
add column pc_ration float4;

update cric_combined set pc_ration = popularity / charisma;

# Q6. Write a MySQL query to find the top 5 players having the highest popularity to charisma ratio.
-- try own


# Q8. Extract Player_Id  and PC_Ratio where the PC_Ratio is between 0.12 and 0.25.
Select * from cric_combined where pc_ration between 0.12 and 0.25;
-- --------------------------------------------------------
# Dataset Used: new_cricket.csv
-- --------------------------------------------------------
# Q10. Write a MySQL query to display all the NULL values  in the column Charisma imputed with 0.
Select * from new_cricket;

Select ifnull(charisma,0) from new_cricket;
-- --------------------------------------------------------
# Dataset Used: churn1.csv 
-- --------------------------------------------------------
# Q18. Write a query to extract the customerID, InternetConnection and gender 
# from the table “churn1” where the value of the column “InternetConnection” has ‘i’ 
# at the second position.
-- try own


# Q19. Find the records where the tenure is 6x, where x is any number.

Select * from churn1 where tenure like '6_';

# Q20. Write a query to display the player names in capital letter and arrange in alphabatical 
-- order along with the charisma, display 0 for whom the charisma value is NULL.
Select upper(player_name), coalesce(charisma,0) from new_cricket
order by player_name;

-- ------------------------------- PART - II ---------------------
# Pre-Requisites:
# Step 1 : Create table as below.
/*Product string size 15 ,
Quantity integer ,
Price real,
purchase_cost decimal with size 6,2,
Estimated_sale_price float,
Month integer*/

create Table Bank_Inventory_pricing
(
Product varchar(15),
Quantity int,
Price real,
purchase_cost decimal(6,2),
Estimated_sale_price float,
Month integer
);



# Step2: 
# Insert records for above 
Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 300.45, 8000.87, 9000.56, 1 ) ;
Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 800.45, 5000.80, 8700.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 500.45, 6000.47, 7400.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayPoints' , 4 , 390.87, 7000.67, 6700.56, 2)  ;
 Insert into Bank_Inventory_pricing values ( 'SmartPay' , 5  , 290.69, 5600.77, 3200.12 , 1)  ;
 Insert into Bank_Inventory_pricing values ( 'MaxGain',    3 , NULL, 4600.67, 3233.11 , 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'MaxGain',    6 , 220.39, 4690.67, NULL , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 7 , 290.30, NULL, 3200.13 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , 560.30, NULL, 4200.13 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , NULL, 2600.77, 3200.13 ,2 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 9 , NULL, 5400.71, 9200.13 ,3 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, 5900.97, NULL ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, 5900.97, 8999.34 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, NULL , 5610.82 , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 , 3 ) ;
 Insert into Bank_Inventory_pricing values ( "BusiCard"  ,  1, 3000.99 , NULL, 3500, 3) ; 
 Insert into Bank_Inventory_pricing values ( "BusiCard"  ,  1, 4000.99 , NULL, 3500, 2) ; 

# Create table
Create table Bank_branch_PL
(Branch   varchar(15),
  Banker   Int,
  Product varchar(15) ,
  Cost  Int,
  revenue Int,
  Estimated_profit Int,   
  month  Int);
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SuperSave', 30060070, 50060070,  20050070, 1 ) ;
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SmartSav',   45060070, 57060070, 30050070, 2) ;
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'EasyCash',   66660070, 50090090, 10050077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 99101, 'SmartSav',   66660070, 79090090, 10050077, 3) ;
Insert into Bank_branch_PL values ( 'Banglr', 77301, 'EasyCash',   55560070, 61090090, 9950077, 3) ;
Insert into Bank_branch_PL values ( 'Banglr', 77301, 'SmartSav',   54460090, 53090080, 19950077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 77301, 'SmartSav',   53060090, 63090080, 29950077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard',  	40030070, 60070080, 10050070,1) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard',  	70030070, 60070080, 25060070,1) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'SmartSav', 	40054070, 60070080, 20050070, 2) ;
Insert into Bank_branch_PL values ( 'Banglr', 99101, 'SmartSav',   88660070, 79090090, 10050077, 3) ;


############################################ Questions ############################################
# Question 1:
# 1) Print sum of Purchase_cost and average of estimated_sale_price of table
# Bank_inventory_pricing  during 2nd month . 

Select * from Bank_Inventory_Pricing;

Select sum(Purchase_cost) as TotalPurchaseCost, avg(estimated_sale_price) as AvgPrice
From Bank_Inventory_Pricing
where Month = 2;

# Question 2:
# 2) Print average of estimated_sale_price upto two decimals from bank_inventory_pricing table.
Select round(avg(estimated_sale_price),2) as Result from Bank_Inventory_Pricing;


# Question 3:
# 3) Print the Products which are appearing in bank_inventory_pricing more 
# than once during the month : 1
Select product, count(product) as result from bank_inventory_pricing
where month = 1
group by product
having count(product) > 1;


# Question 4:
# 4) Print Products that are appearing more than once in bank_inventory_pricing and whose purchase_cost is
# greater than  estimated_sale_price , assuming estimated_sale_price is 0 when there is no value given

Select product, count(product) as Result
from bank_inventory_pricing
where purchase_cost > ifnull(estimated_sale_price,0)
group by product
having count(product) > 1;



# Question 5:
# 5) Print the sum of  purchase_cost of Bank_Inventory_pricing table with default value of 2000/-
# if there is no value given

select sum(ifnull(purchase_cost,2000))  as totalcost from Bank_Inventory_pricing;

# Question 7:
# 7) print the average of Purchase_cost from the table Bank_inventory_pricing.If the purchase_cost has  no value given
#   then it’s value is equal to estimated_sale_price.

select avg(coalesce(purchase_cost, estimated_sale_price)) as AvgCost from Bank_Inventory_pricing;

select avg(ifnull(purchase_cost, estimated_sale_price)) as AvgCost from Bank_Inventory_pricing;

# Question 8:
# 8) Print the count of unique Products used in  Bank_inventory_pricing
select count(distinct product) from Bank_Inventory_pricing;

# Question 9:
# 9) Print product and the difference of maximum and minimum purchase_cost of each product in Bank_Inventory_Pricing.
select product, max(purchase_cost) - min(purchase_cost) as diff
from Bank_Inventory_pricing
group by product;

# Question 12:
# 12) Print  products whose average of purchase_cost is less than sum of purchase_cost of  Bank_inventory_pricing.
Select product, avg(purchase_cost) , sum(purchase_cost)
from Bank_Inventory_pricing
group by product
having avg(purchase_cost) < sum(purchase_cost);


# Question 14:
# 14) Display maximum estimated_sale_price of each product  when the product total quantity is exceeding 4 
# and its purchase_cost has some value given.

Select product, max(estimated_sale_price), sum(quantity) as qty from Bank_Inventory_pricing
where purchase_cost is not null
group by product
having sum(quantity) > 4
order by qty;

# Question 16:
# 16) Print each Product with its highest estimated_sale_price in bank_inventory_pricing

Select product, max(estimated_sale_price) as maxPrice from Bank_Inventory_pricing
group by product;

# Question 17:
# 17) Print product with an increase in  average of estimated_sale_price  by 15% when average product_cost is more than average 
# estimated_sale_price

Select product, avg(estimated_sale_price) as orignal_avg_estimated_sale_price,
avg(estimated_sale_price) * 1.15 as new_avg_estimated_sale_price
from Bank_Inventory_pricing
group by product
having avg(purchase_cost) > avg(estimated_sale_price);


# Question 18:
# 18) For product = ‘BusiCard’,  print average of purchase_cost on condition that when purchase_cost  
# is not given, choose any of the higher value between price  and estimated_sale_price

Select product, avg(ifnull(purchase_cost, greatest(price, estimated_sale_price))) from Bank_Inventory_pricing
where product = 'BusiCard'
group by product;



# Question 19:
# 19) Calculate average estimated_sale_price for each product .
# For any null estimated_sale_price, replace the value with purchase_cost

select product, round(avg(ifnull(estimated_sale_price, purchase_cost)),2) as avgcost
from Bank_Inventory_pricing
group by product;


# Question 20:
# 20) Print products and their avg price on condition that products appeared in at least three different months.

select product, avg(price), count(distinct month)
from Bank_Inventory_pricing
group by product
having count(distinct month)>2






