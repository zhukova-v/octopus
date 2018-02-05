FROM ubuntu:16.04

#ADD id_rsa /root/.ssh/
#RUN chmod 400 /root/.ssh/id_rsa

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get install -y nginx curl nodejs npm git unzip wget && \
    apt-get install -y php7.0 php7.0-fpm php7.0-xml php7.0-mcrypt php7.0-mbstring php7.0-mysql php7.0-curl php7.0-json php7.0-gd

# Configure Nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
ADD nginx/ /etc/nginx/conf.d/
ADD nginx/fastcgi_params  /etc/nginx/

# Configure PHP FPM
#ENV PHP_EXT_DIR  /usr/lib/php5/20131226
ENV PHP_INI_DIR  /etc/php/7.0/fpm
ENV PHP_INI      ${PHP_INI_DIR}/php.ini

RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php/7.0/fpm/php-fpm.conf && \
    sed -i "s/;clear_env = no/clear_env = no/" /etc/php/7.0/fpm/pool.d/www.conf && \
    sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" $PHP_INI && \
    sed -i "s/display_errors = Off/display_errors = On/" $PHP_INI && \
    sed -i "s/;date.timezone =/date.timezone = Europe\/Kiev/" $PHP_INI

WORKDIR /var/www/replication.com

RUN useradd -d /var/www/replication.com -u 1000 www && \
    sed -i 's/www-data/www/g' /etc/nginx/nginx.conf && \
    sed -i "s/www-data/www/g" /etc/php/7.0/fpm/pool.d/www.conf && \
    sed -i "s/www-data/www/g" /etc/php/7.0/fpm/pool.d/www.conf && \
    chown -R www:www \
        /var/log/nginx \
        /var/www/replication.com

COPY startup.sh /usr/local/bin/startup.sh

CMD ["/usr/local/bin/startup.sh"]
