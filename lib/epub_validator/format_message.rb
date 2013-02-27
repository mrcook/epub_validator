module EpubValidator
  class FormatMessage
    attr_reader :error_status, :message_list, :epub_version
    private :error_status, :message_list

    def initialize(raw_message)
      @message_list = raw_message.split(/\n/)

      @epub_version = extract_epub_version_message
      @error_status = get_error_status

      remove_uneeded_messages
    end

    def valid?
      return true if error_status
      false
    end

    def messages
      message_list
    end

  private

    def get_error_status
      return true if message_list.delete('No errors or warnings detected.')
      false
    end

    def extract_epub_version_message
      index = message_list.index { |msg| msg.match(/\AValidating against EPUB version (.+)\Z/) }
      message_list.delete_at(index) if index
      $1
    end

    def remove_uneeded_messages
      message_list.delete nil
      message_list.delete ''
      message_list.delete_if { |msg| msg.match(/\AEpubcheck Version.+\Z/) }
      message_list.delete_if { |msg| msg.match(/\ACheck finished.+\Z/) }
    end
  end
end
