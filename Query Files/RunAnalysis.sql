-- How does teams rank high in attendance rank high in runs scored, runs allowed, and homeruns

-- Maximum Attendance by season Vs. Runs Scored (Ranked) --
-----------------------------------------------------------
-- determine how many seasons are included in the review --
select min(year) as BeginYear, team as Team, +2016-min(year)+1 as Seasons 
from runs 
group by Team 
having BeginYear<>1969 
order by BeginYear,Team;  
 
-- find highest attendance for each team and return team attendance and year with highest value 
select distinct year
from attendance 
order by year; 

-- rank season run scored records by team -- 
create view ordered as 
select team, year, Runs
from runs
order by team asc, Runs desc, year desc; 
 
SET @prev := null; 
SET @cnt := 0; 
 
create table ranked as 
SELECT team, year, Runs, IF(@prev <> team, @cnt := 1, @cnt := @cnt + 1) AS rank, @prev := team 
FROM ordered; 
 
select * from ranked; 
 
create view maxresults as
SELECT MAX(attendance) AS maxatt, team
FROM attendance
GROUP BY team;

CREATE VIEW MAXIMUMATTENDANCE AS
SELECT attendance.team, attendance.year, attendance.attendance, decade.decade
FROM attendance, maxresults, decade
WHERE attendance.attendance = maxresults.maxatt
AND attendance.team = maxresults.team
and attendance.year=decade.year;

-- find top runs scored records compared to season rank when top 10 season -- 
select m.team, m.year, m.attendance, r.Runs, r.rank 
from maximumattendance m join ranked r on m.team=r.team and m.year=r.year 
where rank <= 10
order by rank; 

 -- find top attendance records compared to season rank when NOT top 10 season 
create view outliers as 
select m.team, m.year, m.attendance, r.Runs, r.rank 
from maximumattendance m join ranked r on m.team=r.team and m.year=r.year 
where rank > 10
order by rank; 

-- Maximum Attendance by season Vs. Runs Allowed (Ranked) --
-----------------------------------------------------------
 
-- rank season run allowed records by team -- 
create view orderedRA as 
select team, year, Runs_Allowed
from runs
order by team asc, Runs_Allowed desc, year desc; 
 
SET @prev := null; 
SET @cnt := 0; 
 
create table ranked2 as 
SELECT team, year, Runs_Allowed, IF(@prev <> team, @cnt := 1, @cnt := @cnt + 1) AS rank, @prev := team 
FROM orderedRA; 
 
select * from ranked2; 

-- find top attendance records compared to season rank when top 10 season -- 
select m.team, m.year, m.attendance, r.Runs_Allowed, r.rank 
from maximumattendance m join ranked2 r on m.team=r.team and m.year=r.year 
where rank <= 10
order by rank; 

 -- find top attendance records compared to season rank when NOT top 10 season 
create view outliers2 as 
select m.team, m.year, m.attendance, r.Runs_Allowed, r.rank 
from maximumattendance m join ranked2 r on m.team=r.team and m.year=r.year 
where rank > 10
order by rank; 


-- Maximum Attendance by season Vs. Homeruns (Ranked) --
-----------------------------------------------------------
 
-- rank season Homeruns records by team -- 
create view orderedHR as 
select team, year, Homeruns
from runs
order by team asc, Homeruns desc, year desc; 
 
SET @prev := null; 
SET @cnt := 0; 
 
create table ranked3 as 
SELECT team, year, Homeruns, IF(@prev <> team, @cnt := 1, @cnt := @cnt + 1) AS rank, @prev := team 
FROM orderedHR; 
 
select * from ranked3; 

-- find top attendance records compared to season rank when top 10 season -- 
select m.team, m.year, m.attendance, r.Homeruns, r.rank 
from maximumattendance m join ranked3 r on m.team=r.team and m.year=r.year 
where rank <= 10
order by rank; 

 -- find top attendance records compared to season rank when NOT top 10 season 
create view outliers3 as 
select m.team, m.year, m.attendance, r.Homeruns, r.rank 
from maximumattendance m join ranked3 r on m.team=r.team and m.year=r.year 
where rank > 10
order by rank; 









