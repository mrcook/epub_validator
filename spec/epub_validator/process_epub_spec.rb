require 'spec_helper'

module EpubValidator
  describe ProcessEpub do

    describe "#initialize" do
      it "should initialize correctly" do
        pe = ProcessEpub.new
        pe.should respond_to :epubcheck
        pe.should respond_to :format_epubcheck_output
      end
    end

  end
end
