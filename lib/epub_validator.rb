Dir["#{File.dirname(__FILE__)}/epub_validator/**/*"].each {|file| require(file)}

require 'epub_validator/epub_check'

module EpubValidator
  def self.check(filename)
    EpubCheck.process(filename)
  end
end

