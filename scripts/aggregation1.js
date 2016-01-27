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
