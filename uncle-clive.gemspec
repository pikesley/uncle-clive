# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uncle_clive/version'

Gem::Specification.new do |spec|
  spec.name        = "uncle-clive"
  spec.version     = UncleClive::VERSION
  spec.authors     = ["pikesley"]
  spec.email       = ["github@orgraphone.org"]
  spec.description = %q{pointlessly generate the Sinclair Spectrum character set}
  spec.summary     = %q{see above}
  spec.homepage    = ""
  spec.license     = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
