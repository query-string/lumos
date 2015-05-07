# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lumos/version'

Gem::Specification.new do |spec|
  spec.name          = "lumos"
  spec.version       = Lumos::VERSION
  spec.authors       = ["query-string"]
  spec.email         = ["atimofeev@reactant.ru"]
  spec.summary       = "Nifty wrapper for your strings"
  spec.description   = "Piu-piu, ololo"
  spec.homepage      = "https://github.com/query-string/lumos"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "codeclimate-test-reporter"
end
