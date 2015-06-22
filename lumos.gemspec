# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lumos/version'

Gem::Specification.new do |spec|
  spec.name          = "lumos"
  spec.version       = Lumos::VERSION
  spec.authors       = ["query-string"]
  spec.email         = ["atimofeev@reactant.ru"]
  spec.summary       = "Objects wrapping library"
  spec.description   = "Have you ever tried to highlight your Ruby objects from your controllers/models/whatever in the Rails log? Lumos can easily wrap and make any object perceptible amongs common Rails log mess!"
  spec.homepage      = "https://github.com/query-string/lumos"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rumoji", "0.4.1"
  spec.add_development_dependency "activesupport", "4.2"
  spec.add_development_dependency "activerecord", "4.2"
  spec.add_development_dependency "sqlite3", "~> 1.3"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.4"
end
