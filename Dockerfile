FROM ruby:3.0

RUN apt-get update
RUN apt-get install -y rsync
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs
RUN corepack enable
RUN gem install bundler

COPY app ./app
WORKDIR /app
RUN bundle config set --local path 'vendor'
RUN yarn config set .yarn-cache
RUN bundle install
RUN yarn install
