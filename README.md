# README

* Ruby version

    Rails version: 5
    Ruby version: 2.5 (x86_64-linux)

* Deployment instructions

> docker-compose build
> docker-compose run --no-deps ror_web rails new . --force --database=mysql

* Set your db info:

    default: &default
    adapter: mysql2
    encoding: utf8
    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
    username: app
    password: app
    host: ror_db

    development:
    <<: *default
    database: app

> docker-compose up

> docker-compose run ror_web rake db:create