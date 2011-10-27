class EpubValidator::CheckEpub
  attr_accessor :validation_message

  def initialize(filename)
    @filename = filename

    @epubcheck_output = process_epub(@filename)
    @validation_message = format_epubcheck_message(@epubcheck_output)
  end

  def process_epub(filename)
    epubcheck_jar = 'lib/epubcheck-1.2/epubcheck-1.2.jar'
    `java -jar #{epubcheck_jar} "#{filename}" 2>&1`
  end

  def format_epubcheck_message(message)
    return "Passed." if message.match('No errors or warnings detected')

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

