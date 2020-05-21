$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'helm-rb/version'

Gem::Specification.new do |s|
  s.name     = 'helm-rb'
  s.version  = ::HelmRb::VERSION
  s.authors  = ['Cameron Dutro']
  s.email    = ['camertron@gmail.com']
  s.homepage = 'http://github.com/getkuby/helm-rb'
  s.license  = 'Apache-2.0'

  s.description = s.summary = 'Helm distributed as a Rubygem.'

  s.platform = Gem::Platform::RUBY

  s.require_path = 'lib'
  s.files = Dir['{lib,spec,vendor}/**/*', 'Gemfile', 'CHANGELOG.md', 'README.md', 'Rakefile', 'helm-rb.gemspec']
end
