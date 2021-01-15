FROM ruby:2.6.5

ARG sassc_version="2.4.0"

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  nodejs\
  default-mysql-server\
  default-mysql-client

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt update \
  && apt install --no-install-recommends -y yarn

WORKDIR /team-plz

COPY Gemfile /team-plz/Gemfile
COPY Gemfile.lock /team-plz/Gemfile.lock

RUN gem install bundler
RUN bundle install

RUN mkdir -p tmp/sockets