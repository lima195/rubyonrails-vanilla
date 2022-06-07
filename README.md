# README

* Ruby version

    - Rails version: 5
    - Ruby version: 2.5 (x86_64-linux)


---

## Install steps


##### a) New RoR Project


Init RoR directory 

```
rm -rf web/; mkdir web && cp Gemfile* web;
bin/rails new . --force --database=postgresql;
cp sample/database.yml web/config;
```

##### b)  Existing RoR Project

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


---


## Instalation

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
bin/rails db:create
```

---

#### Useful commands:

**bin/bash** - Run a command inside main container, ex:
```
bin/bash cli;
bin/bash ls;
bin/bash rails new .;
```

**bin/rails** - Run a rails command inside main container, ex:
```
bin/rails new .;
bin/rails console;
bin/rails dbconsole;
bin/rails routes;
bin/rails --help;
```

---

* Project access:

- http://localhost:3000
- http://localhost:8888/?pgsql=ror_db&username=postgres (Password: postgres)