$:.push File.expand_path("../lib", __FILE__)

require "banner_lite/version"

Gem::Specification.new do |s|
  s.name        = "banner_lite"
  s.version     = BannerLite::VERSION
  s.authors     = ["Hiroki Yoshioka"]
  s.email       = ["irohiroki@kray.jp"]
  s.homepage    = "https://github.com/krayinc/banner_lite"
  s.summary     = "A Rails engine for minimum banner management"
  s.description = "A Rails engine for minimum banner management"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "rspec-rails"
end
