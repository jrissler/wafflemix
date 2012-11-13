source "http://rubygems.org"

# Declare your gem's dependencies in wafflemix.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

gem "jquery-rails"
gem 'bootstrap-sass', '~> 2.0.4.1'
gem 'formtastic', '~> 2.2.1'
gem 'formtastic-bootstrap', :git => 'https://github.com/niedfelj/formtastic-bootstrap.git', :branch => 'bootstrap2-rails3-2-formtastic-2-2'
gem 'globalize3', :git => 'git://github.com/svenfuchs/globalize3.git', :branch => 'master'

gem 'mercury-rails', :git => 'https://github.com/jejacks0n/mercury.git', :ref => 'e220627d6b71e0eed0cdb15cf0a54f485ae073d9'
gem 'devise', '2.0.4'
gem 'ancestry', '1.3.0'

#image handling
gem 'dragonfly'
gem 'fog'

gem 'haml-rails'

gem 'jquery-fileupload-rails'

# TODO convert batch_translations to gem or add to globalize3 gem
# rails plugin install git://github.com/fidel/batch_translations.git

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "pg", "~> 0.14.0"
end

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
