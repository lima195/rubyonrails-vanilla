# README

* Ruby version

    Rails version: 5
    Ruby version: 2.5 (x86_64-linux)

* Install steps

### New RoR Project

Init RoR directory 

```
rm -rf web/; mkdir web && cp Gemfile* web;
bin/rails new . --force --database=postgresql
cp sample/database.yml web/config;
```

### Existing RoR Project

Clone your project

```
git clone $(YOUR_GIT_REPO) web;
```

* Import your database

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


--


### Instalation

1. Set right permissions (Only for linux)

```
sudo chown -R $USER:$USER web/
```

2. Start Docker

```
docker-compose up -d
```

3. Start Database

```
bin/rake db:create
```

* Project access:

- http://localhost:3000
- http://localhost:8888/?pgsql=ror_db&username=postgres (Password: postgres)