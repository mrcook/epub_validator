module EpubValidator
  class CheckEpub
    attr_accessor :message

    def initialize(filename)
      @filename = filename
      @message = format_epubcheck_message(process_epub)
    end

    def process_epub
      epubcheck_jar = File.expand_path(File.dirname(__FILE__) + '/../epubcheck-1-2/epubcheck-1.2.jar')
      epubcheck = `java -jar #{epubcheck_jar} "#{@filename}" 2>&1`
    end

    def format_epubcheck_message(message)
      return ['Passed.'] if message.match('No errors or warnings detected')

      m_array = message.split(/\n/)

      # clean up all useless info
      m_array.delete_if do |s|
        s.empty? or
          s.match('^Epubcheck Version.*') or
          s.match('^Check finished.*')
      end

      m_array.unshift('FAILED!')
    end
  end
end
