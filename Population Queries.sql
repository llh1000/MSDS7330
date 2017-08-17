CREATE SCHEMA `mlb_attendance`;
use mlb_attendance;

create table `metro_areas`	
(	`TEAM` varchar(25),
	`METRO_AREA` varchar(50)
)
;

LOAD DATA LOCAL INFILE "C:/Users/Dan Freeman/Documents/Southern Methodist University - MS in Data Science/Courses/Summer 2017/MSDS 7330 File Organization and Database Management/Group Project/Metro_Areas.txt" into table metro_areas
fields terminated by "	";

select * from metro_areas;

create table `populations`
(	`TEAM` varchar(25),
    `YEAR` numeric,
    `PERIOD` varchar(25),
	`POPULATION` numeric
)
;

LOAD DATA LOCAL INFILE "C:/Users/Dan Freeman/Documents/Southern Methodist University - MS in Data Science/Courses/Summer 2017/MSDS 7330 File Organization and Database Management/Group Project/Metro_Area_Populations.csv" into table populations
fields terminated by ",";

select * from populations;

create table population_attendance as
select p.team, p.year, p.period, p.population, a.attendance
from populations p join attendance a on p.team=a.team and p.year=a.year;

select * from population_attendance; 

CREATE VIEW avg_att as
SELECT team, avg(Attendance) as Avg_Attendance
FROM population_attendance
GROUP BY team
ORDER BY Avg_Attendance Desc;

select * from avg_att; 

CREATE VIEW avg_pop as
SELECT team, avg(Population) as Avg_Population
FROM population_attendance
GROUP BY team
ORDER BY Avg_Population Desc;

select * from avg_pop; 

SET @prev_value = NULL;
SET @rank_count = 0;
CREATE TABLE avg_att_ranked as
SELECT team, Avg_Attendance, CASE
    WHEN @prev_value = Avg_Attendance THEN @rank_count
    WHEN @prev_value := Avg_Attendance THEN @rank_count := @rank_count + 1
END AS rank_att
FROM avg_att
ORDER BY Avg_Attendance Desc;

select * from avg_att_ranked;

SET @prev_value = NULL;
SET @rank_count = 0;
CREATE TABLE avg_pop_ranked as
SELECT team, Avg_Population, CASE
    WHEN @prev_value = Avg_Population THEN @rank_count
    WHEN @prev_value := Avg_Population THEN @rank_count := @rank_count + 1
END AS rank_pop
FROM avg_pop
ORDER BY Avg_Population Desc;

select * from avg_pop_ranked;

create table avg_att_pop_ranked as
select a.team, a.Avg_Attendance, a.rank_att, p.Avg_Population, p.rank_pop
from avg_att_ranked a join avg_pop_ranked p on a.team=p.team
order by avg_attendance desc;

select * from avg_att_pop_ranked;

CREATE VIEW avg_att_by_period as
SELECT team, period, avg(Attendance) as Avg_Attendance
FROM population_attendance
GROUP BY team, period
ORDER BY Period, Avg_Attendance Desc;

select * from avg_att_by_period; 
drop view avg_att_by_period;

CREATE VIEW avg_pop_by_period as
SELECT team, period, avg(Population) as Avg_Population
FROM population_attendance
GROUP BY team, period
ORDER BY Period, Avg_Population Desc;

select * from avg_pop_by_period; 
drop view avg_pop_by_period;

create table avg_att_pop_by_period as
select a.team, a.period, a.Avg_Attendance, p.Avg_Population
from avg_att_by_period a join avg_pop_by_period p on a.team=p.team AND a.period=p.period
order by a.period, a.avg_attendance desc;

select * from avg_att_pop_by_period; 

/* 2000-2004 */
create table avg_att_pop_2000_2004 as
select team, period, Avg_Attendance, Avg_Population
from avg_att_pop_by_period
where period = '2000-2004';

select * from avg_att_pop_2000_2004; 

SET @prev_value = NULL;
SET @rank_count = 0;
CREATE TABLE avg_att_ranked_2000_2004 as
SELECT team, period, Avg_Attendance, Avg_Population, CASE
    WHEN @prev_value = Avg_Attendance THEN @rank_count
    WHEN @prev_value := Avg_Attendance THEN @rank_count := @rank_count + 1
END AS rank_att
FROM avg_att_pop_2000_2004
ORDER BY Avg_Attendance Desc;

select * from avg_att_ranked_2000_2004;

SET @prev_value = NULL;
SET @rank_count = 0;
CREATE TABLE avg_att_pop_ranked_2000_2004 as
SELECT team, period, Avg_Attendance, rank_att, Avg_Population, CASE
    WHEN @prev_value = Avg_Population THEN @rank_count
    WHEN @prev_value := Avg_Population THEN @rank_count := @rank_count + 1
END AS rank_pop
FROM avg_att_ranked_2000_2004
ORDER BY Avg_Population Desc;

select * from avg_att_pop_ranked_2000_2004;

/* 2005-2009 */
create table avg_att_pop_2005_2009 as
select team, period, Avg_Attendance, Avg_Population
from avg_att_pop_by_period
where period = '2010-2016';

select * from avg_att_pop_2005_2009; 

SET @prev_value = NULL;
SET @rank_count = 0;
CREATE TABLE avg_att_ranked_2005_2009 as
SELECT team, period, Avg_Attendance, Avg_Population, CASE
    WHEN @prev_value = Avg_Attendance THEN @rank_count
    WHEN @prev_value := Avg_Attendance THEN @rank_count := @rank_count + 1
END AS rank_att
FROM avg_att_pop_2005_2009
ORDER BY Avg_Attendance Desc;

select * from avg_att_ranked_2005_2009;

SET @prev_value = NULL;
SET @rank_count = 0;
CREATE TABLE avg_att_pop_ranked_2005_2009 as
SELECT team, period, Avg_Attendance, rank_att, Avg_Population, CASE
    WHEN @prev_value = Avg_Population THEN @rank_count
    WHEN @prev_value := Avg_Population THEN @rank_count := @rank_count + 1
END AS rank_pop
FROM avg_att_ranked_2005_2009
ORDER BY Avg_Population Desc;

select * from avg_att_pop_ranked_2005_2009;

/* 2010-2016 */
create table avg_att_pop_2010_2016 as
select team, period, Avg_Attendance, Avg_Population
from avg_att_pop_by_period
where period = '2010-2016';

select * from avg_att_pop_2010_2016; 

SET @prev_value = NULL;
SET @rank_count = 0;
CREATE TABLE avg_att_ranked_2010_2016 as
SELECT team, period, Avg_Attendance, Avg_Population, CASE
    WHEN @prev_value = Avg_Attendance THEN @rank_count
    WHEN @prev_value := Avg_Attendance THEN @rank_count := @rank_count + 1
END AS rank_att
FROM avg_att_pop_2010_2016
ORDER BY Avg_Attendance Desc;

select * from avg_att_ranked_2010_2016;

SET @prev_value = NULL;
SET @rank_count = 0;
CREATE TABLE avg_att_pop_ranked_2010_2016 as
SELECT team, period, Avg_Attendance, rank_att, Avg_Population, CASE
    WHEN @prev_value = Avg_Population THEN @rank_count
    WHEN @prev_value := Avg_Population THEN @rank_count := @rank_count + 1
END AS rank_pop
FROM avg_att_ranked_2010_2016
ORDER BY Avg_Population Desc;

select * from avg_att_pop_ranked_2010_2016;