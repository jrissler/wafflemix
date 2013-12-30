$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wafflemix/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wafflemix"
  s.version     = Wafflemix::VERSION
  s.authors     = ["James Rissler"]
  s.email       = ["risslerjames@gmail.com"]
  s.homepage    = "https://github.com/jrissler/wafflemix"
  s.summary     = "Bootstrap based CMS"
  s.description = "Coming Soon"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  # s.add_dependency "jquery-rails"

  s.add_dependency "jquery-rails"
  s.add_dependency 'bootstrap-sass', '~> 2.0.4.1'
  s.add_dependency 'formtastic', '~> 2.2.1'
  s.add_dependency 'formtastic-bootstrap'
  s.add_dependency 'globalize3'
  s.add_dependency 'mercury-rails'
  s.add_dependency 'devise', '2.0.4'
  s.add_dependency 'ancestry', '1.3.0'
  s.add_dependency 'dragonfly'
  s.add_dependency 'fog'
  s.add_dependency 'haml-rails'
  s.add_dependency 'acts-as-taggable-on', '~> 2.3.1'
  s.add_dependency 'american_date'
  s.add_dependency 'spamster'
  s.add_dependency 'net-scp', '~> 1.1'
end
