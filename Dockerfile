FROM python:latest

WORKDIR /app

COPY . /app

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

Run pip install -r requirements.txt

RUN pip install mysqlclient

CMD ["python" , "app.py"]