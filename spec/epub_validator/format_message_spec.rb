require 'spec_helper'

module EpubValidator
  describe FormatMessage do
    context "when it recieves a missing file message" do
      it "should return a 'FAILED!' message as an array" do
        message = "ERROR: test.epub: I/O error: test.epub (No such file or directory)"
        formatted_message = ["FAILED!", "ERROR: test.epub: I/O error: test.epub (No such file or directory)"]
        errm = FormatMessage.new
        errm.process_message(message).should eq(formatted_message)
      end
    end
    context "when it recieves a valid file message" do
      it "should return 'Passed.' message as an array" do
        message = "Epubcheck Version 1.2\n\nNo errors or warnings detected\n"
        errm = FormatMessage.new
        errm.process_message(message).should eq(['Passed.'])
      end
    end
    context "when it recieves an invalid file message" do
      it "should return error message as an array" do
        message = "Epubcheck Version 1.2\n\nERROR: book.epub: resource OEBPS/stylesheets/handbookish.css is missing\n\nCheck finished with warnings or errors!"
        formatted_message = ["FAILED!", "ERROR: book.epub: resource OEBPS/stylesheets/handbookish.css is missing"]
        errm = FormatMessage.new
        errm.process_message(message).should eq(formatted_message)
      end
    end
  end
end
