-- Create a table for attendance --
-----------------------------------
create table `attendance`	
(	`TEAM` 		varchar(3),
	`YEAR` 		numeric,
    	`ATTENDANCE` 	numeric
	);

-- Populate the attendance table and check --
--------------------------------------------
LOAD DATA LOCAL INFILE 'C:/MySQL/TermProject/attendance.txt' into table attendance fields terminated by ',';
select * from attendance;

-- Create a table for ballparks --
-----------------------------------
create table `ballparks`
(	`TEAM` 		varchar(3),
	`FRANCHISE` 	varchar(35),
    	`NAME` 		varchar (35),
    	`BALLPARK` 	varchar (35),
   	 `BEGIN_YEAR` 	int,
   	 `END_YEAR` 	int
    );

-- Populate the ballparks table and check --
--------------------------------------------
LOAD DATA LOCAL INFILE 'C:/MySQL/TermProject/Ballparks.txt' into table ballparks fields terminated by ',';
select* from ballparks;

-- Create a table for divisions  --
-----------------------------------
create table `divisions`
(	`TEAM` 		varchar(3),
	`LEAGUE` 	varchar(35),
    	`DIVISION` 	varchar (35),
    	`BEGIN_YEAR` 	int,
    	`END_YEAR` 	int
	)
;

-- Populate the divisions table and check --
--------------------------------------------
LOAD DATA LOCAL INFILE 'C:/MySQL/TermProject/divisions.txt' into table divisions fields terminated by ',';
select* from divisions;

----- Create a table for wins  -----
------------------------------------
create table `wins`	
(	`TEAM` 		varchar(3),
	`YEAR` 		numeric,
   	 `WINS` 	numeric,
    	`TOTAL` 	numeric
    )
;

-- Populate the wins tabe and check --
--------------------------------------
LOAD DATA LOCAL INFILE 'C:/MySQL/TermProject/wins.txt' into table wins fields terminated by ',';
select * from wins;

----- Create a table for Runs  -----
------------------------------------
create table `runs`
(	`Year` 				numeric,
	`Team`				varchar(25),
   	`League` 			varchar(2),
    	`Games`				numeric,
   	`Runs`				numeric,
   	`Runs_Allowed`			numeric,
   	`Hits`				numeric,
    	`Homeruns`			numeric,
    	`Average_Runs` 			numeric,
    	`Average_Runs_Allowed`		numeric,
   	 `Average_Hits`			numeric,
    	`Average_Homeruns` 		numeric
    )
;

-- Populate the runs tabe and check ------
------------------------------------------
LOAD DATA LOCAL INFILE 'C:/MySQL/TermProject/BaseballData.txt' into table runs fields terminated by ',';
select * from runs;

----- Create a table for Metro Areas  -----
-------------------------------------------
create table `metro_areas`	
(	`TEAM` varchar(25),
	`METRO_AREA` varchar(50)
)
;

-- Populate the Metro Areas table and check ------
-------------------------------------------------
LOAD DATA LOCAL INFILE "C:/Users/Dan Freeman/Documents/Southern Methodist University - MS in Data Science/Courses/Summer 2017/MSDS 7330 File Organization and Database Management/Group Project/Metro_Areas.txt" into table metro_areas fields terminated by ",";

----- Create a table for Populations  -----
-------------------------------------------
create table `populations`
(	`TEAM` 		varchar(25),
    	`YEAR` 		numeric,
    `	PERIOD` 	varchar(25),
	`POPULATION` 	numeric
)
;

-- Populate the Populaitons table and check ------
--------------------------------------------------
LOAD DATA LOCAL INFILE "C:/Users/Dan Freeman/Documents/Southern Methodist University - MS in Data Science/Courses/Summer 2017/MSDS 7330 File Organization and Database Management/Group Project/Metro_Area_Populations.csv" into table populations
fields terminated by ",";

select * from populations;

----- Create a table for Decades  -----
---------------------------------------
create table decade
(year numeric, 
decade varchar(10)
);

-- Populate the Decades table and check ------
----------------------------------------------
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
