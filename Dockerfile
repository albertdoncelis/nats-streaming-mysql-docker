FROM mysql:8.0

COPY ./nats-streaming-server.sql  /docker-entrypoint-initdb.d/ 
