FROM ruby:3.0.0-alpine3.12

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python3 \
      tzdata \
      yarn

WORKDIR /app

# Bundling
COPY Gemfile* ./
RUN gem install bundler:2.1.4

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

# Building /node_modules
COPY package.json yarn.lock ./
RUN yarn install --check-files

# Load a snapshot of the application files into the image.
COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]

# Rails App is setup
