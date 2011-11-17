require 'spec_helper'

module EpubValidator
  describe ProcessEpub do
    context "when it processes a file" do
      it "should return a message" do
        message = "Epubcheck Version 1.2\n\nERROR: rspec-test.epub: resource OEBPS/stylesheets/handbookish.css is missing\n\nCheck finished with warnings or errors!"
        ec = ProcessEpub.new
        ec.stub(:epubcheck).and_return(message)
        ec.epubcheck("test.epub").should eq(message)
      end
      it "should return a formatted message" do
        message = "Epubcheck Version 1.2\n\nERROR: book.epub: resource OEBPS/stylesheets/handbookish.css is missing\n\nCheck finished with warnings or errors!"
        formatted_message = ["FAILED!", "ERROR: book.epub: resource OEBPS/stylesheets/handbookish.css is missing"]
        ec = ProcessEpub.new
        ec.format_epubcheck_output(message).should eq(formatted_message)
      end
    end
  end
end
