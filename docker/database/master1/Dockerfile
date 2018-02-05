FROM mariadb:10.1

#COPY schema-spider.sql /code/schema/schema-spider.sql
#COPY entrypoint.sh /usr/local/bin/entrypoint.sh
#
#ADD schema-spider.sql /docker-entrypoint-initdb.d
#RUN apt-get update && \
#    apt-get install -y nano

ADD my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]
