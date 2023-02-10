source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "rails", "~> 7.0.3"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "turbo-rails"
gem "stimulus-rails"
gem "redis", "~> 4.0"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", require: false

# Assets
gem "sprockets-rails"
gem "tailwindcss-rails"
gem "importmap-rails"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "standard"
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
