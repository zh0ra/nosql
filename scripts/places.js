var conn = new Mongo();
var db = conn.getDB("seatlepd");
var incedent = db.getCollection("incedent_response_911");
function getPoint(){

db.incedent_response_911.find({"Initial Type Subgroup": "AUTO THEFTS"}).forEach( function(myDoc) {

print( "{\n"+"\"type\" : \"Point\", " +"\n \"coordinates\": " + "[\n" + myDoc.Longitude + " , " +  myDoc.Latitude + "\n]\n" + "}\n");

 } );

};

getPoint();


/*
var doc = {
  "event_id":1,
    "event_type":"",
  "location" : {
    "type" :"Point",
    "coordinates": [50,50]
  }
}
var doc2 = {
  "event_id":1,
    "event_type":"",
  "location" : {
    "type" :"MultiPoint",
    "coordinates": [
      [50,50],
      [40,40]
    ]
  }
}

db.places.insert(doc2);
var incedent = db.getCollection("incedent_response_911");
var places = db.getCoolection("places");

/
{
    "type": "MultiPoint",
    "coordinates": [
        [
            -105.01621,
            39.57422
        ],
        [
            -80.6665134,
            35.0539943
        ]
    ]
}
*/
