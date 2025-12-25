CREATE TABLE SHELTER_NAME
(
Shelter_Name_ID int auto_increment,
Shelter_Name varchar(50),
Created_Date Datetime Default now(),
Modified_Date Datetime Default now(),
CONSTRAINT PK_SHELTER_NAME PRIMARY KEY(Shelter_Name_ID)
); 

Desc SHELTER_NAME ;

Create Table SEASON
(
Season_ID int auto_increment,
Season_Name varchar(50),
Constraint PK_SEASON PRIMARY KEY (Season_ID)
);

Desc SEASON;

Create Table LOCATION
(
Loc_ID int auto_increment,
City_Name varchar(50),
State_Name varchar(50),
Created_Date Datetime Default now(),
Modified_Date Datetime Default now(),
Constraint PK_LOCAITON PRIMARY KEY (Loc_ID)
);

Desc LOCATION;

Create table DATE
(
Date date Default now(),
Year Int Not Null,
Month int Not NUll,
Day int not null,
Day_of_Week int,
Day_Name varchar(50),
Month_Name varchar(50),
Weekend Bit,
Constraint PK_DATE Primary Key (Date)
);

Desc DATE;

Create table SHELTER
(
Shelter_ID int auto_increment,
Date date,
Shelter_Name_ID int,
Season_ID int,
Loc_ID int,
Total_Capacity INT,
Occupied_Beds INT,
Available_Beds int,
Occupancy_Rate int,
Male_Percantage int,
Female_Percantage int,
Average_Age int,
Constraint pk_SHELTER PRIMARY KEY (Shelter_ID)
);

Alter Table SHELTER
Add Constraint FK_SHELTER_NAME_ID Foreign Key(Shelter_Name_ID) 
References SHELTER_NAME(Shelter_Name_ID);

Alter Table SHELTER
Add Constraint FK_Date_ID Foreign Key(Date) 
References DATE(Date);

Alter Table SHELTER
Add Constraint FK_LOC_ID Foreign Key(Loc_ID) 
References LOCATION(Loc_ID);

Alter Table SHELTER
Add Constraint FK_SEASON_ID Foreign Key(Season_ID) 
References SEASON(Season_ID);

desc SHELTER;
