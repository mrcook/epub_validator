require 'spec_helper'

module EpubValidator
  describe FormatMessage do
    it "should be valid" do
      errm = FormatMessage.new("Epubcheck Version 3.0\n\nValidating against EPUB version 3.0\nNo errors or warnings detected.\n")
      errm.valid?.should be true
    end
    it "should set the EPUB version that is being checked" do
      errm = FormatMessage.new("Epubcheck Version 3.0\n\nValidating against EPUB version 3.0\nNo errors or warnings detected.\n")
      errm.epub_version.should eq '3.0'
    end

    context "when no file is given" do
      it "should not be valid" do
        message = "Epubcheck Version 3.0\n\nAt least one argument expected"
        errm = FormatMessage.new(message)
        errm.valid?.should be false
      end
    end

    context "when it recieves an invalid file message" do
      it "should not be valid" do
        errm = FormatMessage.new("Epubcheck Version 3.0\n\nAt least one argument expected")
        errm.valid?.should be false
      end
      it "should return error message as an array" do
        message = "Epubcheck Version 3.0\n\nValidating against EPUB version 3.0\nERROR: book.epub: resource OEBPS/stylesheets/handbookish.css is missing\n\nCheck finished with warnings or errors"
        formatted_message = ["ERROR: book.epub: resource OEBPS/stylesheets/handbookish.css is missing"]
        errm = FormatMessage.new(message)
        errm.messages.should eq formatted_message
      end
    end
  end
end
