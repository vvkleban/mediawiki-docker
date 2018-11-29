FROM crashvb/nginx:ubuntu
LABEL maintainer="Volodymyr Kleban <docker@vkleban.com>"

RUN docker-apt iproute2 php-mbstring php-xml php-mysql
RUN mkdir /tmp/mediawiki && \
  cd /tmp/mediawiki && \
  curl -o mediawiki.tgz https://releases.wikimedia.org/mediawiki/1.31/mediawiki-1.31.1.tar.gz && \
  tar -xzvf mediawiki.tgz && \
  rm -f mediawiki.tgz && \
  mv * /var/www/mediawiki

RUN chown --recursive www-data:www-data /var/www/mediawiki
 
ADD mediawiki.nginx /etc/nginx/sites-available/default

EXPOSE 80/tcp
