#!/bin/sh

set -e
mysqld
mysql -u root -p${MYSQL_ROOT_PASSWORD} < /code/schema/schema-spider.sql