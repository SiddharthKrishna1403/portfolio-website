FROM ruby:3.0

WORKDIR /app

# Copy just the Gemfile first to leverage Docker cache
COPY Gemfile* ./

# Install bundler and gems
RUN gem install bundler && \
    bundle install

# Copy the rest of the application
COPY . .

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
