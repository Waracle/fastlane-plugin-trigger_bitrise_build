lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/trigger_bitrise_build/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-trigger_bitrise_build'
  spec.version       = Fastlane::TriggerBitriseBuild::VERSION
  spec.author        = 'Nick Hammond'
  spec.email         = 'n.hammond@waracle.com'

  spec.summary       = 'Trigger a Bitrise build from Fastlane'
  spec.homepage      = "https://github.com/waracle/fastlane-plugin-trigger_bitrise_build"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # Don't add a dependency to fastlane or fastlane_re
  # since this would cause a circular dependency

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'fastlane', '>= 2.62.1'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end
