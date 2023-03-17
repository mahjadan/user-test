FROM ruby:3.1.1

# nodejs
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    echo 'deb https://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list &&\
    wget -q -O - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    apt-get update -qq && \
    apt-get install -y build-essential nodejs yarn

WORKDIR /var/app

COPY . .

RUN gem install rails bundler
RUN bundle install
RUN yarn install

# CMD bundle exec rails server
CMD ["bundle", "exec", "rails", "server","-b","'0.0.0.0'"]

