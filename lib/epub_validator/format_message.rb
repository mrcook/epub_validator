module EpubValidator
  class FormatMessage
    def process_message(message)
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
