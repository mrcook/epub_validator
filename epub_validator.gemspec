# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'epub_validator/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY

  s.name        = "epubValidator"
  s.version     = epub_validator::VERSION
  s.summary     = %q{Run epubcheck.jar on single/multiple EPUB files.}
  s.description = %q{epubValidator allows you to check your EPUB files for errors using the epubcheck Java file. You can check just one file, or a directory full of EPUB files and output any errors to a log file.}

  s.authors     = ["Mike Cook"]
  s.email       = ["m@mikecook.co.uk"]
  s.homepage    = "http://mikecook.co.uk"

  s.required_ruby_version     = ">= 1.9.2"
  s.required_rubygems_version = ">= 1.3.6"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # Examples
  #s.add_dependency('posix-spawn', "~> 0.3.6")
  #s.add_runtime_dependency "rest-client"

  s.add_dependency "rspec"
  s.add_dependency "ZenTest"
  #s.add_dependency "autotest-growl"
end
