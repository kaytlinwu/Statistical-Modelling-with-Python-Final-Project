# Final-Project-Statistical-Modelling-with-Python

## Project/Goals
The goal of this project was to create a model that could predict the number of available bikes using the number of different point of interests close to a bike station. 

## Fetch bike station and coordinates from city bikes API
The first step of the project was selecting a city and getting data from the city bikes API pertaining to the bike station's latitude, longitude, and the number of free bikes available. Miami, Florida was chosen a GET request was made to fetch for data. The data was then parsed and put into a dataframe called miami_bikes with the latitude, longitude, and number of bikes of each bike station in Miami, Florida. This dataframe was saved as a csv file called "miami_bikes.csv" so that the data could be used in the following steps. 

### Use bike stations to search for POI on YELP and Foursquare API 
Using the bike station coordinates from the miami_bikes.csv, various points of interests including restuarants, coffee shops, universities and colleges within 1000m of each bike station was requested from the Foursquare and Yelp API. The data collected from the APIs were put into a list and then parsed to retrieve pertinent information into a dataframe. Information such as the location's name, category (or categories), rating, popularity and price were retrieved from the API and then parsed into 2 separate dataframes, one for yelp, the other for foursquare. The data was saved into 1 csv per dataframe (foursquare_data.csv and yelp_data.csv). 

Using the final dataframes, the results of each API were compared to answer questions such as: which API provides a user with more complete information and what the top 10 restuarants are. 


### Comparing Yelp and Foursquare Data
The Foursquare API was found to have more complete data and was selected for the rest of this project. More in delpth analysis can be found in the results section. 

The foursquare_data.csv and the miami_bikes.csv were combined into a single dataframe to perform EDA.


### EDA 
Using the combined foursquare_data and miami_bikes_data into a single dataframe, EDA was performed to get rid of null/duplicate columns. Categories were combined into a single category to represent the type of point of interest. Latitude and longitude were removed as they arae not used in the final analysis. Column datatypes were assessed to see if they were appropriate datatype. The bikes column was changed from a "string" to an "interger". 

Visualizations were performed to gain insights and further understanding of data within the dataset. A pairplots with histograms along the diagonal was used to see if there was a visual correlation between the variables. df.describe() was also used to see the initial statistics and look if there were outliers with each column. These insights will be further discuessed in the results section. 

The final cleaned dataframe was then put into a database using SQLite3. The database was named miami_bikes with one table called miami_bikes which holds all columns. 

### Model Building

Model building process. 

## Results

Define what is meant by coverage here:

When comparing foursquare and API data that was retrieved from the API, there were areas in which one API was better than the other. 

From one GET request to the Yelp API, more data can be obtained compared to the Foursquare API. From both of the APIs, Yelp and Foursquare, the name, address, categories, rating and price of each business/company/site of interest can be retrieved. Unique to the Yelp API, from one GET request you can also fetch the location's website, phone number/display phone, distance from the bus station that was put in our initial query, whether or not the location offers delivery/pickup services, if the point of interest is closed along with the review count. Contrary to this, Foursquare provides only one unique field different from Yelp which is the popularity.

However, when trying to filter to return only restuarants, the yelp was extremely difficult to filter. This is because the categories that are used in the API are relatively unspecific and broad. As a result although restuarants were filtered for, it is difficult to ascertain what type of establishment was pulled. To get the restuarants within the yelp API, one has to filter through exclusion and filter out categories that are not restuarants. This is because categories seeminly unrelated to restuarants including grocery, cafeteria, food market, could be retrieved. Foursquare, on the other hand, had more a more concise and complete description of the point of interest's category. As a result, queries for category was a lot easier to perform. 

In terms of the numerical columns, Yelp seems be be superior to Foursquare. When looking at the yelp rating column, the rating is a calculated value that considers areas of bias to prevent skewing results to businesses with a single review. From the Yelp developers notes, rating is described as an adjusted Bayesian like average rating value that takes into account the number of ratings to adjust the value returned and is displayed as a numerical value between (0-5). On the other hand, Foursquare does not account for this. Rating is a numerical value of the point of interest based on user votes, likes/dislikes,  tips sentiment, and visit data. The rating goes from (0.0-10.0). 

Yelp price is also quantified by price range. The dollar signs are in the following order: $= under $10, $$=11–30, $$$=31–60, andd $$$$= over $61. In comparison, Foursquare API's price is by: 1- Cheap, 2- Moderate, 3- Expensive, 4- Very Expensive. As seen, the Foursquare API is less specific whereas the Yelp API gives clear indication of price ranges for the price it returns.

 Foursquare only unique column "Popularity" returns a numerical value that represents foot traffic to the point of interest. Foursquare using a 6 month interval to calcualte this score. The score is on a 0 to 1 scale. 

 In conclusion: The API with better coverage would be Foursquare. 

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
-Data was excluded as part of the EDA process. 

## Challenges 
Limited number of GET pull requests. 
Yelp data was difficult to filter due to unspecific category names. Limited to work with what the API allows you to work with, the parameters you are given, and the functions of python. 

## Future Goals
(what would you do if you had more time?)
Search for more POI. Analyze the Yelp dataframe to see if the results are comparable to the Foursquare data. 

Limitation is the data on yelp/foursquare is constantly being updated and this data only reflects what was pulled at the time of the GET request. May not necessarily be up to date.

If more time was available: Put GET request into a function. Analyze more parameters and expand the points of interest. Maybe look at different times of the pull request to see if time has a factor in the available bikes. 
