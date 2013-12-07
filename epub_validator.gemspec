# -*- encoding: utf-8 -*-
require File.expand_path('../lib/epub_validator/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "epub_validator"
  gem.version       = EpubValidator::VERSION
  gem.authors       = ["Mike Cook"]
  gem.email         = ["m@mikecook.co.uk"]
  gem.summary       = %q{Check that your EPUB book is a valid IDPF document.}
  gem.description   = %q{EPUB Validator lets you check that your EPUB files are valid IDPF documents with the help of the epubcheck tool.}

  gem.platform      = Gem::Platform::RUBY
  gem.files         = `git ls-files`.split($\)
  gem.require_paths = ['lib']
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  gem.required_ruby_version = '>= 1.9.3'

  gem.add_development_dependency('rspec', '~> 2.14.1')
end
