---calculate percent won from win table---

create view percent as
select team, year, wins, total, wins/total as "percentwon" from wins;

select * from percent;

---****determine how many seasons are included in the review****---
select min(year) as BeginYear, team as Team, +2006-min(year)+1 as Seasons
from wins
group by Team
having BeginYear<>1969
order by BeginYear,Team;

--find highest attendance for each team and return team attendance and year with highest value
--- add decade table
select distinct year from attendance
order by year;

create table decade
(year numeric, 
decade varchar(10)
);
insert into decade values(1960,'1970s');
insert into decade values(1970,'1970s');
insert into decade values(1971,'1970s');
insert into decade values(1972,'1970s');
insert into decade values(1973,'1970s');
insert into decade values(1974,'1970s');
insert into decade values(1975,'1970s');
insert into decade values(1976,'1970s');
insert into decade values(1977,'1970s');
insert into decade values(1978,'1970s');
insert into decade values(1979,'1970s');
insert into decade values(1980,'1980s');
insert into decade values(1981,'1980s');
insert into decade values(1982,'1980s');
insert into decade values(1983,'1980s');
insert into decade values(1984,'1980s');
insert into decade values(1985,'1980s');
insert into decade values(1986,'1980s');
insert into decade values(1987,'1980s');
insert into decade values(1988,'1980s');
insert into decade values(1989,'1980s');
insert into decade values(1990,'1990s');
insert into decade values(1991,'1990s');
insert into decade values(1992,'1990s');
insert into decade values(1993,'1990s');
insert into decade values(1994,'1990s');
insert into decade values(1995,'1990s');
insert into decade values(1996,'1990s');
insert into decade values(1997,'1990s');
insert into decade values(1998,'1990s');
insert into decade values(1999,'1990s');
insert into decade values(2000,'2000s');
insert into decade values(2001,'2000s');
insert into decade values(2002,'2000s');
insert into decade values(2003,'2000s');
insert into decade values(2004,'2000s');
insert into decade values(2005,'2000s');
insert into decade values(2006,'2000s');
insert into decade values(2007,'2000s');
insert into decade values(2008,'2000s');
insert into decade values(2009,'2000s');
insert into decade values(2010,'2010s');
insert into decade values(2011,'2010s');
insert into decade values(2012,'2010s');
insert into decade values(2013,'2010s');
insert into decade values(2014,'2010s');
insert into decade values(2015,'2010s');
insert into decade values(2016,'2010s');

select * from decade;

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