# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'growbot/logger/version'

Gem::Specification.new do |spec|
  spec.name          = "growbot-logger"
  spec.version       = Growbot::Logger::VERSION
  spec.authors       = ["David Long"]
  spec.email         = ["dave@davejlong.com"]
  spec.summary       = %q{Sensor logger for Growbot}
  spec.homepage      = "http://github.com/davejlong/growbot-logger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency 'ashikawa-core', '~> 0.10'
  spec.add_runtime_dependency 'arduino_firmata', '~> 0.3'
end
