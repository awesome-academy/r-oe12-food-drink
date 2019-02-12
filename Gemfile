source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "acts_as_votable"
gem "bcrypt", "~> 3.1.12"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap-kaminari-views"
gem "bootstrap-sass", "~> 3.3.7"
gem "carrierwave", "~> 1.2.2"
gem "config"
gem "ckeditor"
gem "devise", "~> 4.1"
gem "ffaker"
gem "font-awesome-rails"
gem "font-awesome-sass", "~> 5.6.1"
gem "i18n-js"
gem "jbuilder", "~> 2.5"
gem "jquery-rails", "~> 4.3", ">= 4.3.3"
gem "kaminari"
gem "mini_magick", "~> 4.7.0"
gem "mysql2"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.1"
gem "rails-controller-testing"
gem "rails-i18n"
gem "rails-ujs", "~> 0.1.0"
gem "ransack"
gem "turbolinks", "~> 5"

group :production do
  gem "pg", "~> 0.20.0"
  gem "fog", "~> 1.42"
end

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara"
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "selenium-webdriver"
  gem "chromedriver-helper"
  gem "shoulda-matchers", "~> 3.1"
  gem "database_cleaner"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
