# epubValidator - Check your EPUB Books

This library will check that your EPUB v2 files are valid IDPF documents (using epubcheck-1.2.jar) and return a successful or error message. It can be called as a Ruby library, or invoked from the command line.

For more about the IDPF see http://idpf.org
For more about the epubcheck tool see http://code.google.com/p/epubcheck/


## Setup

```
gem install epub_validator
```

## Basic Usage

Sample usage and output for a missing EPUB file:

``` ruby
require 'epub_validator'

ev = EpubValidator.check_file('/path/to/missing.epub')
ev.message.each do |m|
  puts m
end
=> # FAILED!
=> # ERROR: /path/to/missing.epub: I/O error: path/to/missing.epub (No such file or directory)
```

Now from the command line:

``` terminal
$ epub_validator /path/to/missing.epub
Checking....
FAILED!
ERROR: /path/to/missing.epub: I/O error: /path/to/missing.epub (No such file or directory)
```


## Requirements

Java must be installed and set in your PATH.

## Future Features

* Accept directory containing many .epub files for processing.
* Write results to log file.
* Format "error" output for more intuitive instructions.
