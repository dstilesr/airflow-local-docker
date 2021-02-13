#!/bin/bash

export AIRFLOW__CORE__SQL_ALCHEMY_CONN=mysql+mysqlconnector://$MYSQL_USER:$MYSQL_PASSWORD@mysqldb:3306/$MYSQL_DATABASE

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

airflow scheduler
