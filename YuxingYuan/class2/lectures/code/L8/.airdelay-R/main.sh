#! /usr/bin/sh

hadoop fs -rm -r /user/yanfei/output/

hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.1.3.jar \
    -input /data/airdelay_small.csv \
    -output /user/yanfei/output \
    -jobconf mapred.map.tasks=10 \
    -jobconf mapred.reduce.tasks=5 \
    -jobconf stream.reduce.output.field.separator=. \
    -jobconf stream.num.reduce.output.fields=2 \
    -file mapper.R \
    -file reducer.R \
    -mapper "Rscript mapper.R" \
    -reducer "Rscript reducer.R"
