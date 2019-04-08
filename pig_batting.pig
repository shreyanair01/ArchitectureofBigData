batting_list = LOAD '/home/cloudera/ABD/ASSIGNMENT/Batting.csv' USING PigStorage(',') as (playerID:chararray,yearID:int,stint:int,teamID:chararray,lgID:chararray,G:int,G_batting:int,AB:int,R:int,H:int,B2:int,B3:int,HR:int,RBI:int,SB:int,CS:int,BB:int,SO:int,IBB:int,HBP:int,SH:int,SF:int,GIDP:int,G_old:int);


dump batting_list;

count_g = FILTER batting_list BY G == 112;
group_count_g  = GROUP count_g All;
total_count = foreach group_count_g Generate COUNT(count_g.G);
store total_count into 'Total_Count'


player_david  = Filter batting_list by(playerID MATCHES 'david.*');
store player_david into 'David_player_name';

NL_filter = Filter batting_list by lgID =='NL';
NL_Group = Group NL_filter All;
NL_avg = foreach NL_Group Generate AVG(NL_filter.G_batting);
store NL_avg into 'Average_count_NL';

B = FOREACH batting_list GENERATE FLATTEN (TOKENIZE(teamID));
C = GROUP B BY $0 ;
D = FOREACH C GENERATE group, COUNT(B) ;
STORE D INTO 'Team_count' ;
