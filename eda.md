Exploration Data Analize (EDA)
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - -
Oleksandr Zhorniak
v1.0, 2015-16

Task 2 - Import Big Dataset to Databases. And count some data using DB tools.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - -
Using databases:

1. MongoDB 3.2.

2. Postgresql 9.3.

For testing dataset I had found and downloaded from the Seatle Goverment site (data.seattle.gov)
 the report dataset with title ["Seattle Police Department 911 Incident Response"](https://data.seattle.gov/Public-Safety/Seattle-Police-Department-911-Incident-Response/3k2p-39jp), file in a .cvs format.

Task 2a. Import dataset to MongoDB and Postgresql
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - -

  Import dataset to MongoDB.

  For importing the dataset, that I mentioned above into the Mongodb database I'll use
  mongoimport tool that command for import data to MongoDB:

  mongoimport --db seatpepd --collection incedent_response_911 --type csv --headerline --file Seattle_Police_Department_911_Incident_Response.csv

  Result importing dataset to MongoDB.

![Importing dataset to MongoDB.](images/import-to-mongo.png)

  Import time: 1.46 min.

CPU and Memory using during import dataset.

![CPU and Memory using during import dataset.](images/import-to-mongo-cpu-use.png)



 Import dataset to Postgresql.

Postgresql it's the RDBMS. Since release 9.3 version, Postgresql supporting some functions of NoSQL technology for working with JSON documents. But today I'll be using Postgresql as the classic RDBMS. That's why I need to create the database and table inside the Postgresql and after that I'll can import my dataset inside that.  [First script](scripts/create_table_incedent_esponce_911.sql)  to create Database and Table, after that I can copy Dataset into Database using  [Second script](scripts/copy_incedent_esponce_911.sql).

  Result importing to Postgresql:

![Importing dataset to MongoDB.](images/import-to-postgresql.png)

  Query returned successfully: 1157100 rows affected, 21592 ms execution time.(~ 0.22 sec. Winer!).

Task 2b. Calculate imported records.
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - -
![Calculate imported rows](images/count_rows_mongo_postgre.png)

Both Database calculated 1157100 rows.

Task 2c. Create some simple Aggregation on both Databases.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - -
So! Now I created simple aggregation function it's the group function wich to aggregate each type of "Event Clearance Group" and calculate how many types(and rows that types) of "Event Clearance Group" we have in collection.

[Here the grouping script](scripts/q1_group.js):

```javascript
var connect = new Mongo();
var db = connect.getDB("seatlepd");
var incedent = db.getCollection("incedent_response_911");

var group = function(){
  printjson(
    incedent.group({key:{"Event Clearance Group": true}, initial : {Total:0},reduce : function(items, prev){prev.Total +=1}})
);
}
group();
```

Ok! Then we should to apply this command in bash:

mongo --quiet q1_group.js > result_group_q1.json

Finally, we have the such [result](scripts/result_group_q1.json):
```JSON
[
	{
		"Event Clearance Group" : "SUSPICIOUS CIRCUMSTANCES",
		"Total" : 181466
	},
	{
		"Event Clearance Group" : "TRAFFIC RELATED CALLS",
		"Total" : 208702
	},
	{
		"Event Clearance Group" : "OTHER PROPERTY",
		"Total" : 34483
	},
	{
		"Event Clearance Group" : "ROBBERY",
		"Total" : 7085
	},
	{
		"Event Clearance Group" : "PROWLER",
		"Total" : 1574
	},
	{
		"Event Clearance Group" : "LIQUOR VIOLATIONS",
		"Total" : 63676
	},
	{
		"Event Clearance Group" : "DISTURBANCES",
		"Total" : 154819
	},
	{
		"Event Clearance Group" : "NUISANCE, MISCHIEF",
		"Total" : 21042
	},
	{
		"Event Clearance Group" : "MOTOR VEHICLE COLLISION INVESTIGATION",
		"Total" : 10387
	},
	{
		"Event Clearance Group" : "ASSAULTS",
		"Total" : 19806
	},
	{
		"Event Clearance Group" : "FALSE ALACAD",
		"Total" : 2497
	},
	{
		"Event Clearance Group" : "BURGLARY",
		"Total" : 34060
	},
	{
		"Event Clearance Group" : "NARCOTICS COMPLAINTS",
		"Total" : 24052
	},
	{
		"Event Clearance Group" : "FRAUD CALLS",
		"Total" : 15233
	},
	{
		"Event Clearance Group" : "CAR PROWL",
		"Total" : 42180
	},
	{
		"Event Clearance Group" : "DRIVE BY (NO INJURY)",
		"Total" : 504
	},
	{
		"Event Clearance Group" : "TRESPASS",
		"Total" : 29968
	},
	{
		"Event Clearance Group" : "BEHAVIORAL HEALTH",
		"Total" : 2798
	},
	{
		"Event Clearance Group" : "MISCELLANEOUS MISDEMEANORS",
		"Total" : 6849
	},
	{
		"Event Clearance Group" : "SHOPLIFTING",
		"Total" : 30137
	},
	{
		"Event Clearance Group" : "THREATS, HARASSMENT",
		"Total" : 12674
	},
	{
		"Event Clearance Group" : "AUTO THEFTS",
		"Total" : 26764
	},
	{
		"Event Clearance Group" : "PROPERTY - MISSING, FOUND",
		"Total" : 12843
	},
	{
		"Event Clearance Group" : "PROPERTY DAMAGE",
		"Total" : 20302
	},
	{
		"Event Clearance Group" : "WEAPONS CALLS",
		"Total" : 2773
	},
	{
		"Event Clearance Group" : "HAZARDS",
		"Total" : 13897
	},
	{
		"Event Clearance Group" : "ANIMAL COMPLAINTS",
		"Total" : 3197
	},
	{
		"Event Clearance Group" : "ARREST",
		"Total" : 15499
	},
	{
		"Event Clearance Group" : "LEWD CONDUCT",
		"Total" : 2509
	},
	{
		"Event Clearance Group" : "PERSON DOWN/INJURY",
		"Total" : 8467
	},
	{
		"Event Clearance Group" : "PERSONS - LOST, FOUND, MISSING",
		"Total" : 5524
	},
	{
		"Event Clearance Group" : "OTHER VICE",
		"Total" : 334
	},
	{
		"Event Clearance Group" : "BIKE",
		"Total" : 3539
	},
	{
		"Event Clearance Group" : "PROSTITUTION",
		"Total" : 3312
	},
	{
		"Event Clearance Group" : "PUBLIC GATHERINGS",
		"Total" : 73
	},
	{
		"Event Clearance Group" : "HOMICIDE",
		"Total" : 214
	},
	{
		"Event Clearance Group" : "HARBOR CALLS",
		"Total" : 848
	},
	{
		"Event Clearance Group" : "RECKLESS BURNING",
		"Total" : 210
	},
	{
		"Event Clearance Group" : "FAILURE TO REGISTER (SEX OFFENDER)",
		"Total" : 123
	},
	{
		"Event Clearance Group" : "FALSE ALARMS",
		"Total" : 45821
	},
	{
		"Event Clearance Group" : "VICE CALLS",
		"Total" : 26
	},
	{
		"Event Clearance Group" : "MENTAL HEALTH",
		"Total" : 20930
	},
	{
		"Event Clearance Group" : "ACCIDENT INVESTIGATION",
		"Total" : 39397
	},
	{
		"Event Clearance Group" : "NUISANCE, MISCHIEF ",
		"Total" : 10439
	},
	{
		"Event Clearance Group" : "",
		"Total" : 14007
	},
	{
		"Event Clearance Group" : "NULL",
		"Total" : 2060
	}
]

```  

Task 2d. Working with GeoJSON objects.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - -

Find in Internet GeoJSON objects, import to database and create 4 geospatial queries(at list forPoint, LineString and Polygon)
