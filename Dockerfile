FROM ruby:2.6
ENV LANG C.UTF-8

# install required libraries
RUN apt-get update -qq && apt-get install -y build-essential mariadb-client nodejs curl

# install bundler
RUN gem install bundler

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

EXPOSE 3000

WORKDIR /usr/src/app/
COPY . /usr/src/app/
