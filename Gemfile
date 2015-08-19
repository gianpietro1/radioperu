source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring','~>1.3.6'
end

group :development do 
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'therubyracer', platforms: :ruby
end

group :test do
  gem 'rspec-rails', '~> 3.1.0'
  # gem 'database_cleaner' --> do I need this?
  gem 'factory_girl_rails', '~> 4.0'
  gem 'pry-rails'
end

# Application-specific gems
# DB population
gem 'faker'
# User authentication
gem 'devise'
# Sensitive info
gem 'figaro', '1.0'
# Authorization / roles
gem 'pundit'
# Styling
gem 'bootstrap-sass', '~> 3.2.0.2'
# HAML for views
gem 'haml-rails'
# Multi-language static text
gem 'rails-i18n', '~> 4.0.4'
# Jquery turbolinks
gem 'jquery-turbolinks'
# Multi-language models
gem 'globalize', '~> 5.0.0'
# DB tools
gem 'yaml_db'
# Upload managing
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'
# JQuery songs load
gem 'cocoon'
# Seed file from current DB
gem 'seed_dump'
# MP3 ID3 read/write
gem 'id3tag'
# Redis DB
gem 'redis'
# Soulmate Autocomplete & Search
gem 'soulmate_rails'
# Jquery UI for Autocomplete
gem 'jquery-ui-rails', '~> 5.0.5'
# Video info
gem 'video_info', github: 'thibaudgg/video_info'
# Mail form
gem 'mail_form'
# Friendly URLs
gem 'friendly_id'
# TagLib to read bitrate
gem 'taglib-ruby'
# Social Sharing
gem 'social-share-button'

# Capistrano
gem 'capistrano', '~> 3.1.0'
gem 'capistrano-bundler', '~> 1.1.2'
gem 'capistrano-rails', '~> 1.1.1'
gem 'capistrano-rvm', github: "capistrano/rvm"