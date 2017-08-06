#!/bin/bash
set -e

mysql -uroot -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
CREATE DATABASE IF NOT EXISTS omnistore_development;
CREATE DATABASE IF NOT EXISTS omnistore_development;
EOSQL
