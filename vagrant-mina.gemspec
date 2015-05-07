# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-mina/version'

Gem::Specification.new do |spec|
  spec.name          = 'vagrant-mina'
  spec.version       = VagrantPlugins::Mina::VERSION
  spec.authors       = ['Tim Leicy']
  spec.email         = ['contact@coderhelps.com']
  spec.description   = %q{A mina provisioner for Vagrant.}
  spec.summary       = <<-SUMMARY
A Vagrant plugin which adds the ability to provision virtual machines with
the mina gem.
SUMMARY
  spec.homepage      = 'https://github.com/briskget/vagrant-mina'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'mina'
  spec.add_runtime_dependency 'activesupport'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
