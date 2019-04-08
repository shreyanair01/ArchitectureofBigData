select count(*) from batting_table where playerID like 'david%';

create table teamID_Partition(playerID varchar(30),yearID int,stint int,lgID varchar(10),G int,G_batting int,AB int,R int,H int, B2 int, B3 int,HR int,RBI int,SB int,CS int,BB int,SO int,IBB int,HBP int,SH int,SF int,GIDP int,G_old int) partitioned by (teamID varchar(10)) CLUSTERED BY yearID INTO 3 buckets row format delimited fields terminated by ',' stored as textfile;

set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.dynamic.partition=true;
set hive.enforce.bucketing=true;
set hive.exec.max.dynamic.partitions=2048;
set hive.exec.max.dynamic.partitions.pernode=256;

from batting_table bt INSERT OVERWRITE TABLE teamID_Partition PARTITION(teamID) select bt.playerID, bt.yearID, bt.stint, bt.teamID, bt.lgID, bt.G, bt.G_batting, bt.AB, bt.R, bt.H, bt.B2, bt.B3, bt.HR, bt.RBI, bt.SB, bt.CS, bt.BB, bt.SO, bt.IBB, bt.HBP, bt.SH, bt.SF, bt.GIDP, bt.G_old DISTRIBUTE by teamID;

select * from teamID_partition where playerID like 'aaronha01';

select count(DISTINCT(teamID)) from teamID_partition;

