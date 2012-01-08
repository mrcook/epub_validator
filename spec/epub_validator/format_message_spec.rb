require 'spec_helper'

module EpubValidator
  describe FormatMessage do
    context "when it receives a missing file message" do
      it "should return a failed hash message" do
        message = "ERROR: test.epub: I/O error: test.epub (No such file or directory)"
        formatted_message = ["#{message}"]

        errm = FormatMessage.new
        m = errm.process_message(message)
        m[:valid].should eq(0)
        m[:message].should eq(formatted_message)
      end
    end
    context "when it receives a valid file message" do
      it "should return :valid => 1" do
        message = "Epubcheck Version 1.2\n\nNo errors or warnings detected\n"
        errm = FormatMessage.new
        errm.process_message(message).should eq(:valid => 1)
      end
    end
    context "when it recieves an invalid file message" do
      it "should return error message as an array" do
        message = "Epubcheck Version 1.2\n\nERROR: book.epub: resource OEBPS/stylesheets/handbookish.css is missing\n\nCheck finished with warnings or errors!"
        formatted_message = ["ERROR: book.epub: resource OEBPS/stylesheets/handbookish.css is missing"]

        errm = FormatMessage.new
        m = errm.process_message(message)
        m[:valid].should eq(0)
        m[:message].should eq(formatted_message)
      end
    end
  end
end
