source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'haml'
  gem "backbone-rails"
end

group :development do
  # For Compiling Assets
  gem 'guard'
  gem 'guard-rails-assets'
  gem 'rb-fsevent'
  gem 'growl_notify' # or gem 'growl'
  gem "jasmine", 
    :git => 'git://github.com/pivotal/jasmine-gem.git',
    :branch => "1.2.rc1"
  gem "thin"
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

gem 'app_constants'

