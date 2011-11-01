Dir["#{File.dirname(__FILE__)}/epub_validator/**/*"].each {|file| require(file)}

require 'epub_validator/check_epub'

module EpubValidator
  def self.run(filename)
    EpubCheck.process(filename)
  end
end

