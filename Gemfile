source 'https://rubygems.org'

ruby '2.7.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.11'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'


# Use Unicorn as the app server
# gem 'unicorn'

gem 'themoviedb'

# Window support
gem 'tzinfo'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]

# without this gem the app would crash before starting
gem 'bigdecimal', '1.3.5'

gem 'pg', '~> 0.21'

# there is compatibily problem with oauth2(1.4.8) and faraday
gem 'oauth2', '1.4.7'

# Ok, this seemed to solve the problem:
gem 'omniauth-github', git: 'https://github.com/omniauth/omniauth-github.git', branch: 'master'
# gem 'omniauth-github', github: 'omniauth/omniauth-github', branch: 'master'
gem 'omniauth-rails_csrf_protection'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'rspec-rails'
  gem 'guard-rspec'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :production do
  gem 'rails_12factor'
end
