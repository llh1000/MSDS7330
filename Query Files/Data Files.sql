use msdsbaseball

----define tables
create table `attendance`	
(	`TEAM` varchar(3),
	`YEAR` numeric,
    `ATTENDANCE` numeric
)
;

LOAD DATA LOCAL INFILE C:/Users/Kelly/Documents/SMU/DATABASE/baseball/attendance.csv into table attendance
fields terminated by ",";

select * from attendance;

create table `ballparks`
(	`TEAM` varchar(3),
	`FRANCHISE` varchar(35),
    `NAME` varchar (35),
    `BALLPARK` varchar (35),
    `BEGIN_YEAR` int,
    `END_YEAR` int
)
;

LOAD DATA LOCAL INFILE C:/Users/Kelly/Documents/SMU/DATABASE/baseball/ballparks.csv into table ballparks
fields terminated by ",";

select* from ballparks;

create table `divisions`
(	`TEAM` varchar(3),
	`LEAGUE` varchar(35),
    `DIVISION` varchar (35),
    `BEGIN_YEAR` int,
    `END_YEAR` int
)
;

LOAD DATA LOCAL INFILE C:/Users/Kelly/Documents/SMU/DATABASE/baseball/divisions.csv into table divisions
fields terminated by ",";

select* from divisions;

create table `wins`	
(	`TEAM` varchar(3),
	`YEAR` numeric,
    `WINS` numeric,
    `TOTAL` numeric
)
;

LOAD DATA LOCAL INFILE C:/Users/Kelly/Documents/SMU/DATABASE/baseball/wins.csv into table wins
fields terminated by ",";
---end creating tables
