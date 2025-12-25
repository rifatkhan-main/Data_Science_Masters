DESC SHELTER_DATA;

Create view vw_ALL -- Do this at end after selecting and joining 
as
Select d.Date as Date,
se.Season_Name as Season_Name,
sn.Shelter_Name as Shelter_name,
l.City_Name as City,
l.State_Name as State,
s.Total_Capacity as Total_Capacity,
s.Occupied_Beds as Occupied_Beds, 
s.Available_Beds as Available_Beds,
s.Occupancy_Rate as Occupancy_Rate,
s.male_percentage as Male_percentage,
s.Female_Percentage as Female_percentage,
s.Average_Age
from SHELTER s
inner join DATE_DIM d on
	s.Date = d.Date 
Inner JOIN SEASON se on 
	s.Season_ID = se.Season_ID
Inner JOIN SHELTER_NAME sn on 
	s.Shelter_Name_ID = sn.Shelter_Name_ID
Inner JOIN LOCATION l on 
	s.Loc_ID = l.Loc_ID;
    