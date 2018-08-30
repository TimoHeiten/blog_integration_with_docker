FROM library/postgres:alpine

EXPOSE 5433

ENV POSTGRES_USER=integration_user
ENV POSTGRES_DB=integration_db

RUN mkdir -p /docker-entrypoint-initdb.d/
COPY ./init.sql ./docker-entrypoint-initdb.d/
