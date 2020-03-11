FROM python:2-buster

# install python extera libs
RUN apt-get update -y
RUN apt-get install python-termcolor python-paramiko python-pyip python-libpcap -y
# upgrade pip
RUN pip install --upgrade pip
RUN pip install Werkzeug
# paramiko needed for tcp, not working yet 
RUN pip install paramiko --ignore-installed

RUN mkdir -p /app
WORKDIR /app
COPY . /app

ENTRYPOINT python3 main.py
RUN ip=`hostname -i`
RUN echo $ip