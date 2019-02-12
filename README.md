# NATS Streaming Server MySQL image

A modified MySQL image ready-to-use as a persistence store for NATS Streaming.

This repo contains a MySQL database preconfigured with the schema required by the [NATS Streaming server](https://github.com/nats-io/nats-streaming-server#sql-store).
Since this serves as an image to simply test NATS Streaming server persistence, it does not bother to set a specific user account for NATS Streaming to use.

## Usage

First, run the database server.
```bash
docker run -d -p 3306:3306 --name my-mysql -e MYSQL_ROOT_PASSWORD=supersecret erwinvaneyk/nats-streaming-mysql --default-authentication-plugin=mysql_native_password
```

Then, run NATS Streaming using the SQL store
```bash
docker run -d --network=host --name eventstore nats-streaming:0.11.2 -store SQL --sql_driver mysql --sql_source root:supersecret@/nss
```
