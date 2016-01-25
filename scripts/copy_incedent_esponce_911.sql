/*
Import dataset from Seattle_Police_Department_911_Incident_Response.csv
*/
COPY incedent_responce_911 (
 CAD_CDW_ID,
 CAD_Event_Number,
 General_Offense_Number,
 Event_Clearance_Code,
 Event_Clearance_Description,
 Event_Clearance_SubGroup,
 Event_Clearance_Group,
 Event_Clearance_Date,
 Hundred_Block_Location,
 District_Sector,
 Zone_Beat,
 Census_Tract,
 Longitude,
 Latitude,
 Incident_Location,
 Initial_Type_Description,
 Initial_Type_Subgroup,
 Initial_Type_Group,
 At_Scene_Time
) FROM '/home/zhora/data/Seattle/Seattle_Police_Department_911_Incident_Response.csv'
WITH DELIMITER ','
CSV HEADER;