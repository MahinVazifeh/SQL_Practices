-- Problem > https://www.hackerrank.com/challenges/weather-observation-station-20/problem
-- Difficulty > Medium 
-- Subject > Weather Observation Station 20
-- Solution 

SELECT CAST(ROUND(
    (
        (
            SELECT MAX(LAT_N)
            FROM (
                SELECT TOP 50 PERCENT LAT_N
                FROM station
                ORDER BY LAT_N
            ) AS BottomHalf
        )
        +
        (
            SELECT MIN(LAT_N)
            FROM (
                SELECT TOP 50 PERCENT LAT_N
                FROM station
                ORDER BY LAT_N DESC
            ) AS TopHalf
        )
    ) / 2, 4) AS DECIMAL(10, 4));

Go 

-- Problem > https://www.hackerrank.com/challenges/weather-observation-station-5/problem
-- Difficulty > Easy
-- Subject > Weather Observation Station 5
-- Solution 

select distinct top 1(city), len(city) from station
where len(city) = 3
select distinct(city), len(city) from station
where len(city) = 21

Go 

-- Problem > https://www.hackerrank.com/challenges/the-company/problem
-- Difficulty > Medium
-- Subject > New Companies
-- Solution 

select 
	emp.company_code, 
	founder,

	Count(Distinct lead_manager_code), 
	Count(Distinct senior_manager_code),
	Count(Distinct manager_code),
	Count(Distinct employee_code)

from Employee as emp
Left join company as com on emp.company_code = com.company_code
GROUP BY emp.company_code, com.founder



