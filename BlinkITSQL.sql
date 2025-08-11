use blinkitdb
/*update blinkit_data
set Item_Fat_Content = 
case
when Item_Fat_Content in ('LF','low fat') then 'Low Fat'
when Item_Fat_Content = 'reg'  then 'Regular'
ELSE Item_Fat_Content
END
*/

/*SELECT  cast(SUM(Sales)/1000000 as decimal(10,2))  as [Total Sales] FROM blinkit_data
where Item_Fat_Content = 'Low Fat'
select cast(avg(Sales) as decimal(10,2))as Avg_Sales from blinkit_data

*/

/*
select Item_Fat_Content,cast(SUM(sales) as decimal(10,1)) as [Sales by fat content],
		cast(avg(Sales) as decimal(10,2)) as Avg_Sales,
		count(*) as Total_Item,
		cast(avg(rating) as decimal(10,2)) as Avg_Rating
from blinkit_data
group by Item_Fat_Content
*/

/*select  Item_Type,cast(sum(Sales) as decimal(10,2)) as [Sales by item type] 
from blinkit_data
group by Item_Type
order by sum(Sales) desc
*/

/*
select  Outlet_Location_Type,Item_Fat_Content,cast(sum(Sales) as decimal(10,2)) as [Sales by fat content]
		from blinkit_data
group by Outlet_Location_Type,Item_Fat_Content
order by Item_Fat_Content,Outlet_Location_Type
*/

/*
select Outlet_Location_Type,[Low Fat],[Regular] from 
(select Outlet_Location_Type,Item_Fat_Content,cast(sum(Sales) as decimal(10,2)) AS [Sales by fat content]
from blinkit_data
GROUP BY Outlet_Location_Type,Item_Fat_Content) as sourcetable
PIVOT

(  SUM([Sales by fat content])FOR Item_Fat_Content in ([Low Fat],[Regular])
) as PIVOTTABLES
*/

/*
select Outlet_Establishment_Year,cast(SUM(Sales) as decimal(10,2)) as [Total Sales] from blinkit_data
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year 
*/

select Outlet_Location_Type ,sum(Sales),ROUND(sum(sales)*100/ (select sum(sales) from blinkit_data),2) as asdf
from blinkit_data
group by Outlet_Location_Type

SELECT 
    Outlet_Size,
    SUM(sales) AS year_sales,
    ROUND(SUM(sales) * 100.0 / (SELECT SUM(sales) FROM blinkit_data), 2) AS sales_percentage
FROM 
    blinkit_data
GROUP BY 
    Outlet_Size;

