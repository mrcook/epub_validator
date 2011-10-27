require 'spec_helper'

module EpubValidator
  describe CheckEpub do
    describe "missing file" do
      it "should exit with missing file message" do
        # THIS TEST NEEDS MOCKING!
        missing_epub = "Epubcheck Version 1.2\n\nNo .epub file to check was specified in arguments!\nThe tool will EXIT!\n"
        checker = CheckEpub.new('rspec_missing_file_test.epub')
        message_array = checker.validation_message
        message_array[0].should == 'FAILED!'
        message_array[1].should =~ /\(No such file or directory\)$/
      end
    end
    describe "valid epub" do
      it "should return successful epubcheck message" do
        successful_message = "Epubcheck Version 1.2\n\nNo errors or warnings detected\n"
        checker = CheckEpub.new('test.epub')
        checker.format_epubcheck_message(successful_message).should == 'Passed.'
      end
    end
    describe "invalid epub" do
      it "should return failed message array" do
        failed_message = "Epubcheck Version 1.2\n\nERROR: book.epub: resource OEBPS/stylesheets/handbookish.css is missing\n\nCheck finished with warnings or errors!"
        formatted_message = ["FAILED!", "ERROR: book.epub: resource OEBPS/stylesheets/handbookish.css is missing"]
        checker = CheckEpub.new('test.epub')
        checker.format_epubcheck_message(failed_message).should == formatted_message
      end
    end
  end
end
