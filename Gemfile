source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.12'
gem 'thin'
gem 'jquery-rails'
gem 'haml-rails'

group :assets do
  gem 'therubyracer'
  gem 'less-rails'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier'
end

group :development do
  gem 'quiet_assets'
  gem 'heroku'
end

group :development, :test do
  gem 'debugger'
  gem 'sqlite3'
end

group :test do
end

group :production do
  gem 'pg', '~> 0.14.1'
end