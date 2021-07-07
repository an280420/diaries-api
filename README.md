# Api application Ruby on Rails

Простое api приложение на Ruby on Rails демонстрирующее работу с отложенными задачами.

#### Установка

склонируйте данный репозиторий 

```
git clone git@github.com:an280420/diaries-api.git
```

Перейдите в директорию diaries-api

Выполните команду в терминале

```
bundle install
```

Создайте базу данных, выполните миграции и заполните базу данных с помощью файла seeds.rb, для этого выполните в терминале следующие команды

```
rails db:create
rails db:migrate
rails db:seed
```
Для работы в вашей системе должен быть установлен Redis
В приложении появяться четыре дневника и у каждого дневника будут три записи. Каждый дневник имеет свой статус puclic или private.
У дневников private может быть срок.
Приложение позволяет запускать отложенные задачи. 
Запустите sidekiq
```
bundle exec sidekiq
```
Воркер будет проверять каждые десять минут есть ли дневники с истекшим сроком и будет их удалять. Подождите десять минут и обновите страницу и вы увидите, что два дневника были удалены

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
