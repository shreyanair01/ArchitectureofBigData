

create database battingdb;

use battingdb;



create table batting(playerID varchar(30),yearID int,stint int,teamID varchar(10),lgID varchar(10),G int,G_batting int,AB int,R int,H int,B2 int,B3 int,HR int,RBI int,SB int,CS int,BB int,SO int,IBB int,HBP int,SH int,SF int,GIDP int,G_old int);

Load data infile '/user/shreyanairtsoi2493/ABD_ASSIGNMENT/Batting.csv' into table batting fields terminated by ',' Lines terminated by '\n';