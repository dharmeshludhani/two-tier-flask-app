 # Generating the Dockerfile for the project
 FROM python:3.13
 WORKDIR /app
 COPY . .
 RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*
 RUN pip install -r requirements.txt
 RUN pip install mysqlclient  
 CMD ["python", "app.py"]