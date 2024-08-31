select * from pizza_sales

--TotaL Revenue
select SUM(total_price) as TOTAL_Revenue from pizza_sales
--AVERAGE ORDER VALUE
SELECT SUM(total_price)/COUNT(distinct order_id) as AvgOrderValue from pizza_sales
--Avg order value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS average_order_value
FROM pizza_sales;
--total pizza sold
select SUM(quantity) as Total_pizza_sold from pizza_sales

--Total orders
select count (distinct order_id) as total_orders from pizza_sales
--Average Pizza per order
select cast(cast(sum(quantity) as decimal(10,2))/
cast(count(distinct order_id)as decimal(10,2) ) as decimal(10,2)) as AvgPizzaPerOrder from pizza_sales

--Daily Trends for Total orders
select datename(DW,order_date) as order_day,count(distinct order_id) 
as DailyTrendforTotOrder from pizza_sales 
group by  datename(DW,order_date) 

--Monthly Trends for Total orders
select DATENAME(MONTH,order_date) as Months,count(distinct order_id) 
as monthlyTrendforTotOrder from pizza_sales
group by DATENAME(MONTH,order_date) order by count(distinct order_id)  desc

--Hourly Trends for Total orders
SELECT datepart(HOUR ,order_time) AS hour,
COUNT(distinct order_id) AS total_orders
FROM  pizza_sales GROUP BY hour
ORDER BY hour desc;
--ercentage of sales by pizza category
 select 
 pizza_category, sum(total_price)*100 / (
 select sum(total_price) from pizza_sales)
 as perofsales from pizza_sales 
 where month(order_date)=1
 group by pizza_category

--	Percentage of sales by pizza size
select pizza_size,sum(total_price) as Totalsales,cast(sum(total_price) *100 /
( select sum(total_price)from pizza_sales) as decimal(10,2))
as Per_of_sales_by_pizza_size
from pizza_sales group by pizza_size

--	Top 5 sellers by total revenue ,total quantity and total orders 
select Top 5 pizza_name, 
sum(total_price) as total_revenue,
sum(quantity) as total_quantity,
count(distinct order_id) as totalorders
from pizza_sales group by pizza_name 
order by  total_revenue desc,
total_quantity desc,
totalorders desc 

--	bottom 5 sellers by total revenue ,total quantity and total orders 
select Top 5 pizza_name, 
sum(total_price) as total_revenue,
sum(quantity) as total_quantity,
count(distinct order_id) as totalorders
from pizza_sales group by pizza_name 
order by  total_revenue ,
total_quantity ,
totalorders 