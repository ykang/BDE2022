hadoop fs -rm -r /user/yanfei/output
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.2.1.jar \
    -input /user/yanfei/fruits \
    -output /user/yanfei/output \
    -mapper "/usr/bin/cat" \
    -reducer "/usr/bin/wc" 
