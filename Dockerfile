FROM ruby:3
LABEL maintainer "light <admin@lighthosting.eu.org>"

ENV DEBUG=0

RUN mkdir -p /data
RUN bundle config --global frozen 1
WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle config set --local without 'development'
RUN bundle install

COPY . .

ENTRYPOINT [ "/usr/src/app/json_syntax_check" ]
