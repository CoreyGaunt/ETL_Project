# SAG Award Nominations for Content Found on Netflix in 2019
- netflix source data note: the movies/tv shows contained in this data set were movies/tv shows that netflix had in their streaming catalog in 2019, the release dates for the actual content varies.

### Source Data

netflix data 2019 = https://www.kaggle.com/shivamb/netflix-shows

sag awards data = https://www.kaggle.com/unanimad/screen-actors-guild-awards

### Purpose

The purpose of this project is to import the above CSVs, transform the data, shape for database, create a sql database with tables, populate the sql tables with
the data we transformed in python, and run queries on the data.

Ultimately, I am trying to build a database where one can query to discover which of the movies/tv shows that Netflix had on their streaming service in 2019 had been nominated for an SAG award, if they won that award, what actor/actress/director was associated with it, and what category the award was in.

### Process

##### Diagraming My Tables To Understand My Data
![Netflix / SAG ERD](https://github.com/CoreyGaunt/ETL_Project/blob/master/ERD_Diagram.JPG)
The foreign keys shown in this diagram are the composite keys for those junction tables, not actually foreign keys.

##### Cleaning The Individual Data Files

In order to prepare my files to be merged, I had to determine which series of information I wanted to join my dataframes on. I decided that I wanted to merge my data on the movie / show name series which were called 'title' in the netflix data and 'show' in the SAG data. To ensure the values matched up, I put both series in title case and stripped them to make sure there were no extra spaces in the data. 

In the netflix data, I had to split apart the actors listed in the 'cast' series, as I wanted there to only be one name per cell in each row. To do this, I brought in a chainer function that will create a list by looping through a series and appending every cell value, and if that value contains a ', ' it will split on that value and append the names as two separate items. To create the dataframe, I used np.repeat to repeat the values in the other series as a result of the above splitting that was done.

For the SAG data, I had to create a better 'year' value as the ones present were long strings, and I couldn't use those in my data. To clean this up - I wrote a for loop that traversed through a range equal to the length of the dataframe, split the values on the value ' ' then returned the object at index 0. I saved this to a list and then appended that list to the original dataframe to get my years_released series. 

From there, I grabbed the series from my new dataframe that I wanted to be used during the merge, stripped some of the series as a safety measure, and set the index for the dataframe as 'id'

##### Merging The Two DataFrames

With both of my dataframes cleaned up, I am ready to merge the dataframes on the 'title' series. The next step was to create a new dataframe that merged the information on the actor/actress name. This is an important step because it is showing me not only titles that were on netflix in 2019 that won SAG awards, but it also shows the actor/actresses associated with that title. Had I not filtered this list in this way, there would be instances of titles without actors/actress and vice versa.

Lastly, I export this data to a csv for me to use later in the process to create my dataframes that will be used to put information into my SQL tables.

##### Create All Necessary SQL Tables in pgadmin4

In pgadmin 4, I go about setting up my tables based off of the ERD diagram that you saw above. I am careful to ensure that I have created the tables in the exact same order that I diagramed them as there are dependencies in my tables.

I had to be careful here to create my junction tables in the right order so that I could leverage the proper primary keys for their composite keys.

![Setting Up My Tables](https://github.com/CoreyGaunt/ETL_Project/blob/master/Images/Setting_Up_Tables.JPG)

##### Create DataFrames With Data That Matches The SQL Tables

After putting my SQL tables into my database, I was ready to go back into my csv and create new dataframes that would match the content I wanted to be populated into my database. This meant I had to make eight dataframes total (actors, titles, act_ttl**, directors, dir_ttl**, awards, act_award**, dir_award**)

The exact process I took to create these tables is laid out in my code comments, but largely it involved dropping duplicate / unneeded data and creating unique integer series for tables that did not have proper 'primary key' values.

** these are my junction tables

##### Push DataFrame Information To SQL DataBase

Use SQLalchemy's create_engine and connection string functionality to connect to my SQL database, and then used pandas pd.to_sql() to push my data into the database.

##### Verify That Information Was Sent Successfully

I then wrote basic queries to verify my data was present in my tables

![Verify Data Import Queries](https://github.com/CoreyGaunt/ETL_Project/blob/master/Images/Verify_Query.JPG)

##### Run Queries On SQL Table Data

Below are snippets of the queries I ran, and I posted links to the results of those queries in the next section.

![Queries To My Data Part1](https://github.com/CoreyGaunt/ETL_Project/blob/master/Images/Queries_1.JPG)

![Queries To My Data Part2](https://github.com/CoreyGaunt/ETL_Project/blob/master/Images/Queries_2.JPG)

![Queries To My Data Part3](https://github.com/CoreyGaunt/ETL_Project/blob/master/Images/Queries_3.JPG)

##### Query Results

Query 1 - [results](https://github.com/CoreyGaunt/ETL_Project/blob/master/Results_From_Queries/query_1.csv)

Query 2 - [results](https://github.com/CoreyGaunt/ETL_Project/blob/master/Results_From_Queries/query_2.csv)

Query 3 - [results](https://github.com/CoreyGaunt/ETL_Project/blob/master/Results_From_Queries/query_3.csv)

Query 4 - [results](https://github.com/CoreyGaunt/ETL_Project/blob/master/Results_From_Queries/query_4.csv)

Query 5 - [results](https://github.com/CoreyGaunt/ETL_Project/blob/master/Results_From_Queries/query_5.csv)

Query 6 - [results](https://github.com/CoreyGaunt/ETL_Project/blob/master/Results_From_Queries/query_6.csv)

Query 7 - [results](https://github.com/CoreyGaunt/ETL_Project/blob/master/Results_From_Queries/query_7.csv)

Query 8 - [results](https://github.com/CoreyGaunt/ETL_Project/blob/master/Results_From_Queries/query_8.csv)
