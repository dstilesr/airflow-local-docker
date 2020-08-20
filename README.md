# Airflow Local Docker

## Contents
* [About](#about)
* [Use](#use)
  * [Environment](#environment)
  * [Run with docker-compose](#run-with-docker-compose)
* [Built With](#built-with)
* [Issues and Suggestions](#issues-and-suggestions)

## About
This project is a docker setup with MySQL and Apache Airflow in order to test
Airflow applications locally without much hassle regarding installation and setup of
Airflow.

## Use

To use this project, first put your DAG definitions, plugins, etc. in the `airflow`
folder.

### Environment
The project requires a `.env` file with the following variables:
```.env
MYSQL_ROOT_PASSWORD=
MYSQL_DATABASE=
MYSQL_USER=
MYSQL_PASSWORD=
AIRFLOW__CORE__SQL_ALCHEMY_CONN=
AIRFLOW__CORE__EXECUTOR=LocalExecutor
```
The variables `MYSQL_ROOT_PASSWORD, MYSQL_PASSWORD, MYSQL_USER, MYSQL_DATABASE`
are required to start the MySQL container, and 
`AIRFLOW__CORE__SQL_ALCHEMY_CONN, AIRFLOW__CORE__EXECUTOR` are there to configure
the Airflow. The SQLAlchemy URL must use the user, password, db already specified.
The host is the MySQL container.

### Run with docker-compose
To run with docker-compose just run
```shell script
docker-compose up --build
```
This will build a MySQL container to support the application as well as
setup the airflow itself.

## Built With
- [Docker](https://www.docker.com/)
- [Python](https://www.python.org/)
- [Apache Airflow](https://airflow.apache.org/)

## Issues and Suggestions
[Use this link.](https://github.com/dstilesr/airflow-local-docker/issues)

[Back to top](#airflow-local-docker)
