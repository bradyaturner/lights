# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubyhue/version'

Gem::Specification.new do |s|
  s.name          = 'rubyhue'
  s.version       = RubyHue::VERSION
  s.authors       = ["Brady Turner"]
  s.email         = 'bradyaturner@gmail.com'
  s.description   = "Client library and CLI for controlling Phillips Hue lights."
  s.summary       = "rubyhue"
  s.homepage      = 'http://rubygems.org/gems/rubyhue'
  s.license       = 'MIT'
  s.date          = '2014-08-17'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]


  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
end
