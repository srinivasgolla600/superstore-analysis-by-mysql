SELECT * FROM superstore_sales.superstore;
/*
1. What are total sales and total profits of each year?*/ 
select round(sum(sales),4) as sales ,year(order_date) as year from store group by year(order_date) ;
select round(sum(profit),4) as profit ,year(order_date) as year from store group by year(order_date);

/*2. What are the total profits and total sales per quarter?*/ 
select round(sum(sales),2)as sales,round(sum(profit),2)as profit ,quarter(order_date) as quater,year(Order_Date) as year from store group by quater,year;
select round(sum(profit),2)as profit ,quarter(order_date) as quater,year(Order_Date) as year from store group by quater,year;

/*3. What region generates the highest sales and profits ?*/ 
select  round(sum(sales),4) as sales,round(sum(profit),4)as profit,region from store group by region order by sales;
select  round(sum(profit),4)as profit,region from store group by region order by sales;

/*4. What state and city brings in the highest sales and profits ?*/ 
select  round(sum(sales),2)as sales,round(sum(profit),2)as profit ,city,state from store group by city,state order by sales desc limit 5;
select  round(sum(profit),2)as profit ,city,state from store group by city,state order by profit desc limit 5;
/*5. The relationship between discount and sales and the total discount per category?*/ 
select round(avg(sales),2) as average_sales,discount from store group by discount order by average_sales desc;
select round(sum(discount),2)as total_discount ,category from store group by category order by total_discount desc ;
select round(sum(discount),2)as total_discount ,category  from store group by category order by total_discount desc ;
/*6. What category generates the highest sales and profits in each region and state ?*/ 
select round(sum(sales),2) as total_sales,category,region,state from store group by category,region ,state order by total_sales desc limit 5  ;
select round(sum(profit),2) as total_profit,category,region,state from store group by category,region ,state order by total_profit desc limit 5 ;
/*7. What subcategory generates the highest sales and profits in each region and state ?*/ 
select round(sum(sales),2) as total_sales,Sub_Category,region,state from store group by sub_category,region ,state order by total_sales desc ;
select round(sum(profit),2) as total_profit,Sub_Category,region,state from store group by sub_category,region ,state order by total_profit desc ;
/*8. What are the names of the products that are the most and least profitable to us?*/ 
select product_name ,profit from store where profit =(select max(profit) from store);
select product_name ,profit from store where profit =(select min(profit) from store);
/*9. What segment makes the most of our profits and sales ?*/ 
select segment ,sum(sales) as total_sales from store group by segment order by total_sales desc;
select segment ,sum(profit) as total_profit from store group by segment order by total_profit desc;

/*10. How many customers do we have (unique customer IDs) in total and how much per region and state?*/ 

select count(distinct customer_id) as total_customers from store;
select count(distinct customer_id) as total_customers ,region,state from store group by region,state order by total_customers desc;
/*11. Customer rewards program/top 10 customers that spend most?*/ 
select customer_id,sum(SALES) as total_sales,sum(profit) as total_profit from store group by customer_id order by total_sales desc limit 10;
/*12. Average shipping time per class and in total*/ 
  
select (ship_date-order_date),ship_mode from store;
select   ship_mode ,count(ship_mode) from store group by ship_mode;
select Ship_Mode,avg(ship_date-order_date) as average_time ,count(ship_mode) as count from store group by ship_mode order by average_time;

select * from store limit 5; 

select disctinct year(order_date) from store;

/*select round(sum(sales),4),year(order_date) as year from store group by year(order_date);

select  round(sum(sales),4) as sales,round(sum(profit),4)as profit,region from store group by region order by sales;

select round(sum(sales),2)as sales,round(sum(profit),2)as profit ,quarter(order_date) as quater,year(Order_Date) as year from store group by quater,year;
select  round(sum(sales),2)as sales,city,state from store group by city,state order by sales desc;
select  round(sum(profit),2)as profit ,city,state from store group by city,state order by profit desc;

select round(avg(sales),2) as average_sales,discount from store group by discount order by average_sales desc;
select round(sum(discount),2)as total_discount ,category from store group by category order by total_discount desc ;
select round(sum(discount),2)as total_discount ,category  from store group by category order by total_discount desc ;

select round(sum(sales),2) as total_sales,category,region,state from store group by category,region ,state order by total_sales desc ;
select round(sum(profit),2) as total_profit,category,region,state from store group by category,region ,state order by total_profit desc ;
select round(sum(sales),2) as total_sales,round(sum(profit),2) as total_profit,region,state from store group by region ,state order by total_sales desc ;


select round(sum(sales),2) as total_sales,Sub_Category,region,state from store group by sub_category,region ,state order by total_sales desc ;
select round(sum(profit),2) as total_profit,Sub_Category,region,state from store group by sub_category,region ,state order by total_profit desc ;

select * from store ;
select product_name ,profit from store where profit =(select max(profit) from store);
select product_name ,profit from store where profit =(select min(profit) from store);


select segment ,sum(sales) as total_sales from store group by segment order by total_sales desc;
select segment ,sum(profit) as total_profit from store group by segment order by total_profit desc; 

select count(distinct customer_id) as total_customers from store;
select count(distinct customer_id) as total_customers ,region,state from store group by region,state order by total_customers desc;



select customer_id,sum(SALES) as total_sales,sum(profit) as total_profit from store group by customer_id order by total_sales desc limit 10;

select (ship_date-order_date),ship_mode from store;
select   ship_mode ,count(ship_mode) from store group by ship_mode;
select Ship_Mode,avg(ship_date-order_date) as average_time ,count(ship_mode) as count from store group by ship_mode order by average_time;*/


