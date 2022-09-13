#! /bin/sh

PYSPARK_PYTHON=python3.6 spark-submit \
	      --master yarn \
	      linecount.py


