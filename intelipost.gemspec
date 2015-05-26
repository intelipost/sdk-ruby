# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'intelipost/version'

Gem::Specification.new do |spec|
  spec.name          = "intelipost"
  spec.version       = Intelipost::VERSION
  spec.authors       = ["Eduardo Sampaio"]
  spec.email         = ["eduardo@sampa.io"]
  spec.description   = %q{Gem to access the REST API of Intelipost}
  spec.summary       = %q{Gem to access the REST API of Intelipost}
  spec.homepage      = "http://github.com/natuelabs/intelipost"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.9.1"
  spec.add_dependency "faraday_middleware", "~> 0.9.1"
  spec.add_dependency "hashie", "~> 3.4.1"
  spec.add_dependency 'em-http-request', '~> 1.1.2'

  spec.add_development_dependency "bundler", ">= 1.7.6"
  spec.add_development_dependency "rake", "~> 10.4.2"
  spec.add_development_dependency "rspec", "~> 3.2.0"
  spec.add_development_dependency "vcr", "~> 2.9.3"
  spec.add_development_dependency "webmock", "~> 1.21"
  spec.add_development_dependency "simplecov", "~> 0.10"
  spec.add_development_dependency "dotenv", "~> 2.0.1"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.4.7"
end
