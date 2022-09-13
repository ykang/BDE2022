use yanfeikang;


CREATE TABLE if not exists u_data_new (
  userid INT,
  movieid INT,
  rating INT,
  weekday INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

CREATE TABLE if not exists u_data (
  userid INT,
  movieid INT,
  rating INT,
  unixtime INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

LOAD DATA INPATH '/user/yanfei/u.data'
OVERWRITE INTO TABLE u_data;

add FILE hdfs:///user/yanfei/weekday_mapper.py;

INSERT OVERWRITE TABLE u_data_new
SELECT
  TRANSFORM (userid, movieid, rating, unixtime)
  USING 'python3 weekday_mapper.py'
  AS (userid, movieid, rating, weekday)
FROM u_data;

SELECT weekday, COUNT(*)
FROM u_data_new
GROUP BY weekday;
