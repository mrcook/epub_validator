module EpubValidator
  class EpubCheck
    def self.process(filename)
      checked = epubcheck(filename)
      format_epubcheck_message(checked)
    end

    private

    def self.epubcheck(epubfile)
      epubcheck_jar = File.expand_path(File.dirname(__FILE__) + '/../epubcheck-1-2/epubcheck-1.2.jar')
      `java -jar #{epubcheck_jar} "#{epubfile}" 2>&1`
    end

    def self.format_epubcheck_message(message)
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
