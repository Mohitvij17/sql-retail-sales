## sql retail sales analysis p1
-- create database sql_project_p2;
-- use  sql_project_p2;
##create table
-- create table retail_sales     
	--   (      
      --       transactions_id INT primary key,
		--	 sale_date	date,
         --    sale_time	time,
            -- customer_id int ,
            -- gender  varchar(15),
			-- age      int,
	        -- category varchar(15),
           --  quantity	int,
           --  price_per_unit float,
	       --  cogs	float,
           --  total_sale float
    -- );
     -- select* from retail_sales
     -- limit 10
     ## how many sales we have?
     -- Select 
     -- count(*) 
     -- from retail_sales;
      
## DATA CLEANING
-- select *from retail_sales
-- where transactions_id is NULL

-- select *from retail_sales
-- where sale_date is NULL

-- select *from retail_sales
-- where sale_time is NULL

   -- select *from retail_sales
  -- where
     -- transactions_id is NULL
     -- or
      -- sale_date is NULL
     -- or
       -- sale_time is NULL
     -- or
       -- gender is null
    -- or
      --  age is null
     -- or
       -- category is null
     -- or
	  --  quantity is null
     -- or
	  --  price_per_unit is null
     -- or
	   -- cogs is null
     -- or
      -- total_sale is null
       
##DATA exploration
##how many coustmer we have? 
 -- select count(customer_id) from retail_sales     
##how many unique coustmer we have?  
-- select count(DISTINCT customer_id) from retail_sales 
-- select DISTINCT category from retail_sales 
-- select count(DISTINCT category) from retail_sales
##DATA analysis & Bussines key problems & answers
 ## My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17) 

 -- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- select * 
-- from retail_sales
-- where sale_date= '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022
 -- select* 
 -- from retail_sales
 -- where category = 'Clothing'
 -- And quantity >3
 -- And month (sale_date)=11
 -- and year (sale_date) = 2022;
 
 -- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- select 
-- category,
-- sum(total_sale) as total_sale
-- from retail_sales
-- group by
-- category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- select
-- round(avg(age),2 )  as avg_age
-- from retail_sales
-- where category= 'Beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- select
-- transactions_id
-- from retail_sales
-- where total_sale >1000
--         OR
-- select * from retail_sales
-- where total_sale >1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- select 
-- count(transactions_id)
-- from retail_sales
-- group by gender,category
--       or
-- SELECT 
   -- gender,
   -- category,
   -- COUNT(transactions_id) AS total_transactions
-- FROM 
   -- retail_sales
-- GROUP BY 
   -- gender, category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- select
   -- year,
   -- month,
   -- avg_sale
-- from
 -- (select 
--  extract(year from sale_date) as year,
--  extract(month from sale_date) as month,
 -- avg(total_sale) as avg_sale,
 -- rank() over (partition BY extract(year from sale_date) order by avg(total_sale) desc) as rnk
--  from retail_sales
--  group by 1,2) as t1
-- where rnk = 1

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- select
-- customer_id,
-- sum(total_sale)as total_sale
-- from retail_sales
-- group by 1
-- order by 2 desc
-- limit 5

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- select
-- category,
-- count(distinct customer_id) as unique_customer
-- from retail_sales
-- group by category

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17) 
with hourly_sale
as
(
 select *,
   case
      when extract( hour from sale_time) <12 then 'Morning'
      when extract( hour from sale_time)  Between  12 and 17 then 'Afternoon'
      else 'Evening'
   End as shift
    from retail_sales
    )
SELECT shift, COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;
---- End of project -------
