#!/bin/bash

# Initialize db
if [ -f $(pwd)/airflow/dbcheck.txt ]
then
  echo "DB ALREADY STARTED"
else
  # Wait for SQL to initialize
  python wait_mysql.py

  echo "STARTING DB"
  airflow db init \
    && airflow users create \
      --username admin\
      --firstname Admin\
      --lastname user\
      --email email@example.com\
      --password $AIRFLOW_ADMIN_PW\
      --role Admin\
    && echo "INITIALIZED" > $(pwd)/airflow/dbcheck.txt
fi

# Cleanup old pid files
rm -f airflow/*.pid

# Start scheduler and server
airflow scheduler -D
airflow webserver
