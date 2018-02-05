create database if not exists test;

create or replace user sharded identified by "sharding";

GRANT ALL PRIVILEGES ON test.* to sharded;
flush PRIVILEGES;

drop server if exists shard1;
drop server if exists shard2;

CREATE SERVER shard1 FOREIGN DATA WRAPPER mysql 
    OPTIONS( 
    HOST 'master_shard_1',
    DATABASE 'test',
    USER 'sharded',
    PASSWORD 'sharding',
    PORT 3306);

CREATE SERVER shard2 FOREIGN DATA WRAPPER mysql 
    OPTIONS( 
    HOST 'master_shard_2',
    DATABASE 'test',
    USER 'sharded',
    PASSWORD 'sharding',
    PORT 3306);

create or replace 
    table test.spiders(
        id int,
        spide varchar(1),
        primary key(id))
    ENGINE=spider
    COMMENT='wrapper "mysql", table "spiders"'
    PARTITION BY HASH (id)
      (PARTITION part1 comment = 'srv "shard1"',
       PARTITION part2 comment = 'srv "shard2"');

create or replace table
    test.spider_history(
      id int,
      ts bigint, 
      vote varchar(1),
      primary key(id, ts))
    ENGINE=spider
    COMMENT='wrapper "mysql", table "spider_history"'
    PARTITION BY HASH (id)
      (PARTITION part1 comment = 'srv "shard1"',
       PARTITION part2 comment = 'srv "shard2"');

create or replace table
    test.summary(category varchar(50) primary key,
                 total int);