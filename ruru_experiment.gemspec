# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruru_experiment/version'

Gem::Specification.new do |spec|
  spec.name          = "ruru_experiment"
  spec.version       = RuruExperiment::VERSION
  spec.authors       = ["Matt Blewitt"]
  spec.email         = ["blewitt.matt@gmail.com"]

  spec.summary       = %q{Experiment with ruru}
  spec.description   = %q{Experiment with ruru}
  spec.homepage      = ""
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "ffi"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.8"
  spec.add_development_dependency "minitest-reporters", "~> 1.1"
  spec.add_development_dependency "color_pound_spec_reporter", "~> 0.0.5"
end
