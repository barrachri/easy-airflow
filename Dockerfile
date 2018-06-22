FROM python:3.6-alpine

LABEL MAINTAINER barrachri

ARG AIRFLOW_VERSION=1.9.0
ARG AIRFLOW_HOME=/usr/local/airflow

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8

RUN apk add --update \
    bash \
    build-base \
    linux-headers \
    python3-dev \
    postgresql-dev \
    libxml2-dev \
    libxslt-dev \
    libffi-dev

RUN pip install apache-airflow[crypto,postgres,jdbc,password,slack]==$AIRFLOW_VERSION

RUN adduser -Ds /bin/bash -h ${AIRFLOW_HOME} airflow

COPY script/entrypoint.sh /entrypoint.sh
COPY script/create_user.py ${AIRFLOW_HOME}/create_user.py
COPY config/airflow.cfg ${AIRFLOW_HOME}/airflow.cfg

RUN chown -R airflow: ${AIRFLOW_HOME}

EXPOSE 8080 5555 8793

USER airflow
WORKDIR ${AIRFLOW_HOME}

ENTRYPOINT ["/entrypoint.sh"]
CMD ["webserver"] # set default arg for entrypoint
