-- SQLite

--Create new column containing bike coordinates. 
--Concatenate latitude and longitude

ALTER TABLE miami_stations 
ADD bikes_coordinates VARCHAR(20) NULL;

UPDATE  miami_stations
SET bikes_coordinates = (latitude||','||longitude);


--Check to see that the column has been made properly
SELECT bikes_coordinates
FROM miami_stations;


--JOIN miami_stations table and miami_bikes_yelp table together using the bike coordinates
SELECT *, ms.bikes
FROM miami_bikes_yelp mb 
LEFT JOIN miami_stations ms    
ON mb.yelp_bike_station_coordinates = ms.bikes_coordinates;

