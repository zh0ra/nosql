var conn = new Mongo();
var db = conn.getDB("seatlepd");
var places = db.getCollection("pleaces_auto_chefts");
function getPoint(){
  var pd_location = {type : "Point", coordinates : [47.6043326,-122.331643]}

  print(
    db.places.find({"loc":{$near:{$geometry: pd_location,
    $minDistance: 1,
    $maxDistance: 50000
    }}})
  );

};

getPoint();
