FROM ruby:2.6


RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn

                         
# Set an environment variable where the Rails app is installed to inside of Docker image

ENV RAILS_ROOT /var/www/app

RUN mkdir -p $RAILS_ROOT 

# Set working directory
WORKDIR $RAILS_ROOT

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install

# Adding project files
COPY . .

# Add a script to be executed every time the container starts.
COPY test_script.sh /usr/bin/
RUN chmod +x /usr/bin/test_script.sh
ENTRYPOINT ["test_script.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
