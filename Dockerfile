# Dockerfile

# Use the official Ruby image as a base
FROM ruby:3.2.2

# Install dependencies
# Install dependencies in a single RUN command to minimize layers
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends nodejs postgresql-client curl gnupg && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set working directory
WORKDIR /snowflake

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Copy the rest of the application code
RUN yarn install
COPY . .
COPY ./vendor/* ./vendor

# Install gems
RUN bundle install --without development test

# Install JavaScript dependencies

# Precompile assets
RUN bundle exec rake assets:precompile
COPY . .

# Expose port 3000 to the Docker host
EXPOSE 3000

# RUN gem install foreman
# ENV RAILS_ENV=production
# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
# CMD ["foreman", "start", "-f", "Procfile.dev"]
