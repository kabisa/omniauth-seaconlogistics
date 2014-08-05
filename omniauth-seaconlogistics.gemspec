# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/seaconlogistics/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-seaconlogistics'
  spec.version       = Omniauth::SeaconLogistics::VERSION
  spec.authors       = ['Ralph Rooding']
  spec.email         = ['ralph@ralphrooding.com']
  spec.summary       = %q{Seacon Logistics OAuth2 Strategy for OmniAuth}
  spec.homepage      = 'https://github.com/kabisaict/omniauth-seaconlogistics'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0.0'

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.2'
end
