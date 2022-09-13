hadoop fs -rm -r /user/yanfei/output
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.2.1.jar \
    -input /user/yanfei/hadoop.ipynb \
    -output /user/yanfei/output \
    -file mapper.py reducer.py \
    -mapper "python3 mapper.py" \
    -reducer "python3 reducer.py"
