# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "bpmcreate"
  s.platform    = Gem::Platform::RUBY
  s.version     = '0.0.1'

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "thor"

  s.files        = Dir.glob("{bin,lib}/**/*")
  s.executables  = ['bpmcreate']
  s.require_path = 'lib'
end
