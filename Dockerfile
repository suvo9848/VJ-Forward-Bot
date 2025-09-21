FROM python:3.10-slim-bookworm

# update & install git
RUN apt-get update && apt-get install -y git

# copy requirements and install
COPY requirements.txt /requirements.txt
RUN pip3 install -U pip && pip3 install -U -r /requirements.txt

# create working directory
RUN mkdir /VJ-Forward-Bot
WORKDIR /VJ-Forward-Bot

# copy project files
COPY . /VJ-Forward-Bot

# run gunicorn + main.py
CMD gunicorn app:app & python3 main.py
