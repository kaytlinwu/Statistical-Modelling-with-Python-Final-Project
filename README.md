# Final-Project-Statistical-Modelling-with-Python

## Project/Goals
The goal of this project was to create a model to predict for the number of free bikes using the 'rating' and 'price' parameter of different point of interests within 1000m of a bike station. The API selected for the model was Yelp. 

The model was limited to using linear regressions to model the data. Additonally, due to time contraints, only 1 API data was modelled. 

## Fetch bike station and coordinates from city bikes API
The first step of the project was to select a city and request data from the city bikes API pertaining to the bike station's latitude, longitude, and the number of free bikes available. Miami, Florida was chosen and a GET request was made to fetch for free bikes in Miami, Florida. The fetched data was then parsed and put into a dataframe called miami_bikes with the following columns: latitude, longitude, and number of bikes for each bike station. This dataframe was saved as a csv file called "miami_bikes.csv". 

## Using the bike stations coordinates to search for point of interests on Yelp and Foursquare API 
Using the bike station coordinates from the miami_bikes.csv, various points of interests including restuarants, coffee shops, universities and colleges within 1000m of each bike station was requested from the Foursquare and Yelp API. The data collected from the APIs were put into a list and then parsed to retrieve pertinent information. The information was put into a dataframe and included information regarding the point of interest's name, category (or categories), rating, popularity and price. The parsed dataframes were saved as 2 separate dataframes, one for yelp, the other for foursquare. The data was then saved into a csv file per dataframe (foursquare_data.csv and yelp_data.csv). 

Using the final dataframes, the results of each API were compared to answer questions such as: which API provides a user with more complete information and what the top 10 restuarants returned for each dataframe were. 


## Joining data/Data cleaning

Data retrieved from the Yelp API was selected and combined with the miami_bikes data. Using the bike station coordinates, the dataframes were joined together in both python and SQLite3. Data was mostly manipulated using python. 

Data cleaning was performed to remove duplicated rows and null columns. Column datatypes were assessed an modified to the appropriate data type. The 'bikes' column was changed from an object into an interger. Visualizations and EDA was performed to gain insights on the data. The final dataframe was saved as a csv file called "final_miami_bikes_yelp.csv". 

The miami_bikes dataframe and yelp_data dataframe were put as 2 separate tables into an sql database using SQLite3. The database was named miami_bikes_yelp with one table called miami_stations and the other called miami_bikes_yelp which holds all columns. A left join using the bike coordinates joined the 2 tables together. 

## Model Building

The final_miami_bikes_yelp.csv containing both miami_bikes and yelp_data was loaded in the notebook. The dataframe was further cleaned to remove unnecessary columns such as the 'yelp_bike_station_coordinates','category_1','category_2', and 'category_3' as they were not pertinent to creating the model. Additionally, data was further cleaned to remove duplicate point of interests and all null values were removed. 

A pairplot of the cleaned data was used to quickly visualize the data. The plot showed no obvious colinearity or relationship between variables. Additionally data seems to be clustered towards the end of the graph as demonstrated in the review_count vs. bikes and review_count vs. distance graph. A few outliers were noted and boxplots were used to determine whether or not the outliers in the 'rating' and 'price' columns could be removed. 

After removing outliers, to begin, a simple linear regression was made using 'price', as the x variable, and 'bikes' as the y variable. This model was then modified to a multilinear regression to include both 'price' and 'rating' as x variables to create the final model. Several normality tests were performed to assess whether the data follows a normal distribution.  

The final model was created and a test case was made to see how well the model predicted for a known value. The final model was graphed with the actual data plotted as a scatter plot against the predicted data denoted by the multilinear regression line. 

## Results

## Yelp vs. Foursquare API Comparison

The Yelp and Fousquare API were compared based on the amount of coverage each API gave. Coverage for this analysis is a measure determined by how accurate and complete the information retrieved from the API was. Additionally, the quality of the data was assessed to see if there were inherent sources of error or biases that may be presented in the data. 

When comparing Foursquare and Yelp API data that was retrieved, there were areas in which one API was superior to the other. 

From a single GET request to the Yelp API, more data can be obtained compared to the Foursquare API. From both APIs, a point of interest's name, address, categories, rating, and price can be retrieved. Unique to the Yelp API, from a single GET request you can also fetch a variety of data including the location's website, phone number/display phone, distance from the bike station coordinates, whether delivery/pickup services are available, and the review count.This information is useful in gaining more information which can be further used for other business analysis. Contrary to this, Foursquare provides only one unique parameter different from Yelp which is 'popularity'.

In terms of the numeric parameters, Yelp is superior to Foursquare. In the Yelp API, the 'rating' is calculated to ensure that the 'rating' is not skewed in the case where a business recieves a bad review. From the Yelp developers notes, 'rating' is described as an adjusted Bayesian-like average. This 'rating' value takes into account the number of ratings and adjusts the value returned to account for potential skewing. The final result is depicted as a numerical value between 0-5. On the other hand, Foursquare does not account for this. In the Foursquare API, 'rating' is a numerical value based on user votes, likes/dislikes,  tips sentiment, and visit data. This 'rating' in a numerical value from 0.0-10 and may be skewed and may not be an accurate representation of the point of interest. 

Yelp's price parameter bins prices into different price ranges. The dollar signs are set in the following order: $= under $10, $$= 11–30, $$$= $31–60, andd $$$$= over $61. In comparison, Foursquare API's price is categorized by: 1- Cheap, 2- Moderate, 3- Expensive, 4- Very Expensive. As seen, the Foursquare API is less specific whereas the Yelp API gives clear indications of price ranges for the price it returns.

 The greatest disadvantage to Yelp is it's filtering capabilties. Noticebly for the restuarant category, Yelp was extremely difficult to filter. This is because the parent category, 'restuarant', contains multiple subcategories that are too specific. The parent category, 'restuarants', contains a broad range of subcategories that seem unrelated to the parent category such as 'grocery', 'cafeteria', 'food market', 'pharamacies' and 'drugstore'. As a result, although restuarants was queried, in the final dataframe it was difficult to ascertain what type of establishment was pulled. To filter for the restuarants within the Yelp API, one has to filter through exclusion to remove subcategories.  Foursquare, on the other hand, had more concise and complete descriptions of the point of interest's category. As a result, queries for a point of interest's category were easier to perform. 

 Foursquare's only unique parameter that is not shared with Yelp is 'Popularity'. 'Popularity' returns a numeric value that represents the amount of foot traffic to the point of interest. Foursquare uses a 6 month interval to calculate this score and returns a value between 0 to 1. Additionally, not all point of interests have associated ratings or popularity which may result in NULL values retrieved.  

 In conclusion, the API with better coverage would be the Yelp API. Yelp is seen to have more complete data as it not only accounts for skewing in the numeric parameter 'rating', more information can be retrieved from a single GET request and there are less null values in the final data. Additionally, 'price' is binned into specific price ranges giving the user more complete information as opposed to Foursquare. The only disadvantage it has over the Foursquare API is the ability to filter since the subcategories are too specific and difficult to sort through. 


### Top 10 Restuarants:

The 10 restuarants (In descending order) from each respective API. 

Foursquare: (Grouped by 'rating', 'popularity')
1. Wynwood Art Walk, 'Rating' = 9.4
2. Broken Shaker, 'Rating' = 9.4
3. Mandolin Aegean Bistro, 'Rating' = 9.4
4. Fiorito, 'Rating' = 9.3
5. Doce Provisions, 'Rating' = 9.3
6. Il Gabbiano 	, 'Rating' = 9.3 	
7. Yardbird Southern Table & Bar, 'Rating' = 9.2
8. Vice City Bean, 'Rating' = 9.2 	
9. Lagniappe, 'Rating' = 9.2
10. Macchialina Taverna Rustica = 9.2


Yelp: (Grouped by ''Rating'', 'Review_Count')
1. Meraki Gyro & Bakery, 'Rating' = 5.0
2. La Burguesa, 'Rating' = 5.0
3. Café Prima Pasta, 'Rating' = 4.5
4. Full Bloom Vegan, 'Rating' = 4.5
5. GoGo Fresh SOBE, 'Rating' =4.5
6. Il Pastaiolo, 'Rating' = 4.5
7. Crazy Poke, 'Rating' = 4.5
8. Luna Pasta e Dolci, 'Rating' = 4.5
9. Loretta & The Butcher, 'Rating' = 4.5
10. Ono Poké Shop, 'Rating' = 4.5

### EDA Results:

The combined yelp_data and miami_bikes data was cleaned through removing duplicated columns, removing null values, and changing column datatypes to the appropriate datatype. The bike column was changed from an object to a interger as "bikes" returns a numeric value for the number of free bikes. No null values were removed as null values were only found in the "category_2" and "category_3" columns. This is possible as a point of interest may only fall into one category. 

Visualizations were performed to gain insights and further understanding of data within the dataset. Pairplots with histograms along the diagonal was used to see if there was a visual correlation between the variables. Through the pairplot, there was no obvious correlation or relationship that can be interfered between variables. Much of the data seemed to be clustered to a corner of the graphs as opposed to following a set pattern. A few outliers were noted. In the 'rating' vs. review_count a few outliers can be seen where review_count >2500 and 'rating' is = 4.5. The distance graphs had a few outliers, where the distance >100000m. As well, the bike histogram on the bottom right-hand side shows that the data is skewed heavily to the right. 

Through the df.describe function, further evidence suggests there may be outliers in the following columns. 

The review_count column:
    mean = 285
    max =3163
    min =1
    standard deviation = 431

The difference from the min and max is 3162 which suggests the range between the min and max is very high. Additionally the max exceeds the standard deviation by greater than 3 standard deviations. This implies there may be data points that are outliers. 

The distance column:
    mean = 2441.237101
    max = 121415.061956
    min = 16.710029
    standard deviation = 7861.008148

Similar to what was seen with the review_count column, the difference from the min and max is 121398.361666 which suggests that range is very high. Additionally the max value exceeds the standard deviation by greater than 3 standard deviations. This implies there may be data points that are outliers. 

## Model Preparation

Unnecessary columns such as 'category_1', 'category_2', 'category_3' and 'yelp_bike_coordinates' were removed from the dataframe. Duplicates and null values were removed. A pairplot was visualized and no obvious correlation or relationship was seen. A few outliers noted were and boxplots were used to determine whether an outlier can be removed. 

From the boxplot for 'rating' vs. 'bikes' and 'price' vs. 'bikes' a few data points were removed. In the 'price' vs. 'bikes' boxplot, there were a few outliers that were strongly deviated from the mean in which 'price' was < 4 and 'bikes' was >=25. In the 'rating' vs. 'bikes' boxplot, a clear extreme outlier can be seen where the 'rating' is 1.5 and 'bikes' is 25. These parameters were queried in the dataframe and printed to pull the associated row on the dataframe. The 1 extreme outlier from the 'rating' vs. 'bikes' boxplot was also found within the outlier list for the price vs. bikes boxplot. This data point was an outlier for 2 different parameters and was removed. The remaining outlier datapoints were analyzed against the boxplots and the original pairplot. After analyzing, these outliers were all removed.

A quick correlation test demonstrated there is no strong linear correlation between any of the independent variables and the response variable, 'bikes'. All correlations against 'bikes' were weak with a correlation between-0.007858 and -0.069046 suggesting that the independent variables do not have a linear relationship to the dependent variable, 'bikes'. Subsequently, a Pearson's correlation test was run to determine if the correlations are statistically significant. The pearson's correlation test indicated there were a few statistically significant correlations with a p value <0.05 as seen between 'price' and 'bikes' with a p value of 457836194387499e-05 and with the p value of 0031585246947965786 between 'rating' and 'bikes'.

## Model Building:
The final model has the following equation:

                            y = np.exp(0.4301 * x1 + 0.4301 * x2) -1


## Simple Regression Model
To begin, a simple linear regression model was made using x= 'rating' and y= 'bikes'. The R-squared value was found to be 0.532, and the p value for 'rating', p value=0.000, was significant as it was less than 0.05. With one indpendent variable, 'rating', the model was able to explain 53.2% of the variance in the dependent variable, 'bikes'. A residual analysis was performed and the residuals were listed. The list returned mostly negative values meaning that the predicted value was higher than the expected value. The residuals were plotted in a barplot to help visualize the residuals. From the bar graph, a large portion of the predicted data are higher than the expected value. However, a subset of data is skewed to the right where the predicted value is lower than the expected value. Additionally, the residuals have quite a large range from -11 to 17. A scatterplot of the x and y variables demonstrated there is no visible correlation between the 2 variables. There may be a slight decrease in number of bikes the higher the price is. 

Several tests for normality were performed including the QQ-plot and Shapiro's test. The QQ-plot had a few points of interesection to the reference line, however, the tail ends of the plot are not aligned. As a result, the QQ-plot does not indicate the data follows a normal distribution. Additionally, the Shapiro's test had a p-value greater than 0.05 meaning we reject the null hypothesis that the data is normally distributed. The Shapiro's test came up with a siginificantly low p-value of 4.017996031859238e-32 meaning the data is heteroscedastic. A scatterplot with 'price' and the residuals were graphed further demonstrating that the data is heteroscadastic as the data points do not demonstrate equal variance. 

## Final Modified Model
The simple regression was modified to add 'price' as another x variable. As the response variable, y, is skewed to the right, the log was taken to normalize the data. An ajustment factor of +1 was added as taking the log of 0 is not permissible. The modified model's R-squared value increased to 0.769 with an adjusted R-squared value of 0.769. This demonstrates that there was a significant increase in R-squared through normalizing and adding another x variable. The model was able to explain 76.9% of the variance in the dependent variable, 'bikes', using 'price' and 'rating' as the independent variables. The p values for both 'price' and 'rating' were 0.000 meaning that they both are statistically significant. 

 The residuals were listed and demonstrated that the predicted value was higher than the expected value. When compared to the simple linear regression, these residual values were much lower. The residuals were plotted on a bar chart and showed a more even distribution. The range also decreased to -2 to 2. The QQ-plot better fitted to the reference line with slight deviations, however, the plot still indicated that the data may not follow a normal distribution. To confirm, the Shapiro's test and Breuschpagan test for homoscedasticity was performed. Both of these tests indicated that the data is not normally distributed as their p values were significantly less than 0.05, thus rejecting the null hypothesis that the data is normally distributed. The p-values for the Shapiro and Breuschpagan test were respectively 1.4569602713614294e-25 and 1.263428007783398e-278. As the model failed the normality tests, it suggest that the data does not follow a linear regression. 

 Using the results summary, the final multilinear regression model was found to be:
                y = np.exp(0.4301 * x1 + 0.4301 * x2) -1

 Using a test case, the model was able to accurately predict the number of bikes. The final graph, with a line denoting the model's predictions vs. actual data was plotted. In the final graph, the actual data seems to be clustered in a corner and does not seem to have much intersection with the model. We can conclude that the data may be better demonstrated with another model using another type of regression. 

## To Create A Classification Model:

In order to turn this regression model into a classification, the response variable, 'bikes', must be made into a categorical variable. This would be done by binning the "bikes" into intervals and then labelling the intervals with markers that represent each bin. Depending on how many bins are required, they can be named arbitrarily starting from 1. If there are not many categories, these numbers can be further divided into "low traffic, medium traffic, high traffic". 

After converting the response variable, 'bikes', to a categorical variable the model would have to be changed. Since the response variable is categorical, a logistic regression would better represent the data. 

Dependent variable(y) = bikes
Independent variables(x) = 'rating', price

Create bins for the response variable:

log_reg_df.loc[log_reg_df['bikes'].between(0,5), 'bikes'] = 1
log_reg_df.loc[log_reg_df['bikes'].between(5,10), 'bikes'] = 2
log_reg_df.loc[log_reg_df['bikes'].between(10,15), 'bikes'] = 3
log_reg_df.loc[log_reg_df['bikes'].between(15,20), 'bikes'] = 4
log_reg_df.loc[log_reg_df['bikes'].between(20,25), 'bikes'] = 5

After all the variables are set up appropriately, the logistic regression can be made.

y = log_reg_df['bikes'] #set y variable
x = log_reg_df[[''rating'','price']] #set x variable
x = sm.add_constraint(x) #adds a column of 1s so model contains intercept

model = sm.Logit(y.astype(float), x.astype(float)) #set as float values
results = model.fit() #fit the model
print(results.summary())

Using the results summary, the results would be analyzed to determine if there needs to be variables added/removed (including the constant).  After making adjustments, using the final results summary generated, create the model using the formula p = 1/(1 + (e^-(b0+b1x1+b2x2)) adjusted for the parameters we are using in our model.

After the model is created, test to see how well the model predicts for an actual value. Compare the results. Following, create a scatterplot containing a comparison between a graph of the actual data against the model's predicted values. Include the decision boundary where the probability threshold is = 0.5. Label the graph's axis, add legends and format the final graph to display the final model against actual data. 

Finally, the final output will be analyzed to detemine how well the model predicts for the actual data. Does the data fit? Perhaps the data can better be explained by a polynommial logistic regression? These questions would be answered and the process would be repeated to modify the model to better fit the data. 

## Challenges 

There were many challenges in this project. As the project utilizes APIs, some APIs restrict the amount of GET requests that are made in a day. Also, the data that is fetched from the API is restricted to what the developers allow a user to fetch. Data from the APIs, on Yelp and foursquare, are constantly being updated and the project data only reflects what was pulled at the time of the GET request. Therefore, this data may not necessarily be up to date.

The other challenge was fitting the model to the dataset. As seen from the results, the data did not fit the linear regression and failed the normality tests. A better model should be chosen to represent the data.   

## Future Goals

If more time was available, the model could be expanded and further improved to include more variables. Additionally, as the data does not suggest a normal distribution, different kinds of models could be used to see if different regressions better represent the data. For example, logarithmic, exponential, or polynomial regressions could be explored. Further data cleaning, potentially removing more outliers, could be explored as outliers from only the rating and price column removed due to time constraints. 

Furthermore, as only 1 API was used to create the final model, the foursquare API data could be joined with the miami_bike data and used to create another model. This model can be compared to the Yelp model created in the project to see which is better at prediciting the number of free bikes available. 


