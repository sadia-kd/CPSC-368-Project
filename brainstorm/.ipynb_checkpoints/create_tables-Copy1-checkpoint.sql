CREATE TABLE Country (
    Name CHAR(20),
    Geographic_Location CHAR (20),
    PRIMARY KEY (Name, Geographic_Location)
);

CREATE TABLE Climate_Metrics(
    Country_Name CHAR(20),
    Year_Recorded INT, 
    Temperature FLOAT,
    Humidity FLOAT, 
    Wind_Speed FLOAT, 
    Precipitation FLOAT, 
    CO2_Emissions FLOAT, 
    Sea_Level_Rise FLOAT
    PRIMARY KEY (Country_Name, Year_Recorded)
);

CREATE TABLE Natural_Disaster(
    Disaster_Year INT, 
    Type CHAR(20), 
    Country_Name CHAR(20), 
    Year_Recorded INT,
    PRIMARY KEY (Disaster_Year, Type)
    FOREIGN KEY (Country_Name, Year_Recorded) REFERENCES Climate_Metrics(Country_Name, Year_Recorded)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Disaster_In_Country(
    Name CHAR(20), 
    Geographic_Location CHAR(20), 
    Disaster_Year INT, 
    Type CHAR(20), 
    PRIMARY KEY (Name, Geographic_Location, Disaster_Year, Type)
    FOREIGN KEY (Name, Geographic_Location) REFERENCES Country(Name, Geographic_Location)
        ON DELETE CASCADE
        ON UPDATE CASCADE
    FOREIGN KEY (Disaster_Year, Type) REFERENCES Natural_Disaster(Disaster_Year, Type)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Damages(
    Country_Name CHAR(20),
    Disaster_Type  CHAR(20),
    Injury_Rate FLOAT,
    Death_Rate FLOAT, 
    Homelessness_Rate FLOAT,
    PRIMARY KEY (Country_Name, Disaster_Type) 
    FOREIGN KEY (Disaster_Year, Type) REFERENCES Natural_Disaster(Country_Name, Type)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    (Disaster_Year, Type)
);

CREATE TABLE Economic_Damages(
    Total_Economic_Damages FLOAT,
    Country_Name CHAR(20),
    Disaster_Type CHAR(20),
    Year INT, 
    Total Economic Damages as GDP share FLOAT, 
    Insured Damages FLOAT, 
    Reconstruction Costs FLOAT,
    PRIMARY KEY (Total Economic Damages, Country Name, Disaster Type, Year)
    FOREIGN KEY (Country Name, Disaster Type, Year) REFERENCES Damages(Country_Name, Disaster_Type, Year)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



