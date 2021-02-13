#!/bin/bash

export AIRFLOW__CORE__SQL_ALCHEMY_CONN=mysql+mysqlconnector://$MYSQL_USER:$MYSQL_PASSWORD@mysqldb:3306/$MYSQL_DATABASE

sleep 1m

# Initialize db
python wait_mysql.py

# Cleanup old pid files
rm -f airflow/airflow-webserver.pid

airflow webserver
