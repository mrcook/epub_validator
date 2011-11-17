module EpubValidator
  class ProcessEpub
    def epubcheck(filename)
      epubcheck_jar = File.expand_path(File.dirname(__FILE__) + '/../epubcheck-1-2/epubcheck-1.2.jar')
      `java -jar #{epubcheck_jar} "#{filename}" 2>&1`
    end
  end
end
