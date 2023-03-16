FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /EmployeeDemo

WORKDIR /EmployeeDemo

ADD Gemfile /EmployeeDemo/Gemfile

Add Gemfile.lock /EmployeeDemo/Gemfile.lock

RUN bundle install

ADD . /EmployeeDemo
