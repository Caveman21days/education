# GETTING STARTED

Думаю, как заклонить себе проект вы знаете, поэтому сперва в дирректории проекта:
`bundle install`

**Установка postgres:**

    sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
    
    wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
    
    sudo apt-get update
    
    sudo apt-get install postgresql-common
    
    sudo apt-get install postgresql-9.5 libpq-dev
    
    sudo -u postgres createuser ВАШЕИМЯ -s (без кавычек)



**В папке /config создать файл database.yml,
в него поместить**

    default: &default
      adapter: postgresql
      encoding: unicode
      host: localhost
      pool: 5
      username: ВАШЕИМЯ (без кавычек)

    development:
      <<: *default
      database: education_development

    test:
      <<: *default
      database: education_test

_Дальше в дирректории проекта выполнить команду:_ `rake db:create`

В файл _.gitignore_ добавить строку `config/database.yml`

Далее `rails s` и радуемся)

