# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "capistrano/anycable/version"

Gem::Specification.new do |spec|
  spec.name          = "capistrano-anycable"
  spec.version       = Capistrano::AnyCable::VERSION
  spec.authors       = ["Sergey Ponomarev"]
  spec.email         = ["me@sergey-ponomarev.ru"]

  spec.summary       = "AnyCable integration for Capistrano"
  spec.description   = "AnyCable integration for Capistrano"
  spec.homepage      = "http://github.com/anycable/capistrano-anycable"
  spec.license       = "MIT"

  spec.files = `git ls-files README.md LICENSE.txt lib`.split
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.17"
  spec.add_development_dependency "rake", ">= 10.0"
  spec.add_development_dependency "rubocop", "~> 0.63.0"
  spec.add_development_dependency "rubocop-md", "~> 0.2"
  spec.add_development_dependency "standard", "~> 0.0.12"
end
