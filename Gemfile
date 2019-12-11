# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap', '~> 4.3.1'
gem 'cocoon'
gem 'coffee-rails', '~> 4.2'
gem 'dry-validation'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'minitest-power_assert'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'ransack'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'slim'
gem 'sqlite3'
gem 'state_machines'
gem 'state_machines-activerecord'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
# gem 'therubyracer', platforms: :ruby

# gem 'redis', '~> 3.0'
# gem 'bcrypt', '~> 3.1.7'

# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'guard'
  gem 'guard-minitest'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
