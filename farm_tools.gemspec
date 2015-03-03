$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "farm_tools/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "farm_tools"
  s.version     = FarmTools::VERSION
  s.authors     = ["Jesse Farmer"]
  s.email       = ["jesse@anysoft.us"]
  s.homepage    = "http://anysoft.us"
  s.summary     = "Rails Tools that anysoft uses. Feel free to check them out."
  s.description = "Various Tools"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  # s.add_dependency "rails"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_dependency "koala", "~> 1.11.0rc"

  # s.add_development_dependency 'rspec-rails'
  # s.add_development_dependency 'capybara'
  # s.add_development_dependency 'factory_girl_rails'
end
