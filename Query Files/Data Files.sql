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
