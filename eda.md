Exploration Data Analize (EDA)

Task 2 - Import Dataset to Database. And count some data using DB tools.
Using databases:

1. MongoDB 3.2.
2. Postgresql 9.3

For testing dataset I had found and downloaded from the Seatle Goverment site (data.seattle.gov)
 the report dataset with title "Seattle Police Department 911 Incident Response", file in a .cvs format.
[link] https://data.seattle.gov/Public-Safety/Seattle-Police-Department-911-Incident-Response/3k2p-39jp

Step 1. Preparation data:

  For importing the dataset, that I mentioned above into the Mongodb database I'll use
  mongoimport tool that command for import data to MongoDB:

  mongoimport --db seatpepd --collection incedent_response_911 --type csv --headerline --file Seattle_Police_Department_911_Incident_Response.csv
