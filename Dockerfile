FROM ruby:latest

WORKDIR /usr/blog

RUN gem install bundler
RUN bundle config set --local path 'vendor'
COPY Gemfile /usr/blog/
RUN bundle install
#RUN bundle exec jekyll new . --force