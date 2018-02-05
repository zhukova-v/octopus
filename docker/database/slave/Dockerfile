FROM mariadb:latest

#COPY schema-shard.sql /code/schema/schema-shard.sql
#COPY entrypoint.sh /usr/local/bin/entrypoint.sh
#RUN apt-get update && \
#    apt-get install -y nano

ADD my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]