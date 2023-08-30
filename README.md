# Final-Project-Statistical-Modelling-with-Python

## Project/Goals
The goal of this project is to make a model comparing the Foursquare API and the YELP API in regards to bike stations that were pulled from the city bikes API. The model's goal was to ......

## Process
The first step of the project was selecting a city and getting data from the city bikes API pertaining to the bike stations, latitude, longitude, and number of bikes. Miami, Florida was chosen and the GET request was made. The data was then parsed and then put into a dataframe called miami_bikes.csv with the latitude, longitude, and number of bikes of each bike station in Miami, Florida. 

### (your step 2)
Following, using the miami_bikes.csv, with the Foursquare and Yelp API, restuarants, coffee shops and univeristies/colleges within 1000m of each bike station was filtered on the API. Data regarding information such as the location's name, category (or categories), rating, popularity and price were retrieved from the API and then parsed into 2 separate dataframes, one for yelp, the other for foursquare. The data was saved into 1 csv per dataframe (Foursquare_data.csv and Yelp_data.csv). 

Using the final dataframes, the results of each API were compared to answer questions such as: which API provides a user with more complete information and what the top 10 restuarants are. 

### (your step 3)
The Foursquare API was found to have more complete data was selected for the rest of this project. 
The foursquare_data.csv and the miami_bikes.csv were combined into a single dataframe. 

With this new dataframe, EDA was performed to get rid of null/duplicate columns. Remove discrepant/irrelevant data and clean rows to make sure that the data was in the appropriate datatype ie._______________________________________. 

Visualizations were performed to gain insights and further understanding of data within the dataset. Graphs such as pairplots, histograms, and scatterplots were used to see if there was a relationship between different columns within the dataset. 

This dataframe was then put into a database using SQLlite. 

### (your step 4)

Model building process. 

## Results
(fill in what you found about the comparative quality of API coverage in your chosen area and the results of your model.)

The GET request was analyzed to see which API had provided more complete data and gave more information regarding the point of interest that was fetched.   

From one GET request to the Yelp API, more data can be obtained compared to the Foursquare API. From both of the APIs, Yelp and Foursquare, you can retrieve the name, address, categories, rating and price of each business/company/site of interest. Unique to the Yelp API, from one GET request you can also fetch the location's website, phone number/display phone, distance from the bus station that was put in our initial query, whether or not the location offers delivery/pickup services, if the point of interest is closed along with the review count. Contrary to this, Foursquare provides only one unique field different from Yelp which is the popularity.

However, yelp = unspecific, difficult to filter (categories= unspecific), unsure what type of establishment was pulled. Foursquare= more concise and complete data. No need to filter out keywords to perform queries... etc. 

Popularity vs. Review Count
Comparing the 2 Rating values. 

The final dataframe, excluding duplicate values: ________________________________.

The 10 restuarants (In descending order) from each respective API. 
Foursquare: (Grouped by rating, popularity)
1. Doce Provisions, Rating = 9.3
2. Azucar Ice Cream Company, Rating = 9.0
3. Lokal Burgers & Beer, Rating = 9.0
4. Ironside Pizza, Rating = 8.9
5. Old's Havana Cuban Bar & Cocina, Rating = 8.8
6. Panther Coffee, Rating =8.8
7. Cafe La Trova, Rating = 8.8
8. Union Beer Store, Rating = 8.8
9. Doggi's Arepa Bar, Rating = 8.8
10. The Original Daily Bread Marketplace =8.7

*Note that food trucks were included as restuarants in the Yelp query. 
Yelp: (Grouped by 'Rating', 'Review_Count')
1. Funnel Cake Miami, Rating = 5.0
2. Marcelo's Ceviches, Rating = 5.0
3. Taqueria Los Chilangos, Rating = 4.5
4. Churromania Little Havana, Rating = 4.5
5. Shukran Mediterranean Food, Rating =4.5
6. El Orguillo Latino Kitchen, Rating = 4.5
7. Russian Store, Rating = 4.5
8. Poke House Brickell, Rating = 4.5
9. Ironside Pizza, Rating = 4.0
10. Purple People Eatery, Rating = 4.0

EDA Results:
-What did the visualizations tell you about the dataset

Model Building:
-What was the final model that you made
-Output and interpretations of output that was generated. What does it mean?
-How can you turn this into a classification model?

## Challenges 
(discuss challenges you faced in the project)
Limited number of GET pull requests. 
Yelp data was difficult to filter due to unspecific category names. 

## Future Goals
(what would you do if you had more time?)
Search for more POI. Analyze the Yelp dataframe to see if the results are comparable to the Foursquare data. 
