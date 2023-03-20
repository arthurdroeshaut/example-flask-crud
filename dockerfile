FROM ubuntu:latest
RUN git clone
WORKDIR /example-flask-crud
SOURCE venv/bin/activate
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
EXPORT FLASK_APP=crudapp.py
flask db init
flask db migrate -m "entries table"
flask db upgrade
CMD flask run
