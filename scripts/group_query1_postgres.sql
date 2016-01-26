
SELECT
 Event_Clearance_Description,
 COUNT (CAD_Event_Number)
FROM
 incedent_responce_911
GROUP BY
 Event_Clearance_Description
ORDER BY
 COUNT (Event_Clearance_Description) DESC;