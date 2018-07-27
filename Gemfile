source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.5'
gem 'pg', '~> 0.21'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 2.5'
gem 'haml-rails'
gem 'devise'
gem 'jquery-rails'
gem 'carrierwave'
gem 'remotipart'
gem 'cocoon'
# gem 'gon'
# gem 'turbolinks', '~> 5'
# gem 'skim'
gem 'responders', '~> 2.0'
gem 'bootstrap', '~> 4.1.1'
gem 'cancancan', '~> 2.0'
gem 'select2-rails'
gem 'pygments.rb', '~> 0.6.0'
gem 'redcarpet'
gem 'carrierwave'
gem 'remotipart'
gem 'cocoon'
gem 'dotenv'
gem 'dotenv-deployment', require: 'dotenv/deployment'

# gem 'therubyracer', platforms: :ruby
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'capybara-webkit'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rails-controller-testing'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]