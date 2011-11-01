require 'spec_helper'

module EpubValidator
  describe EpubCheck do
    context "when it tries to process a missing file" do
      it "should return a formatted I/O error message" do
        message = "ERROR: test.epub: I/O error: test.epub (No such file or directory)"
        formatted_message = ["FAILED!", "ERROR: test.epub: I/O error: test.epub (No such file or directory)"]
        EpubCheck.stub(:epubcheck).and_return(message)
        ec = EpubCheck.process("test.epub")
        ec.should eq(formatted_message)
      end
    end
    context "when it processes a valid file" do
      it "should return 'Passed.' message as an array" do
        message = "Epubcheck Version 1.2\n\nNo errors or warnings detected\n"
        EpubCheck.stub(:epubcheck).and_return(message)
        ec = EpubCheck.process("test.epub")
        ec.should eq(['Passed.'])
      end
    end
    context "when it processes an invalid file" do
      it "should return error message as an array" do
        message = "Epubcheck Version 1.2\n\nERROR: book.epub: resource OEBPS/stylesheets/handbookish.css is missing\n\nCheck finished with warnings or errors!"
        formatted_message = ["FAILED!", "ERROR: book.epub: resource OEBPS/stylesheets/handbookish.css is missing"]
        EpubCheck.stub(:epubcheck).and_return(message)
        ec = EpubCheck.process("test.epub")
        ec.should eq(formatted_message)
      end
    end
  end
end
