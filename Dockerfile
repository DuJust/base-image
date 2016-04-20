FROM ruby:2.2
MAINTAINER Du Just <du.just.it@gmail.com>

# Env
ENV PHANTOMJS_VERSION 1.9.8

RUN apt-get update -qq && apt-get install -y build-essential nodejs npm nodejs-legacy libpq-dev default-jre git vim wget libfreetype6 libfontconfig bzip2 && \
  mkdir -p /srv/var && \
  wget --no-check-certificate -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp && \
  rm -f /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ /srv/var/phantomjs && \
  ln -s /srv/var/phantomjs/bin/phantomjs /usr/bin/phantomjs && \
  apt-get autoremove -y && \
  apt-get clean all
