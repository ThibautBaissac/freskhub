# FRESKHUB
Raising awareness for a sustainable future


## RAKE TASKS
# Sort yaml files in config/locales
```bash
rails sort_yaml
```

## RUN TESTS
```bash
docker-compose run -e RAILS_ENV=test -e DATABASE_URL=postgres://postgres:postgres@postgres/fresks_test web rails db:create
docker-compose run -e RAILS_ENV=test -e DATABASE_URL=postgres://postgres:postgres@postgres/fresks_test web rails db:migrate
dce bash
rspec
```
