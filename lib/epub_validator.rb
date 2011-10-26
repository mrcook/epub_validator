Dir["#{File.dirname(__FILE__)}/epub_validator/**/*"].each {|file| require(file)}

require 'epub_validator/check_epub'

module EpubValidator
  def self.process_file(filename)
    epub = CheckEpub.new(filename)
    puts epub.validate_epub_file
  end
end
