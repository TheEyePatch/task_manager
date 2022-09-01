# README


``` bash
version tools

ruby 2.7.2
nodejs v12.18.3
yarn 1.22.19
Rails 6.0.5.1

postgres (PostgreSQL) 13.2
```
For installing Ruby, NodeJS and Yarn, suggest using `asdf` or `nvm` version managers.

asdf: `https://asdf-vm.com/`
nvm: `https://github.com/nvm-sh/nvm`

```bash
e.g. for asdf ruby

asdf install ruby 2.7.2
asdf reshim ruby
```

For installing Rails on Windows, might need to install WSL
`https://docs.microsoft.com/en-us/windows/wsl/install-win10`
Install Ubuntu v 20 (Don't forget to restart before doing so)


### For machines using MariaDB or MySQL, can pull/fetch `main` branch and run `bundle install` to use the `mysql2` gem.

1. Add the MySQL username and password under `default` on config.database.yml
```yml
# config/database.yml

default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: # username on SQL database
  password: # password on SQL database
  host: # localhost
```
  
2. Run `rails db:create` on project directory
3. Run `rails db:migrate` after successful database creation to create app schema.
4. Run `rails s` or `rails s -p <PORT USED> to run app
  e.g `rails s -p 3000`




