/*
Preparing Postgresql for inmort dataset from file: Seattle_Police_Department_911_Incident_Response.csv
Create data base
*/

#First step, create database
CREATE DATABASE seattlepd;

#Second step, create table for importing dataset
CREATE TABLE incedent_responce_911_2 (
 CAD_CDW_ID NUMERIC(25),
 CAD_Event_Number NUMERIC(25),
 General_Offense_Number NUMERIC(25),
 Event_Clearance_Code NUMERIC(25),
 Event_Clearance_Description VARCHAR(250),
 Event_Clearance_SubGroup VARCHAR(50),
 Event_Clearance_Group VARCHAR(50),
 Event_Clearance_Date VARCHAR(50),
 Hundred_Block_Location VARCHAR(250),
 District_Sector VARCHAR(4),
 Zone_Beat VARCHAR(10),
 Census_Tract VARCHAR(15),
 Longitude FLOAT(5),
 Latitude FLOAT(5),
 Incident_Location VARCHAR(50),
 Initial_Type_Description VARCHAR(250),
 Initial_Type_Subgroup VARCHAR(150),
 Initial_Type_Group VARCHAR(150),
 At_Scene_Time VARCHAR(25)
);
