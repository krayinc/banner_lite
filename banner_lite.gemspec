$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "banner_lite/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "banner_lite"
  s.version     = BannerLite::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of BannerLite."
  s.description = "TODO: Description of BannerLite."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.0.beta1"

  s.add_development_dependency "sqlite3"
end
