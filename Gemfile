# frozen_string_literal: true
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.1.3', '>= 6.1.3.2'

gem 'active_model_serializers', '~> 0.10'
gem 'activerecord-import', '~> 1.0'
gem 'bcrypt', '~> 3.1'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'config'
gem 'dotenv-rails'
gem 'graphql', '~> 1.11'
gem 'graphql-batch', '~> 0.4.3'
gem 'jwt', '~> 2.2'
gem 'mini_magick'
gem 'niceql', '~> 0.1.25'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'tzinfo-data'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner', '~> 1.8'
  gem 'debase'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'rails-erd'
  gem 'rspec', '~> 3.9'
  gem 'rspec-graphql_matchers', '~> 1.3'
  gem 'rspec-mocks', '~> 3.9'
  gem 'rspec-rails', '~> 4.0'
  gem 'rubocop', '~> 0.93.0'
  gem 'rubocop-rails', '~> 2.8'
  gem 'rubocop-rspec', '~> 1.44'
  gem 'ruby-debug-ide'
  gem 'shoulda-matchers', '~> 4.4'
  gem 'simplecov', '~> 0.19.1', require: false
  gem 'test-prof'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
