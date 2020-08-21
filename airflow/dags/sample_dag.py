from airflow import DAG
from defaults import default_args
from datetime import datetime, timedelta
from airflow.operators.python_operator import PythonOperator


def func_1(**kwargs):
    string = f"Execution started at {kwargs['execution_date']}"
    print(string)
    return string


def func_2(name):
    print(f"Hello, {name}!")
    return 0


def func_3(**kwargs):
    string = f"Execution ended for {kwargs['execution_date']} run!"
    print(string)
    return string


dag = DAG(
    dag_id="python-test-dag",
    default_args=default_args,
    schedule_interval=timedelta(minutes=15)
)

task_1 = PythonOperator(
    task_id="task-1",
    python_callable=func_1,
    provide_context=True,
    dag=dag
)

task_2a = PythonOperator(
    task_id="task-2a",
    python_callable=func_2,
    op_kwargs={"name": "Alice"},
    provide_context=False,
    dag=dag
)


task_2b = PythonOperator(
    task_id="task-2b",
    python_callable=func_2,
    op_kwargs={"name": "Bob"},
    provide_context=False,
    dag=dag
)


task_3 = PythonOperator(
    task_id="task-3",
    python_callable=func_3,
    provide_context=True,
    depends_on_past=True,
    dag=dag
)

task_1.set_downstream([task_2a, task_2b])
task_3.set_upstream([task_2a, task_2b])
