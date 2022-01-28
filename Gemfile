source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"
gem "bootstrap-sass"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 6.1.3", ">= 6.1.3.1"
# Use mysql as the database for Active Record
gem "mysql2", "~> 0.5"
# gem 'mysql2', '~> 0.3.12b2'
# Use Puma as the app server
gem "puma", "~> 5.0"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem "bcrypt", "~> 3.1.7"

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb

gem "bootsnap", ">= 1.4.4", require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"
gem "rexml", "~> 3.2.4"
gem "rails-i18n"
gem "pry-rails"
gem "faker"
gem "active_storage_validations", "0.8.2"
gem "image_processing", "1.9.3"
gem 'mini_magick'
gem 'aws-sdk-s3', require: false
# CookieのSameSite属性をNoneにする(Chrome 80対応)
# Doc: https://qiita.com/ahera/items/0c8276da6b0bed2b580c
gem 'rails_same_site_cookie'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger consol
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails",'~> 5.0.0'
  gem "factory_bot_rails"
end

group :test do
  gem "webdrivers"
  gem "capybara", ">= 2.15"
end

group :development do
  gem "listen", "~> 3.3"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-commands-rspec"
  gem "rails-controller-testing"
end

group :production do # 本番環境
  
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "devise"
