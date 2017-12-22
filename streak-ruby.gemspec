# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'streak/version'

Gem::Specification.new do |spec|
  spec.name          = "streak-ruby"
  spec.version       = Streak::VERSION
  spec.authors       = ["JS Boulanger"]
  spec.email         = ["jsboulanger@gmail.com"]
  spec.description   = "Ruby bindings for the Streak API."
  spec.summary       = "Ruby bindings for the Streak API."
  spec.homepage      = "https://github.com/jsboulanger/streak-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('rest-client')
  spec.add_dependency('multi_json')

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-its"
end
