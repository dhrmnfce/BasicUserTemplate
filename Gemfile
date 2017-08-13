source 'https://rubygems.org'

# Declare ruby version
ruby '2.3.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.3'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.6'
# Use Bootstrap for stylization
gem 'bootstrap-sass', '3.3.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '3.2.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.2.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '4.3.1'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '5.0.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.6.1'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '3.1.11'

# Use Puma as the app server
gem 'puma', '3.9.1'

# Use will_paginate to display users/properties
gem 'will_paginate', '3.1.5'

# Use bootstrap stying for will_paginate
gem 'bootstrap-will_paginate', '1.0.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '1.3.13'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '3.5.1'
  
  gem 'listen', '3.0.8'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '2.0.2'
  
  gem 'spring-watcher-listen', '2.0.1'
  
  # Use faker to seed dev database with users
  gem 'faker', '1.7.3'
end

group :test do
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest-reporters', '1.1.14'
end

group :production do
  gem 'pg', '0.18.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]