FROM ubuntu:latest

RUN apt-get update && apt-get install -y

RUN apt-get install -y python-pip python-dev build-essential

RUN pip install --upgrade pip

ADD app.py /home/app.py

WORKDIR /home

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
COPY . /tmp/

ENTRYPOINT ["python"]

CMD ["app.py"]

