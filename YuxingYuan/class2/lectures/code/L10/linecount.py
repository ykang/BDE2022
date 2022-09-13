#! /bin/env python3.6

import pyspark
spark = pyspark.sql.SparkSession.builder.appName("My Spark App").getOrCreate()
sc = spark.sparkContext

airFile = sc.textFile("../../data/airdelay_small.csv")
airLengths = airFile.map(lambda s: len(s)).reduce(lambda a, b: a + b)
print (airLengths)
