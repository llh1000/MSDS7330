--sample select code to test out team names and changes---
--select * from attendance
--where team = 'texas rangers';

--select team
--from attendance
--group by team;

alter table attendance modify column team varchar(50) not null;

SET SQL_SAFE_UPDATES = 0;

update attendance
set team = 'Arizona Diamondbacks' where team = 'ARZ';
update attendance
set team = 'Atlanta Braves' where team = 'ATL';
update attendance
set team = 'Baltimore Orioles' where team = 'BAL';
update attendance
set team = 'Boston Red Sox' where team = 'BOS';
update attendance
set team = 'Chicago Cubs' where team = 'CHC';
update attendance
set team = 'Chicago White Sox' where team = 'CHW';
update attendance
set team = 'Cincinnati Reds' where team = 'CIN';
update attendance
set team = 'Cleveland Indians' where team = 'CLE';
update attendance
set team = 'Colorado Rockies' where team = 'COL';
update attendance
set team = 'Detroit Tigers' where team = 'DET';
update attendance
set team = 'Miami Marlins' where team = 'FLA';
update attendance
set team = 'Houston Astros' where team = 'HOU';
update attendance
set team = 'Kansas City Royals' where team = 'KCR';
update attendance
set team = 'Los Angeles Angels' where team = 'LAA';
update attendance
set team = 'Los Angeles Dodgers' where team = 'LAD';
update attendance
set team = 'Milwaukee Brewers' where team = 'MIL';
update attendance
set team = 'Minnesota Twins' where team = 'MIN';
update attendance
set team = 'Washington Nationals' where team = 'MTL';
update attendance
set team = 'New York Mets' where team = 'NYM';
update attendance
set team = 'New York Yankees' where team = 'NYY';
update attendance
set team = 'Oakland Athletics' where team = 'OAK';
update attendance
set team = 'Philadelphia Phillies' where team = 'PHI';
update attendance
set team = 'Pittsburgh Pirates' where team = 'PIT';
update attendance
set team = 'San Diego Padres' where team = 'SDP';
update attendance
set team = 'Seattle Mariners' where team = 'SEA';
update attendance
set team = 'Milwaukee Brewers' where team = 'SEP';
update attendance
set team = 'San Francisco Giants' where team = 'SFG';
update attendance
set team = 'St. Louis Cardinals' where team = 'STL';
update attendance
set team = 'Tampa Bay Rays' where team = 'TBR';
update attendance
set team = 'Texas Rangers' where team = 'TEX';
update attendance
set team = 'Toronto Blue Jays' where team = 'TOR';
update attendance
set team = 'Texas Rangers' where team = 'WAS';
update attendance
set team = 'Washington Nationals' where team = 'WSN';
