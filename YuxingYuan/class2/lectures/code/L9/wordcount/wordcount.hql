use yanfeikang;

CREATE EXTERNAL TABLE fruits (line STRING);
LOAD DATA INPATH '/user/yanfei/fruits' OVERWRITE INTO TABLE fruits;
CREATE TABLE IF NOT EXISTS fruit_counts AS
    SELECT name, count(*) AS count from
        (SELECT explode(split(line, ' ')) AS name FROM fruits) w
    GROUP BY name
    ORDER BY name;
