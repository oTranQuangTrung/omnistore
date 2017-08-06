FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential nodejs

ENV APP_HOME /omnistore
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile $APP_HOME
ADD Gemfile.lock $APP_HOME

RUN bundle install

ADD . $APP_HOME
