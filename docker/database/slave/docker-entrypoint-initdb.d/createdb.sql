GRANT REPLICATION SLAVE, REPLICATION ClIENT ON *.*
  TO replicant@'172.27.0.%' IDENTIFIED BY 'pass';

flush privileges;

CHANGE MASTER 'shard1' TO
  MASTER_HOST='master_shard_1',
  MASTER_USER = 'replicant',
  MASTER_PASSWORD = 'pass',
  MASTER_USE_GTID = CURRENT_POS;

CHANGE MASTER 'shard2' TO
  MASTER_HOST='master_shard_2',
  MASTER_USER = 'replicant',
  MASTER_PASSWORD = 'pass',
  MASTER_USE_GTID = CURRENT_POS;

