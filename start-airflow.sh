#!/bin/bash

# Initialize db
if [ -f /home/airflow_user/airflow/dbcheck.txt ]
then
  echo "DB ALREADY STARTED"
else
  echo "STARTING DB"
  airflow initdb
  echo "INITIALIZED" > /home/airflow_user/airflow/dbcheck.txt
fi

# Cleanup old pid files
rm -f airflow/*.pid

# Start scheduler and server
airflow scheduler -D
airflow webserver
