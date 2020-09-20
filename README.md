# SAG Award Nominations for Content Found on Netflix in 2019
- netflix source data note: the movies/tv shows contained in this data set were movies/tv shows that netflix had in their streaming catalog in 2019, the release dates for the actual content varies.

### Source Data

netflix data 2019 = https://www.kaggle.com/shivamb/netflix-shows

sag awards data = https://www.kaggle.com/unanimad/screen-actors-guild-awards

### Purpose

The purpose of this project is to import the above CSVs, transform the data, shape for database, create a sql database with tables, populate the sql tables with
the data we transformed in python, and run queries on the data.

### Process

##### Diagraming My Tables To Understand My Data
![Netflix / SAG ERD](https://github.com/CoreyGaunt/ETL_Project/blob/master/ERD_Diagram.JPG)
The foreign keys shown in this diagram are the composite keys for those junction tables, not actually foreign keys.

##### Cleaning The Individual Data Files

##### Merging The Two DataFrames

##### Create All Necessary SQL Tables in pgadmin4

##### Create DataFrames With Data That Matches The SQL Tables

##### Push DataFrame Information To SQL DataBase

##### Verify That Information Was Sent Successfully

##### Run Queries On SQL Table Data

##### Query Results

[click](https://github.com/CoreyGaunt/ETL_Project/blob/master/Results_From_Queries/query_1.csv)
