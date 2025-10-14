use [E-commerce]

select * from [dbo].[ecommerce_sales_34500 - Copy]
------------- ORDERS -------------

--- total orders by category ---
select 
  category as 'Category',
  count(order_id) as 'Total orders'
  from [dbo].[ecommerce_sales_34500 - Copy]
group by category;

--- total revenue ---
SELECT 
  category AS 'Category',
  SUM(total_amount) AS 'total amount',
  SUM(shipping_cost) AS 'shipping cost',
  SUM(total_amount) - SUM(shipping_cost) AS 'net amount'
FROM [dbo].[ecommerce_sales_34500 - Copy]
GROUP BY category
order by [net amount];

--- orders in each region ---
select
region as 'region', 
COUNT(order_id)*SUM(quantity)/COUNT(customer_id) as 'orders by region'
FROM [dbo].[ecommerce_sales_34500 - Copy]
group by region

--- avrage delivery days ---
select
region as 'region',
AVG([delivery_time_days]) as 'avrage delivery days'
from [dbo].[ecommerce_sales_34500 - Copy]
group by region

--- most selling category  ---
select
region as 'region',
COUNT(order_id) as'total order'
from [dbo].[ecommerce_sales_34500 - Copy]
group by region

--- most selling category each region ---
SELECT 
 region,
 category AS the_most_selling,
 SUM(quantity) AS total_quantity
  FROM [dbo].[ecommerce_sales_34500 - Copy]
  GROUP BY region, category

  --- total returned ---
  SELECT
  COUNT (returned) as 'returned',
  region as 'region',
  category as 'category'
  FROM [dbo].[ecommerce_sales_34500 - Copy]
  WHERE returned =1
  GROUP BY category,region

------------- CUSTOMERS -------------

--- total customers by category ---
select 
category as 'Category',
count(customer_id) as 'Total customers' 
from [dbo].[ecommerce_sales_34500 - Copy]
group by category

--- total customer by region ---
select 
region as 'Region',
count(customer_id) as 'Total customers' 
from [dbo].[ecommerce_sales_34500 - Copy]
group by region
order by [Total customers]

--- total customer by region ---
select 
customer_gender as 'gender',
COUNT (customer_id) as 'total customers'
from [dbo].[ecommerce_sales_34500 - Copy]
group by customer_gender

--- who returns more? ---
select 
customer_gender as 'gender',
COUNT (customer_id) as 'total customers'
from [dbo].[ecommerce_sales_34500 - Copy]
 WHERE returned =1
group by customer_gender 