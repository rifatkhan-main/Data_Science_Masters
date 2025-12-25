-- Imported SHELTER_DATA (homlessness_shelter_data.csv) using Import Wizard

Select count(*) from SHELTER_DATA;

Select * from SHELTER_DATA;

-- Load Season values
desc SEASON;

Insert into SEASON
(Season_Name)
Select Distinct season from SHELTER_DATA;

Select * from SEASON;

Alter Table SHELTER_DATA
Add Season_ID int;

Update SHELTER_DATA sd, SEASON s
Set sd.Season_ID = s.Season_ID
Where sd.season = s.Season_Name;

Select * from SEASON;

-- Load Shelter_Name values
desc SHELTER_NAME;

Insert into SHELTER_NAME
(Shelter_Name)
Select Distinct shelter_name from SHELTER_DATA;

Select * from SHELTER_NAME;

Alter Table SHELTER_DATA
Add Shelter_Name_ID int;

Update SHELTER_DATA sd, SHELTER_NAME sh
Set sd.Shelter_Name_ID = sh.Shelter_Name_ID
Where sd.shelter_name = sh.Shelter_Name;

Select * from SHELTER_NAME;

-- Load Location values
desc LOCATION;

Select * from LOCATION;

Insert into LOCATION
(City_Name, State_Name)
Select Distinct city, state from SHELTER_DATA;

Select * from LOCATION;

Alter Table SHELTER_DATA
Add Loc_ID int;

Update SHELTER_DATA sd, LOCATION l
Set sd.Loc_ID = l.Loc_ID
Where sd.city = l.City_Name;

Select * from SHELTER_DATA;

-- Load Date Values 
Alter Table DATE
Rename to DATE_DIM;

desc DATE_DIM;

Select * from DATE_DIM;

INSERT INTO DATE_DIM
    (Date, year, month, day, Day_of_Week, Day_Name, Month_Name, Weekend)
SELECT DISTINCT
    date,
    YEAR(date),
    MONTH(date),
    DAY(date),
    DAYOFWEEK(date),
    DAYNAME(date),
    MONTHNAME(date),
    CASE 
        WHEN DAYOFWEEK(date) IN (1, 7) THEN 1
        ELSE 0
    END AS Weekend
FROM SHELTER_DATA
WHERE date IS NOT NULL;

Select * from DATE_DIM; 

-- Load SHELTER table values 
DESC SHELTER;

Select Date, 
Shelter_Name_ID, 
Season_ID, 
Loc_ID, 
Total_Capacity, 
Occupied_Beds, 
Available_Beds,
Occupancy_Rate,
male_percentage,
Female_Percentage,
Average_Age
from SHELTER_DATA;


Insert into SHELTER
(Date,
Shelter_Name_ID, 
Season_ID, 
Loc_ID, 
Total_Capacity, 
Occupied_Beds, 
Available_Beds,
Occupancy_Rate,
Male_percentage,
Female_Percentage,
Average_Age)
Select Date, Shelter_Name_ID, Season_ID,Loc_ID, 
Total_Capacity, Occupied_Beds,Available_Beds,
Occupancy_Rate, male_percentage, Female_Percentage,
Average_Age
from SHELTER_DATA;

Select * from SHELTER;

Alter Table SHELTER
Rename column male_percentage 
to Male_Percentage;
