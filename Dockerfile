FROM prefecthq/prefect:2.13.0-python3.11
COPY requirements.txt /opt/prefect/cds-log-analysis/requirements.txt
RUN python -m pip install -r /opt/prefect/cds-log-analysis/requirements.txt
COPY . /opt/prefect/cds-log-analysis/
WORKDIR /opt/prefect/cds-log-analysis/
