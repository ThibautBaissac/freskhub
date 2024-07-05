# README

## RUN TESTS
```bash
docker-compose run -e RAILS_ENV=test -e DATABASE_URL=postgres://postgres:postgres@postgres/fresks_test web rails db:create
docker-compose run -e RAILS_ENV=test -e DATABASE_URL=postgres://postgres:postgres@postgres/fresks_test web rails db:migrate
dce bash
rspec
```
