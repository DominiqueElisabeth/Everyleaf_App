# README

# App Schema

Model : task

| Columns        | Descriptions  |
| -------------- | ------------- |
| Name           | String        |
| Description    | String        |
| Priority       | String        |
| Status         | String        |
| Deadline       | Date          |

# How to deploy on heroku

- Creation of the app on heroku

$ heroku login
$ heroku create everyleaf-app

$ heroku buildpacks:set heroku/ruby
$ heroku buildpacks:add --index 1 heroku/nodejs

- Compile the app and push it on heroku
$ rails assets:precompile RAILS_ENV=production
$ git add -A
$ git commit -m "message"
$ git push heroku master

- Migration and open app link
$ heroku run:detached rails db:migrate
$ heroku open app

# List of gems required

gem 'rails', '~> 5.2.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
