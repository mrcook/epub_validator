class EpubValidator::CheckEpub
  def initialize(filename)
    @filename = filename
  end

  def validate_epub_file
    epubcheck_jar = 'lib/epubcheck-1.2/epubcheck-1.2.jar'
    message = `java -jar #{epubcheck_jar} "#{@filename}" 2>&1`
    format_message(message)
  end

  private

  def format_message(message)
    messages_array = message.split(/\n/)

    # clean up all useless info
    messages_array.delete_if do |s|
      s.empty? or
      s.match('^Epubcheck Version.*') or
      s.match('^Check finished.*')
    end
  end
end

