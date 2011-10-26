class EpubValidator::CheckEpub
  def initialize(filename)
    @filename = filename
  end

  def validate_epub_file
    epubcheck_jar = 'lib/epubcheck-1.2/epubcheck-1.2.jar'
    message = `java -jar #{epubcheck_jar} "#{@filename}" 2>&1`

    if message.match('No errors or warnings detected')
      'Passed.'
    else
      format_failed_validation_message(message)
    end
  end

  private

  def format_failed_validation_message(message)
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

