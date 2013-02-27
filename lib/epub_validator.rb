Dir["#{File.dirname(__FILE__)}/epub_validator/**/*"].each {|file| require(file)}

require 'epub_validator/process_epub'

module EpubValidator
  def self.check(filename)
    validation = ProcessEpub.new
    validation.epubcheck(filename)
  end
end

