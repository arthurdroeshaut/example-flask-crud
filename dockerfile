FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Brussels

RUN apt-get update && \
    apt-get install -y git python3-pip python3-flask && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/gurkanakdeniz/example-flask-crud.git
WORKDIR example-flask-crud/

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
ENV FLASK_APP=crudapp.py
RUN flask db init
RUN flask db migrate -m "entries table"
RUN flask db upgrade

CMD ["flask", "run", "-h", "0.0.0.0"]
EXPOSE 5000
