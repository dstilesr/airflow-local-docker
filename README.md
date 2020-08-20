# Airflow Local Docker

## Contents
* [About](#about)
* [Use](#use)
  * [Run with docker-compose](#run-with-docker-compose)
  

## About
This project is a docker setup with MySQL and Apache Airflow in order to test
Airflow applications locally without much hassle regarding installation and setup of
Airflow.

## Use

To use this project, first put your DAG definitions, plugins, etc. in the `airflow`
folder.

### Run with docker-compose
To run with docker-compose just run
```shell script
docker-compose up --build
```
This will build a MySQL container to support the application as well as
setup the airflow itself.

[Back to top](#airflow-local-docker)
