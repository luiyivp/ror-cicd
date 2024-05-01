FROM ruby:3.0.3 as base

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

WORKDIR /app

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

ADD . /app

CMD [ "bundle","exec", "puma", "config.ru"]
