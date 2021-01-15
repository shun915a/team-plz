FROM ruby:2.6.5

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  nodejs\
  default-mysql-server\
  default-mysql-client

WORKDIR /team-plz

COPY Gemfile /team-plz/Gemfile
COPY Gemfile.lock /team-plz/Gemfile.lock

RUN gem install bundler
RUN bundle install

RUN mkdir -p tmp/sockets