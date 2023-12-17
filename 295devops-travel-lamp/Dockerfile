FROM php:apache-bullseye
WORKDIR /apache
RUN apt-get update && \
    apt-get install -y libzip-dev && \
    docker-php-ext-install -j$(nproc) mysqli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
#    && apt-get install 
#    && apt-get install -y php libapache2-mod-php php-mysql php-mbstring php-zip php-gd php-json php-curl
#RUN docker-php-ext install -j$(nproc) mysqli
COPY ./*.php /apache/var/www/html/
COPY . /apache
#RUN systemctl start apache2
#CMD [ "php", "./index.php" ]
EXPOSE 80