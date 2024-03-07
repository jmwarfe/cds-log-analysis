FROM prefecthq/prefect:2.13.0-python3.11
COPY requirements.txt /opt/prefect/helloworld/requirements.txt
RUN python -m pip install -r /opt/prefect/helloworld/requirements.txt
COPY . /opt/prefect/helloworld/
WORKDIR /opt/prefect/helloworld/
