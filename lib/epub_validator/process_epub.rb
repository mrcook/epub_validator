module EpubValidator
  class ProcessEpub
    def epubcheck(filename)
      epubcheck_jar = File.expand_path(File.dirname(__FILE__) + '/../epubcheck-3-0/epubcheck-3.0.jar')
      format_epubcheck_output(`java -jar #{epubcheck_jar} "#{filename}" 2>&1`)
    end

    def format_epubcheck_output(message)
      FormatMessage.new(message)
    end
  end
end
