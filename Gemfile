source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"
gem "rails", "~> 7.0.4", ">= 7.0.4.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "figaro"
gem "faraday"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "pry"
end

group :development do
  gem "web-console"
  gem "rubocop-rails"
end

group :test do
  gem "rspec-rails"
  gem "capybara"
  gem "launchy"
  gem "simplecov"
  gem 'shoulda-matchers'
  gem 'orderly'
  gem 'factory_bot_rails'
  gem "faker"
  gem "webmock"
  gem "vcr"
end