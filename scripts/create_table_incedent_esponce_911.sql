/*
Preparing Postgresql for inmort dataset from file: Seattle_Police_Department_911_Incident_Response.csv
Create data base
*/

#First step, create database
CREATE DATABASE seattlepd;

#Second step, create table for importing dataset
CREATE TABLE incedent_esponce_911 (
"_id" NUMERIC(25) PRIMARY KEY,
 "CAD CDW ID" VARCHAR(25),
 "CAD Event Number" VARCHAR(25),
 "General Offense Number" VARCHAR(25),
 "Event Clearance Code" VARCHAR(25),
 "Event Clearance Description" VARCHAR(250),
 "Event Clearance SubGroup" VARCHAR(50),
 "Event Clearance Group" VARCHAR(50),
 "Event Clearance Date" VARCHAR(50),
 "Hundred Block Location" VARCHAR(250),
 "District/Sector" VARCHAR(4),
 "Zone/Beat" VARCHAR(10),
 "Census Tract" VARCHAR(15),
 "Longitude" FLOAT(5),
 "Latitude" FLOAT(5),
 "Incident Location" VARCHAR(50),
 "Initial Type Description" VARCHAR(250),
 "Initial Type Subgroup" VARCHAR(150),
 "Initial Type Group" VARCHAR(150),
 "At Scene Time" VARCHAR(25)
);
