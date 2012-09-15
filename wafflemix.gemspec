$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wafflemix/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wafflemix"
  s.version     = Wafflemix::VERSION
  s.authors     = ["James Rissler"]
  s.email       = ["risslerjames@gmail.com"]
  s.homepage    = "Coming Soon"
  s.summary     = "Bootstrap based CMS"
  s.description = "Coming Soon"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  # s.add_dependency "jquery-rails"

  s.add_dependency "jquery-rails"
  s.add_dependency 'bootstrap-sass', '~> 2.0.4.1'
  s.add_dependency 'formtastic', '~> 2.2.1'
  s.add_dependency 'formtastic-bootstrap', :git => 'https://github.com/niedfelj/formtastic-bootstrap.git', :branch => 'bootstrap2-rails3-2-formtastic-2-2'
  s.add_dependency 'globalize3', :git => 'git://github.com/svenfuchs/globalize3.git', :branch => 'master'
  s.add_dependency 'mercury-rails'
  s.add_dependency 'devise', '2.0.4'
  s.add_dependency 'ancestry', '1.3.0'
  s.add_dependency 'dragonfly'
  s.add_dependency 'fog'
end
