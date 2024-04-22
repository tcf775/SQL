FROM python:3.9-slim

ENV PGHOST=postgres \
    PGUSER=postgres \
    PGPASSWORD=password \
    PGDATABASE=postgres

RUN apt-get update && apt-get install -y gcc \
 && pip install --upgrade pip \
 && pip install "psycopg[binary,pool]" \
 && pip install pgcli \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 
 RUN apt-get update && apt-get install -y pspg

# COPY csv /docker-entrypoint-initdb.d/csv