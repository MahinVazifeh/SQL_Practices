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



-- Problem > https://www.hackerrank.com/challenges/weather-observation-station-12/problem
-- Difficulty > Easy
-- Subject > Weather Observation Station 12
-- Solution
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(LEFT(CITY, 1)) NOT IN ('a', 'e', 'i', 'o', 'u')
AND LOWER(RIGHT(CITY, 1)) NOT IN ('a', 'e', 'i', 'o', 'u');


-- Problem > https://www.hackerrank.com/challenges/more-than-75-marks/problem
-- Difficulty > Easy
-- Subject > Higher Than 75 Marks
-- Solution
select Name from Students where Marks > 75 order by RIGHT(Name, 3),ID


-- Problem > https://www.hackerrank.com/challenges/name-of-employees/problem
-- Difficulty > Easy
-- Subject > Employee Names
-- Solution
select name from Employee order by name asc


-- Problem > https://www.hackerrank.com/challenges/salary-of-employees/problem
-- Difficulty > Easy
-- Subject > Employee Salaries
-- Solution
select name from employee where salary > 2000 and months < 10 order by employee_id asc



-- Problem > https://www.hackerrank.com/challenges/what-type-of-triangle/problem
-- Difficulty > Advanced
-- Subject > Type of Triangle
-- Solution
SELECT 
  CASE 
    WHEN A + B > C AND A + C > B AND B + C > A THEN
      CASE 
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN A = B OR A = C OR B = C THEN 'Isosceles'
        ELSE 'Scalene'
      END
    ELSE 'Not A Triangle'
  END AS TriangleType
FROM TRIANGLES;




-- Problem > https://www.hackerrank.com/challenges/the-pads/problem
-- Difficulty > Advanced
-- Subject > The PADS
-- Solution
declare @temp table (oo nvarchar(500) , id int)
insert into @temp
select o.Name + ' (' + LEFT(o.occupation, 1) + ')' , 0 from Occupation o order by o.Name

--=======================================
declare @Count_occupation nvarchar(10)
declare @CountO int

declare  CrTemp cursor for select distinct Lower(o.Occupation),count(Lower(o.Occupation)) from occupation o 
group by Lower(o.Occupation)
order by count(Lower(o.Occupation))
open CrTemp
fetch next from CrTemp into @Count_occupation,@CountO
while @@fetch_status=0
begin
insert into @temp
values('There are a total of ' + cast(@CountO as nvarchar(10)) + ' ' + @Count_occupation + 's.' , 1)
fetch next from CrTemp into @Count_occupation,@CountO
end
deallocate CrTemp
select oo from @temp order by id,oo











