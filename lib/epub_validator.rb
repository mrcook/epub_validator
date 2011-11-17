Dir["#{File.dirname(__FILE__)}/epub_validator/**/*"].each {|file| require(file)}

require 'epub_validator/process_epub'

module EpubValidator
  def self.check(filename)
    check = ProcessEpub.new
    check.epubcheck(filename)
  end
end

