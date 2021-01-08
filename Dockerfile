FROM ruby:2.6.3
ENV LANG C.UTF-8

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && \
    apt-get install -y \
            build-essential \
            libpq-dev \
            nodejs \
            yarn \
            postgresql-client

RUN mkdir /app
RUN mkdir /app/src

ENV APP_ROOT /app/src
WORKDIR $APP_ROOT

ADD ./src/Gemfile $APP_ROOT/Gemfile
ADD ./src/Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install


ADD . $APP_ROOT
