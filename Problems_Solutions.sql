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


-- Problem > https://www.hackerrank.com/challenges/weather-observation-station-5/problem
-- Difficulty > Easy
-- Subject > Weather Observation Station 5
-- Solution 
declare @minlen int = (select top 1 len(s.city) from station s order by len(s.city))
declare @maxlen int = (select top 1 len(s.city) from station s order by len(s.city) desc)
declare @id1 int = (select top 1 ss.id from station ss where len(ss.city) = @minlen order by ss.city) 
declare @id2 int = (select top 1 ss.id from station ss where len(ss.city) = @maxlen order by ss.city) 
select s.city, len(s.city) from station s where s.ID in 
(
    @id1,@id2
)


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


-- Problem > https://www.hackerrank.com/challenges/revising-the-select-query-2/problem
-- Difficulty > Easy
-- Subject > Revising the Select Query II
-- Solution 
select name from city where population > 120000 and countrycode = 'USA'


-- Problem > https://www.hackerrank.com/challenges/select-all-sql/problem
-- Difficulty > Easy
-- Subject > Select All
-- Solution 
select * from city


-- Problem > https://www.hackerrank.com/challenges/select-by-id/problem
-- Difficulty > Easy
-- Subject > Select By ID
-- Solution 
select * from city where ID = 1661


-- Problem > https://www.hackerrank.com/challenges/japanese-cities-attributes/problem
-- Difficulty > Easy
-- Subject > Japanese Cities' Attributes
-- Solution 
select * from city where countrycode = 'JPN'


-- Problem > https://www.hackerrank.com/challenges/japanese-cities-attributes/problem
-- Difficulty > Easy
-- Subject > Japanese Cities' Names
-- Solution 
select name from city where countrycode = 'JPN'


-- Problem > https://www.hackerrank.com/challenges/weather-observation-station-1/problem
-- Difficulty > Easy
-- Subject > Weather Observation Station 1
-- Solution 
select city,state from Station


-- Problem > https://www.hackerrank.com/challenges/weather-observation-station-1/problem
-- Difficulty > Easy
-- Subject > Weather Observation Station 1
-- Solution 
select city,state from Station


-- Problem > https://www.hackerrank.com/challenges/weather-observation-station-4/problem
-- Difficulty > Easy
-- Subject > Weather Observation Station 4
-- Solution 
select count(city) - count(distinct city) from station


-- Problem > https://www.hackerrank.com/challenges/weather-observation-station-6/problem
-- Difficulty > Easy
-- Subject > Weather Observation Station 6
-- Solution 
select distinct city from station where city like '[AEIOU]%'


-- Problem > https://www.hackerrank.com/challenges/weather-observation-station-7/problem
-- Difficulty > Easy
-- Subject > Weather Observation Station 7
-- Solution
select distinct city from station where city like '%[AEIOU]'


-- Problem > https://www.hackerrank.com/challenges/weather-observation-station-8/problem
-- Difficulty > Easy
-- Subject > Weather Observation Station 8
-- Solution
select distinct city from station where city like '[AEIOU]%[AEIOU]'


-- Problem > https://www.hackerrank.com/challenges/weather-observation-station-9/problem
-- Difficulty > Easy
-- Subject > Weather Observation Station 9
-- Solution
select distinct city from station where city not like '[AEUIO]%'


-- Problem > https://www.hackerrank.com/challenges/weather-observation-station-10/problem
-- Difficulty > Easy
-- Subject > Weather Observation Station 10
-- Solution
select distinct city from station where city not like '%[AEUIO]'


-- Problem > https://www.hackerrank.com/challenges/weather-observation-station-11/problem
-- Difficulty > Easy
-- Subject > Weather Observation Station 11
-- Solution
select distinct city from station where city not like '[AEIOU]%[AEIOU]'




