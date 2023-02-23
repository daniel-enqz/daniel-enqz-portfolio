source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "i18n", "1.12.0"
gem "rails", "~> 7.0.4"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "turbo-rails"
gem "stimulus-rails"
gem "redis", "~> 4.0"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", require: false
gem "dry-initializer"

# Assets & Frontend
gem "sprockets-rails"
gem "tailwindcss-rails"
gem "importmap-rails"
gem "inline_svg"
gem "view_component"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "standard"
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "pry-byebug"
end

group :development do
  gem "annotate"
  gem "letter_opener"
  gem "rack-mini-profiler"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
