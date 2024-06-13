create table online_sales(
	"Transaction ID" int,
	"Date" Date,
	"Product Category" character varying,
	"Product Name" character varying,
	"Units Sold" int,
	"Unit Price" numeric,
	"Total Revenue" numeric,
	Region character varying,
	"Payment Method" character varying
);

select * from online_sales;

-- Business Questions
-- 1. What is the total revenue generated in each region?
select region, sum("Total Revenue") as total_revenue 
from online_sales
group by region
order by total_revenue

--2. Which products categories are generating the highest revenue?
select 
	"Product Category" as category, 
	sum("Total Revenue") as total_revenue
from 
	online_sales
group by 
	category
order by 
	total_revenue desc

--3. What is the total number of units sold for each product?
select 
	"Product Name" as products, 
		sum("Units Sold") as quantity
from 
	online_sales
group by 
	product
order by 
	quantity desc

-- 4. Which payment method is more frequently used?
select 
	"Payment Method", 
		count("Payment Method") as total_used
from 
	online_sales
group by 
	"Payment Method"
order by 
	total_used desc

-- 5. How do sales vary by day of the week?
select 
	TO_CHAR("Date"::DATE, 'Day') as "Day of the week",
	sum("Total Revenue") as "Total Revenue",
	sum("Units Sold") as "Units Sold",
	count("Transaction ID") as "Number of Transactions"
from 
	online_sales
group by 
	TO_CHAR("Date"::DATE, 'Day')
order by 
	"Total Revenue" desc;
	
-- 6. What is the average order value for transactions in each region?
select
	region,
	avg("Total Revenue") as average_revenue
from 
	online_sales
group by 
	region
order by 
	average_revenue desc

--7. Which product has the highest sales volume in terms of units sold?
select
	"Product Name",
	sum("Units Sold") as quantity_sold
from
	online_sales
group by
	"Product Name"
order by
	quantity_sold desc
	
--8. What is the average unit price for each product category?
select
	"Product Category",
	avg("Unit Price") as average_price_per_unit
from
	online_sales
group by
	"Product Category"
order by
	average_price_per_unit desc
	
--9. How does the revenue distribution look across different product categories?
select 
	"Product Category" as category, 
	sum("Total Revenue") as total_revenue
from 
	online_sales
group by 
	category
order by 
	total_revenue
	
--10. How do monthly sales trends look over the past year?
select
	to_char("Date"::DATE, 'Month') as "Month of the year",
	sum("Total Revenue") as "Total Revenue"
from
	online_sales
group by
	"Month of the year"

-- 11. Are there any seasonal patterns in sales for specific product categories
select
	"Product Category",
	to_char("Date", 'Month') as Month,
	Sum("Units Sold") as TotalUnitsSold
from
	online_sales
group by
	"Product Category",
	Month
order by
	"Product Category",
	Month
	
-- 12. Which Region has the highest average unit price for products sold?
select
	region,
	avg("Total Revenue") as "Average Revenue"
from
	online_sales
group by
	region
order by
	"Average Revenue" desc
	
--13. What is the total revenue geenrated by each payment method in each region?
select
	region,
	"Payment Method",
	sum("Total Revenue") as "Total Revenue"
from
	online_sales
group by
	region,
	"Payment Method"
