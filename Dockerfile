FROM ubuntu:16.04
RUN apt-get update 
RUN apt-get install -y apache2
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN apt-get install -y php php-mysql wget unzip curl
RUN apt-get install -y libapache2-mod-php php-mbstring php-dom php-xml
WORKDIR /var/www/html
RUN rm -rf ./*
RUN wget -q https://builds.piwik.org/piwik.zip
RUN unzip piwik.zip && rm piwik.zip
RUN mv ./piwik/* . && rm -R piwik
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html
CMD service apache2 start && tail -f /var/log/apache2/access.log /var/log/apache2/error.log
EXPOSE 80
