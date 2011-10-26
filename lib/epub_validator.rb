Dir["#{File.dirname(__FILE__)}/epub_validator/**/*"].each {|file| require(file)}

module EpubValidator
  class CheckEpub
    attr_accessor :filename

    def initialize(filename)
      @filename = filename
    end

    def get_epubcheck_output
      results = `java -jar epubcheck-1.2/epubcheck-1.2.jar "#{@filename}" 2>&1`
      #results = external.split("\n")

      ## clean up all useless info
      #results.delete_if do |s|
      #s.empty? or
      #s.match('^Epubcheck Version.*') or
      #s.match('^No errors.*') or
      #s.match('^Check finished.*')
      #end
    end
  end
end
