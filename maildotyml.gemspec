# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'maildotyml/version'

Gem::Specification.new do |spec|
  spec.name          = "maildotyml"
  spec.version       = Maildotyml::VERSION
  spec.authors       = ["Amiel Martin"]
  spec.email         = ["amiel@carnesmedia.com"]
  spec.description   = %q{Add mail.yml to rails}
  spec.summary       = %q{
    Configure ActionMailer with mail.yml, like ActiveRecord and database.yml.
  }
  spec.homepage      = "https://github.com/carnesmedia/maildotyml"
  spec.license       = "MIT"

  spec.files         = Dir["{lib}/**/*"] + ["LICENSE.txt", "Rakefile", "README.md"]
  # spec.test_files    = Dir["test/**/*"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
