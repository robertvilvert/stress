FROM ruby:3.3

WORKDIR /app

copy app.rb .

RUN gem install sinatra rackup

CMD ["ruby", "app.rb"]
