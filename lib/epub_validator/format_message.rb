module EpubValidator
  class FormatMessage
    def process_message(message)
      status = Hash.new
      status[:valid] = 1
      return status if message.match('No errors or warnings detected')

      m_array = message.split(/\n/)

      # clean up all useless info
      m_array.delete_if do |s|
        s.empty? or
          s.match('^Epubcheck Version.*') or
          s.match('^Check finished.*')
      end

      status[:valid] = 0
      status[:message] = m_array
      return status
    end
  end
end
