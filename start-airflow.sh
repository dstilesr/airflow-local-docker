#!/bin/bash

# Start database
airflow initdb

# Start scheduler and server
airflow scheduler -D
airflow webserver

