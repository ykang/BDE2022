#! /usr/bin/sh

hadoop fs -rm -r /user/yanfei/output/

hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.2.1.jar \
    -input /data/apat63_99.txt \
    -output /user/yanfei/output \
    -file mapper.py reducer.py \
    -mapper "python3 mapper.py" \
    -reducer "python3 reducer.py" 
