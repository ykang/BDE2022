#! /usr/bin/sh

hadoop fs -rm -r /user/yanfei/output/


hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.2.1.jar \
    -input /data/apat63_99.txt \
    -output /user/yanfei/output \
    -file mapper.py \
    -mapper "python3 mapper.py 8" \
    -reducer "python3 mapper.py 0" \
    -numReduceTasks 1  
