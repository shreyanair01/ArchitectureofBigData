#!/bin/bash

#echo shreya

# 1. Load batting.csv into a mysql in a database battingdb and table batting
mysql -uroot -pcloudera batting.sql

# 2. Sqoop the details into hdfs.
sqoop import --connect jdbc:mysql://localhost/battingdb --username root --password cloudera --table batting --m 1;

# 3. Sqoop the details into hive.
sqoop import --connect jdbc:mysql://localhost/battingdb --username root --password cloudera --table batting --m 1 --target-dir /HIVE --hive-import --create-hive-table --hive-table default.batting_table --m 1;

# 4. Implement pig script 
# a) Find the total count of participation of G 112
# b) Find the player details with "david" 
# c) Find the average count of "NL"
# d) Find the count of teams

pig -x local pig_batting.pig

# 5. Implement a Hive script
# a) Find the total count of player details with "david"
# b) Create a patition on the TEAMID
# c) Create 3 buckets on the partition.
# d) Extract the details on player "aaronha01"
# e) Find the count of teams

hive -f hive_batting.hql

# 6. Map reduce 
python total_players.py batting.csv
python total_teams.py batting.csv

# 7. Visualize
# Visualize the battings.csv based on the frequency of palyer inclusion yearwise.

# 8. From halloffame.csv
hive -f hive_halloffame.hql


# 9. Using hive,partition by year. Then, find the year wise count of participants, 
# find the total votes got by the players. 

# 10. Using python, map-reducer, find the average votes on the year 1936.