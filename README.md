# Eeryleaf app

## App Schema

### Models used

#### Model : task
> belongs_to :user
> has_many :labels

| Columns        | Descriptions  |
| -------------- | ------------- |
| Name           | String        |
| Description    | String        |
| Priority       | Integer       |
| Status         | String        |
| Deadline       | Date          |

#### Model : user
> has_many :tasks

| Columns        | Descriptions  |
| -------------- | ------------- |
| Name           | String        |
| email          | String        |
| Password       | String        |

#### Model : label
> has_many :tasks

| Columns        | Descriptions  |
| -------------- | ------------- |
| User_id        | Integer       |
| Name           | String        |

### How to deploy on Heroku

#### Creation of the app on heroku
```
$ heroku login
$ heroku create everyleaf-app
$ heroku buildpacks:set heroku/ruby
$ heroku buildpacks:add --index 1 heroku/nodejs
```
#### Compile the app and push it on heroku
```
$ rails assets:precompile RAILS_ENV=production
$ git add -A
$ git commit -m "update"
$ git push heroku master
```

#### Migration and open app link
```
$ heroku run:detached rails db:migrate
$ heroku open app
```

### List of gems required
```
gem 'rails', '~> 5.2.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
```
