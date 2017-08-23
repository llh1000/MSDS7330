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

----- Create a table for Population  -----
------------------------------------------
create table `metro_areas`	
(	`TEAM` varchar(25),
	`METRO_AREA` varchar(50)
)
;

-- Populate the runs tabe and check ------
------------------------------------------
LOAD DATA LOCAL INFILE "C:/Users/Dan Freeman/Documents/Southern Methodist University - MS in Data Science/Courses/Summer 2017/MSDS 7330 File Organization and Database Management/Group Project/Metro_Areas.txt" into table metro_areas fields terminated by ",";


