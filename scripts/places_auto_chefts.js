var conn = new Mongo();
var db = conn.getDB("seatlepd");
var incedent = db.getCollection("incedent_response_911");
function getPoint(){
//var event_id = "$CAD CDW ID";
db.incedent_response_911.find({"Initial Type Subgroup": "AUTO THEFTS"}).limit().forEach( function(myDoc) {

printjson( { "_id": myDoc._id,"event_type":"AUTO THEFTS", "loc" :{"type" : "Point", "coordinates":[ myDoc.Longitude , myDoc.Latitude ]}});

 } );

};

getPoint();