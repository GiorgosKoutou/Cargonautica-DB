-- Start of Querie 1
-- Count of department heads (supervisors) who are over 35 years old.

SELECT count(departments_managers.dpr_manager_id) AS "Managers over 35 years old"
FROM departments_managers
JOIN employees
ON departments_managers.dpr_manager_emp_id = employees.emp_id
WHERE TIMESTAMPDIFF(YEAR, emp_birth_date, CURDATE()) > 35 
		AND departments_managers.dpr_manager_end_date IS NULL;
        
-- End of Querie 1


-- Start of Querie 2
-- Number of ships in the fleet that are older than 15 years.

SELECT count(ships.ship_const_date) AS "Ships over 15 years old"
FROM ships
WHERE TIMESTAMPDIFF(YEAR,ship_const_date, CURDATE()) > 15;

-- End of Querie 2


-- Start of Querie 3
-- Count of captains who reside in the same country.

SELECT  count(crew_posts.crew_post_post_id) AS "Captains", employees.emp_country AS "Captain's Country"
FROM crew
JOIN employees
ON crew.emp_id = employees.emp_id
JOIN crew_posts
ON crew_posts.crew_post_crew_id = crew.crew_id
WHERE crew_posts.crew_post_post_id = 1
	AND crew_posts.crew_post_end_date IS NULL
GROUP BY employees.emp_country
HAVING count(crew_posts.crew_post_post_id) > 1;

-- End of Querie 3
        
        
-- Start of Querie 4
-- Identify the Chief Engineer (A' Mechanic) who has been involved in the highest number of level 1 (critical) malfunctions.

SELECT concat(employees.emp_first_name ,' ', employees.emp_last_name ) AS "First Mechanic's Full Name",
crew.crew_id AS "First Mechanics" ,
count(ship_malfunctions.ship_mal_id) AS "Malfunctions"
FROM crew_posts
JOIN posts
ON crew_posts.crew_post_post_id = posts.post_id
JOIN crew
ON crew_posts.crew_post_crew_id = crew_id
JOIN employees
ON crew.emp_id = employees.emp_id
JOIN crew_trips
ON crew_trips.crew_trip_crew_id = crew.crew_id
JOIN trips
ON crew_trips.crew_trip_trip_id = trips.trip_id
JOIN ship_trips
ON ship_trips.ship_trip_trip_id = trips.trip_id
JOIN ships
ON ship_trips.ship_trip_ship_id = ships.ship_id
JOIN ship_malfunctions
ON ship_malfunctions.ship_mal_ship_id = ships.ship_id
WHERE ship_malfunctions.ship_mal_malf_id = 1
	AND crew_posts.crew_post_post_id= 4 
GROUP BY crew.crew_id
ORDER BY Malfunctions desc
LIMIT 2;

-- End of Querie 4


-- Start of Querie 5
-- List of captains whose passports will expire within the next 6 months.

SELECT count(crew_posts.crew_post_post_id) AS "Captains", TIMESTAMPDIFF(MONTH,CURDATE(),crew.passport_end_date) AS "Months Remaining"
FROM crew
JOIN crew_posts
ON crew_posts.crew_post_crew_id = crew.crew_id
WHERE crew_posts.crew_post_post_id = 1
	AND crew_posts.crew_post_end_date IS NULL
    AND TIMESTAMPDIFF(MONTH,CURDATE(),crew.passport_end_date) < 6
GROUP BY crew.passport_end_date;

-- End of Querie 5


-- Start of Querie 6
-- Employee who has the highest number of children.

SELECT concat(employees.emp_first_name ,' ', employees.emp_last_name ) AS 'Full Name',
		employees.emp_id AS "Employee ID",
        count(members.members_id) AS "Kids"
FROM members
JOIN employees
ON members.member_emp_id = employees.emp_id
GROUP BY employees.emp_id
ORDER BY Kids desc
LIMIT 1;

-- End of Querie 6 


-- Start of Querie 7
-- Employee who has been transferred between the most departments.

SELECT concat(employees.emp_first_name ,' ', employees.emp_last_name ) AS 'Full Name',
		departments_hirings.dpr_hiring_emp_id AS "Employee ID",
		count(departments_hirings.dpr_hiring_id) AS Transfers 
FROM departments_hirings
JOIN employees
ON departments_hirings.dpr_hiring_emp_id = employees.emp_id
WHERE departments_hirings.dpr_hiring_end_date IS NULL
GROUP BY departments_hirings.dpr_hiring_emp_id,concat(employees.emp_first_name ,' ', employees.emp_last_name )
ORDER BY Transfers desc
LIMIT 1;

-- End of Querie 7


-- Start of Querie 8
-- Ship with the most delays compared to the scheduled arrival time.

SELECT ships.ship_name AS "Ship's Name",
		ship_trips.ship_trip_ship_id AS "Ship ID",
		count(ship_trips.ship_trip_id) AS "Delays"
FROM ship_trips
JOIN ships
ON ship_trips.ship_trip_ship_id = ships.ship_id
WHERE eta_arr_datetime < real_arr_datetime
GROUP BY ship_trips.ship_trip_ship_id, ships.ship_name
ORDER BY Delays desc
LIMIT 1;
    
    -- End of Querie 8