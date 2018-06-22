# easy-airflow
[![Build Status](https://travis-ci.org/barrachri/easy-airflow.svg?branch=master)](https://travis-ci.org/barrachri/easy-airflow)
[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://hub.docker.com/r/barrachri/easy-airflow/)

## Credits

Based on [puckel/docker-airflow](https://github.com/puckel/docker-airflow)

## Informations

* Based on Python (3.6-alpine) official Image [python:3.6-alpine](https://hub.docker.com/_/python/) and uses the official [Postgres](https://hub.docker.com/_/postgres/)
* Install [Docker](https://www.docker.com/)
* Install [Docker Compose](https://docs.docker.com/compose/install/)
* Following the Airflow release from [Python Package Index](https://pypi.python.org/pypi/apache-airflow)

## Installation

Clone the repo and then

    docker-compose up -d

## Create a new user

With airflow container running

    docker-compose run --rm airflow python create_user.py YourEmail YourPassword

## Build

For example, if you need to install [Extra Packages](https://airflow.incubator.apache.org/installation.html#extra-package), edit the Dockerfile and then build it.

    docker build --rm -t barrachri/easy-airflow .

Don't forget to update the airflow images in the docker-compose files to barrachri/easy-airflow:latest.

## Install custom python package

Add the packages to the Dockerfile anre rebuild the image.

## UI Links

The webserver exposes port 8080

## Running other airflow commands

If you want to run other airflow sub-commands, such as `list_dags` or `clear` you can do so like this:

    docker-compose run --rm airflow YourContainerID airflow list_dags

or with your docker-compose set up like this:

    docker-compose run --rm airflow airflow list_dags
