/*
Import dataset from Seattle_Police_Department_911_Incident_Response.csv
*/
COPY incedent_esponce_911 (
 "CAD CDW ID",
 "CAD Event Number",
 "General Offense Number",
 "Event Clearance Code",
 "Event Clearance Description",
 "Event Clearance SubGroup",
 "Event Clearance Group",
 "Event Clearance Date",
 "Hundred Block Location",
 "District/Sector",
 "Zone/Beat",
 "Census Tract",
 "Longitude",
 "Latitude",
 "Incident Location",
 "Initial Type Description",
 "Initial Type Subgroup",
 "Initial Type Group",
 "At Scene Time"
) FROM '/home/zhora/data/Seattle/Seattle_Police_Department_911_Incident_Response.csv'
WITH DELIMITER ','
CSV HEADER;
