# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby '3.2.1'

gem 'rails', '~> 7.1.0'
gem 'puma'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false
gem 'sqlite3'
gem 'rack-cors'
gem 'devise'
gem 'devise-jwt'
gem 'pagy'
gem 'pundit'

gem 'acts_as_votable'
gem 'active_storage_validations'
gem 'counter_culture'
gem 'jbuilder'
gem 'redis', '~> 4.0'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop'
  gem 'rubocop-rails', require: false
  gem 'figaro'
  gem 'faker', '~> 2.19'
  gem 'annotate'
  gem 'bullet'
  gem 'letter_opener'
end

group :test do
  gem 'database_cleaner'
  gem 'database_cleaner-active_record'
end
