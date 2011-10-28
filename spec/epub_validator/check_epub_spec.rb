require 'spec_helper'

module EpubValidator
  describe CheckEpub do
    context "when it tries to process a missing file" do
      it "should return missing file error message" do
        failed_message = 'FAILED!\n\nNo .epub file to check was specified in arguments!\n\nThe tool will EXIT!'
        ce = CheckEpub.new('test.epub')
        CheckEpub.any_instance.stub(:process_epub).and_return(failed_message)
        ce.process_epub.should eq(failed_message)
      end
    end
    context "when it processes a valid file" do
      it "should return 'Passed.' message as an array" do
        success_message = "Epubcheck Version 1.2\n\nNo errors or warnings detected\n"
        ce = CheckEpub.new('test.epub')
        ce.format_epubcheck_message(success_message).should eq(['Passed.'])
      end
    end
    context "when it processes an invalid file" do
      it "should return error message as an array" do
        failed_message = "Epubcheck Version 1.2\n\nERROR: book.epub: resource OEBPS/stylesheets/handbookish.css is missing\n\nCheck finished with warnings or errors!"
        formatted_failed_message = ["FAILED!", "ERROR: book.epub: resource OEBPS/stylesheets/handbookish.css is missing"]
        ce = CheckEpub.new('test.epub')
        ce.format_epubcheck_message(failed_message).should eq(formatted_failed_message)
      end
    end
  end
end
