FROM php:8.2-apache-bullseye
WORKDIR /apache
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get php-mysql
#    && apt-get install -y php libapache2-mod-php php-mysql php-mbstring php-zip php-gd php-json php-curl
COPY ./*.php /apache/var/www/html/
COPY . /apache
#RUN systemctl start apache2
EXPOSE 80