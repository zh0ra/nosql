Aggregation Pipeline
--------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - -

Oleksandr Zhorniak
v1.0, 2015-16

Task 3 - Create Aggregation Pipeline queries.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - -
I' ll be using collection from my previous research (EDA) it's Police 911 report
witch has 1157100 records.

Aggregation tasks.
1. First aggregation. For example, we want to know all places (coordinates) where were AUTO THEFTS.
2. Second aggregation. We want to know how many calls to 911 was connected "ALARMS - RESIDENTIAL BURGLARY"
  in the month (April) period during the year(2015).
3.  Theft aggregation.


Solutions:
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
[1. First aggregation.](scripts/aggregation1.js)
--------------------------------------------------------------------------------
```javascript
var conn = new Mongo();
var db = conn.getDB("seatlepd");
//var incedent = db.getCollection("incedent_response_911");
function getPoint(){
printjson(
db.runCommand({aggregate:"incedent_response_911",
            pipeline: [
                    {$match:{"Initial Type Subgroup": "AUTO THEFTS"}},
                    {$project : {
                      CAD_CDW_ID:"$CAD CDW ID",
                      Initial_Type_Subgroup:"$Initial Type Subgroup",
                      coordinates:[
                        "$Longitude",
                        "$Latitude"
                      ]
                    }}
                  ]
                  //,explain:true
                })
              );
};
getPoint();

```
--------------------------------------------------------------------------------
Result first aggregation here:[agg1result.txt](scripts/agg1result.txt)
