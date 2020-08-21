FROM python:3.8

LABEL project=airflow-local-docker \
      version=0.1 \
      author=dstilesr

EXPOSE 8080

RUN useradd -m -d /home/airflow_user/ airflow_user \
    && chown -R airflow_user: /home/airflow_user/

WORKDIR /home/airflow_user

COPY ./ .

RUN pip install --no-cache-dir -r requirements.txt
ENV AIRFLOW_HOME=/home/airflow_user/airflow
#USER airflow_user

CMD bash start-airflow.sh