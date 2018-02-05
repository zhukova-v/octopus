GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.*
  TO replicant@'172.27.0.%' IDENTIFIED BY 'pass';

flush privileges;

create database if not exists test2;

create table test2.stats(
        aff_id INT(3),
        promo_id INT(3),
        sub_id VARCHAR(255),
        some_filled INT(3),
        `date` DATE,
        index aff_id_index (aff_id),
        primary key(`date`, promo_id, sub_id));