#!/usr/bin/env bash

dropdb --if-exists ecomdb
createdb ecomdb

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "ecomdb" <<-EOSQL
  CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
  CREATE EXTENSION IF NOT EXISTS pgcrypto;
  \c ecomdb
  CREATE ROLE app_user;
  GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO app_user;
  CREATE USER ecomuser WITH PASSWORD 'password';
  ALTER ROLE ecomuser WITH REPLICATION;
  ALTER ROLE app_user WITH REPLICATION;
  GRANT app_user TO ecomuser;
  CREATE USER ecomadmin WITH PASSWORD 'password';
  ALTER ROLE ecomadmin SUPERUSER;
EOSQL
