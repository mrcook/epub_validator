require 'spec_helper'

module EpubValidator
  describe EpubCheck do
    context "when it processes a file" do
      it "should return a message" do
        message = "Epubcheck Version 1.2\n\nERROR: book.epub: resource OEBPS/stylesheets/handbookish.css is missing\n\nCheck finished with warnings or errors!"
        EpubCheck.stub(:epubcheck).and_return(message)
        ec = EpubCheck.epubcheck("test.epub")
        ec.should eq(message)
      end
    end
  end
end
