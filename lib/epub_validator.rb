Dir["#{File.dirname(__FILE__)}/epub_validator/**/*"].each {|file| require(file)}

require 'epub_validator/process_epub'

module EpubValidator
  def self.check(filename)
    pe = ProcessEpub.new
    message = pe.epubcheck(filename)
    validation = FormatErrorMessage.new
    validation.process_message(message)
  end
end

