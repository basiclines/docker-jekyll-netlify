FROM ruby:3.0

RUN apt-get update
RUN apt-get install -y rsync
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs
RUN corepack enable
RUN gem install bundler
RUN curl -s https://gist.githubusercontent.com/LukeChannings/09d53f5c364391042186518c8598b85e/raw/ac8cd8c675b985edd4b3e16df63ffef14d1f0e24/deno_install.sh | sh
RUN ln -s /root/.deno/bin/deno /usr/local/bin/

COPY app ./app
WORKDIR /app
RUN bundle config set --local path 'vendor'
RUN yarn config set .yarn-cache
RUN bundle install
RUN yarn install
