#  Basic

Requirements:

* Ruby 2.5.1: https://www.ruby-lang.org/en/documentation/

* Ruby on Rails 5.2.0: http://guides.rubyonrails.org/

* PostgreSQL 9.5: https://www.postgresql.org/docs/

## :arrow_up: How to Setup Application

**Step 1:** Clone this repo with:
```
HTTPS:
https://github.com/VitaliyKovtun/basics.git
```
```
SSH:
git@github.com:VitaliyKovtun/basics.git
```

**Step 2:** Type `cd basic` in terminal to enter cloned folder in the current directory.

**Step 3:** Run `bundle` to install dependencies.

## :arrow_up: How to Setup Database

**Step 1:** Find database.yml file in config directory:

**Step 2:** Open file and set database configuration:
```
username: <%= ENV['DATABASE_USERNAME'] %>
password: <%= ENV['DATABASE_PASSWORD'] %>
```

**Step 3:** Run to create required postgres databases:
```
rails db:create
rails db:migrate
```

## :arrow_right: How to Run Server

**Step 1:** Run rails server with `rails s`.
