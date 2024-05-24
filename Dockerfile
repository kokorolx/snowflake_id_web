# Dockerfile

# Use the official Ruby image as a base
FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn -y

# Set working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Copy the rest of the application code
RUN yarn install
COPY . .
COPY ./vendor/* ./vendor

# Install gems
RUN bundle install


# Install JavaScript dependencies

# Precompile assets
RUN bundle exec rake assets:precompile

# Expose port 3000 to the Docker host
EXPOSE 3000

RUN gem install foreman
# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
# CMD ["foreman", "start", "-f", "Procfile.dev"]
