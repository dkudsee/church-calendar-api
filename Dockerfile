FROM ruby:2.7.6

ENV RAILS_ROOT /app
ENV RAILS_ENV='production'
ENV RACK_ENV='production' 
ENV GOOGLE_RUNTIME_VERSION=2.7.6

WORKDIR ${RAILS_ROOT}

COPY Gemfile Gemfile.lock ./
COPY ./gemfiles ./gemfiles

RUN gem install bundler:2.5.21
RUN bundle install

COPY . .

EXPOSE 9292

CMD bundle exec puma -t 2:5
