FROM crashvb/nginx:ubuntu
LABEL maintainer="Volodymyr Kleban <docker@vkleban.com>"

RUN docker-apt iproute2
RUN curl -o mediawiki.tgz https://releases.wikimedia.org/mediawiki/1.31/mediawiki-1.31.1.tar.gz && \
 tar -xzvf 

EXPOSE 80/tcp
