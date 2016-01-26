var connect = new Mongo();
var db = connect.getDB("seatlepd");
var incedent = db.getCollection("incedent_response_911");

var group = function(){
  printjson(
    incedent.group({key:{"Event Clearance Group": true}, initial : {Total:0},reduce : function(items, prev){prev.Total +=1}})
);
}
group();
