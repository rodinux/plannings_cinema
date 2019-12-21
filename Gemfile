source 'https://rubygems.org'
ruby '2.6.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails-i18n'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bootsnap'
gem 'bcrypt'
gem 'sorcery'
gem 'cancancan'
gem 'rails_admin_import'
gem 'rails_admin', '~> 2.0', git: 'https://github.com/sferik/rails_admin.git', ref: '03baf7281cfbe1ca9aeef9648a7d763107dc8f30'
gem "font-awesome-sass"
gem 'font-awesome-rails'
gem 'kaminari'
gem 'rack-pjax'
gem 'nokogiri'
gem 'rchardet'
gem 'simple_xlsx_reader'
gem 'wkhtmltopdf_binary'
gem 'wicked_pdf'
gem 'ransack'
gem 'httparty'
gem 'listen'
gem "simple_calendar"
gem 'bootstrap-datepicker-rails'
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails'
gem 'will_paginate'
gem 'charlock_holmes'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'railroady'
  # Use sqlite3 as the database for Active Record
  #gem 'sqlite3'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
end

  #group :development, :production do
  #gem 'capistrano'
  #gem 'capistrano-ext'
  #gem 'capistrano-rails'
  #gem 'capistrano-bundler'
  #gem 'capistrano-rvm'
  #gem 'capistrano-passenger'
  #gem 'capistrano-rails-collection'
  #gem 'capistrano-faster-assets'
  #gem 'capistrano-postgresql'
#end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do

  gem 'rails_12factor'
  gem 'pg'
end