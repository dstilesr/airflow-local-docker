FROM python:3.8

LABEL project=airflow-local-docker \
      version=0.1 \
      author=dstilesr

EXPOSE 8080

WORKDIR /home/airflow_files

COPY ./ .

RUN pip install --no-cache-dir -r requirements.txt
ENV AIRFLOW_HOME=/home/airflow_files/airflow
