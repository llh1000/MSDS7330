---calculate percent won from win table---

create view percent as
select team, year, wins, total, wins/total as "percentwon" from wins;

select * from percent;

---****determine how many seasons are included in the review****---
select min(year) as BeginYear, team as Team, +2016-min(year)+1 as Seasons
from wins
group by Team
having BeginYear<>1969
order by BeginYear,Team;

--find highest attendance for each team and return team attendance and year with highest value
--- add decade table
select distinct year from attendance
order by year;

create view maxresults as
SELECT MAX(attendance) AS maxatt, team
FROM attendance
GROUP BY team;
--- drop view maximumattendance;
CREATE VIEW MAXIMUMATTENDANCE AS
SELECT attendance.team, attendance.year, attendance.attendance, decade.decade
FROM attendance, maxresults, decade
WHERE attendance.attendance = maxresults.maxatt
AND attendance.team = maxresults.team
and attendance.year=decade.year;


--- ****look at distribution of highest attendance year----
select year, count(team) from maximumattendance
group by year;

SELECT decade, count(team) FROM MAXIMUMATTENDANCE
group by decade;


--- rank season winning records by team---
create view ordered as
select team, year, percentwon
from percent
order by team asc, percentwon desc, year desc;

select * from ordered;

SET @prev := null;
SET @cnt := 0;

create table ranked as
SELECT team, year, percentwon, IF(@prev <> team, @cnt := 1, @cnt := @cnt + 1) AS rank, @prev := team
FROM ordered;

select * from ranked;

--- *** find top attendance records compared to season rank when top 10 season***---
select m.team, m.year, m.attendance, r.percentwon, r.rank
from maximumattendance m join ranked r on m.team=r.team and m.year=r.year
where rank <= 10;

---find top attendance records compared to season rank when NOT top 10 season
create view outliers as
select m.team, m.year, m.attendance, r.percentwon, r.rank
from maximumattendance m join ranked r on m.team=r.team and m.year=r.year
where rank > 10;

--find which of those outliers record attendance corresponds with new franchise and identify changes in franchises
create view francstart as
select team, concat(franchise," ",name) as franch, min(begin_year) as franstart from ballparks
group by franch;

---****Display duplicate franchise records****---

SELECT  team as Franchise, franch as TeamName, franstart as BeginningYear
FROM    francstart mto
WHERE   EXISTS
        (
        SELECT  1
        FROM    francstart mti
        WHERE   mti.team = mto.team
        LIMIT 1, 1
        )
order by Franchise, BeginningYear;

---- ***new franchises****-----
create view newfranch as
select o.team as Team, o.year as Year, o.attendance as Attendance, o.percentwon as WinningPercent, o.rank as SeasonRank, f.franstart as FranchiseStart
from outliers o join francstart f on f.team=o.team
where o.year=f.franstart;

---remaining outliers with winning records
--drop view outlier2;
create view outlier2 as
select * 
from outliers
where team not in (Arizona Diamondbacks, Colorado Rockies, Miami Marlins, Tampa Bay Rays,Washington Nationals)
and percentwon > .5;

select * from outliers;
select * from newfranch;
select * from outlier2;
select * from outliers
where team in (St. Louis Cardinals,Detroit Tigers);

----remaining teams St. Louis Cardinals 2007 following 2006 WSW and Detroit Tigers appears
