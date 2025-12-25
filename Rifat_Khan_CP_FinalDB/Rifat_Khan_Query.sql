Select * from vw_All;

Select distinct Season_Name, round(avg(occupied_beds),2) as Avg_Beds_Taken
from vw_ALL
group by Season_Name; 
-- Query determining average beds taken by season Winter Appears to be the highest followed by 
-- Autumn, Summer and then Spring  

Select distinct City, round(avg(total_capacity),2) as Avg_Total_Cap
from vw_ALL
group by City
order by Avg_Total_Cap desc; 
-- Query determining average Total Capacity by City, with Chicago having the highest average total cap
-- and New York having the lowest Average Total Capacity 

Select distinct Shelter_name, round(avg(available_beds),2) as Avg_Availability 
from vw_ALL
group by Shelter_name
order by Avg_Availability desc; 
-- Query determining average Total Availability by Shelter Name, with Harbor Home having the largest average 
-- Availability and New Beginnings Shelter having the lowest Availability

Select distinct State, round(avg(total_capacity),2) as Avg_Total_Cap
from vw_ALL
group by State
order by Avg_Total_Cap desc; 
-- Query determining average Total Capacity by State, with Illinois (IL) having the highest average total cap
-- and New York state (NY) having the lowest Average Total Capacity 

Select distinct DAYNAME(Date) as day_name, round(avg(occupied_beds),2) as Avg_Beds_Taken
from vw_ALL
group by day_name
order by Avg_Beds_Taken desc;
-- Query determining average beds taken by Day name of week, with Sunday being the highest average 
-- and Wendsday having the lowest average