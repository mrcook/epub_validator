# epubValidator - Check if your EPUB eBooks are valid

This library will check that your .epub files are valid IDPF EPUB documents (version 2.x and 3.0) and return a successful or error message. It can be called as a Ruby library, or invoked from the command line.

For more about the IDPF see http://idpf.org

For more about the epubcheck tool see http://code.google.com/p/epubcheck/


## Setup

```
gem install epub_validator
```

## Basic Usage

Sample usage and output:

``` ruby
require 'epub_validator'

epub = EpubValidator.check('/path/to/sample.epub')

puts "Invalid!" unless epub.valid?
epub.messages.each do |m|
  puts m
end
=> Invalid!
=> ERROR: OPS/toc.ncx(21): 'OPS/': referenced resource exists, but not declared in the OPF file
```

Now from the command line:

``` terminal
$ epub_validator /path/to/sample.epub

Checking....FAILED!

This is not a valid EPUB 3.0 ebook.

ERROR: OPS/toc.ncx(21): 'OPS/': referenced resource exists, but not declared in the OPF file
```


## Requirements

Java must be installed and set in your PATH.

## Future Features

* Command line: accept directory containing many .epub files for processing.
* Command line: have switch for writing results to log file
* Format "ERROR" and "WARNING" output for more intuitive instructions.
