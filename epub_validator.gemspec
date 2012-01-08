# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'epub_validator/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY

  s.name        = "epub_validator"
  s.version     = EpubValidator::VERSION
  s.summary     = %q{Check that your EPUB book is a valid IDPF document.}
  s.description = %q{EPUB Validator lets you check that your EPUB 2 files are valid IDPF documents with the help of the epubcheck tool.}

  s.authors     = ["Mike Cook"]
  s.email       = ["m@mikecook.co.uk"]
  s.homepage    = "https://github.com/mrcook/"

  s.required_ruby_version     = ">= 1.9.2"
  s.required_rubygems_version = ">= 1.3.6"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('rspec', '>= 2.8.0')
  s.add_development_dependency('ZenTest', '>= 4.6.2')
  s.add_development_dependency('autotest-growl', '>= 0.2.16')
end
