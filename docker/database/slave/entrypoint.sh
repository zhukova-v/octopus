#!/bin/sh
exec mysql -uroot -proot $@ < /code/schema/schema-shard.sql