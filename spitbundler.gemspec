# encoding: utf-8

require File.expand_path('../lib/spitbundler/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'spitbundler'
  spec.version       = Spitbundler::VERSION
  spec.authors       = ['Cameron Dutro']
  spec.email         = ['camertron@gmail.com']
  spec.summary       = ''
  spec.description   = ''
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry-nav'
end
