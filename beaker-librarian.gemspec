# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'beaker/librarian/version'

Gem::Specification.new do |spec|
  spec.name          = "beaker-librarian"
  spec.version       = Beaker::Librarian::VERSION
  spec.authors       = ["Keith Thornhill"]
  spec.email         = ["keith.thornhill@gmail.com"]
  spec.summary       = %q{Helpers to allow beaker-based tests to use librarian-puppet for module installation on VM hosts}
  spec.description   = %q{Helpers to allow beaker-based tests to use librarian-puppet for module installation on VM hosts}
  spec.homepage      = "https://github.com/afex/beaker-librarian"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'beaker'
  spec.add_dependency 'beaker-rspec'
  
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
