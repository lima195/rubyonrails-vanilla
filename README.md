# README

* Ruby version

    Rails version: 5
    Ruby version: 2.5 (x86_64-linux)

* Deployment instructions

1.

> mkdir web && docker-compose run --no-deps ror_web rails new . --force --database=postgresql

2.

> sudo chown -R $USER:$USER web/

3.

> docker-compose build

4.

* Set your db info: (config/database.yml)

```
default: &default
  adapter: postgresql
  encoding: unicode
  host: ror_db
  username: postgres
  password: postgres
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
```

> docker-compose up -d

6.

> docker-compose run ror_web rake db:create

* Project access:

- http://localhost:3000
- http://localhost:8888/?pgsql=ror_db&username=postgres (Password: postgres)