require File.dirname(__FILE__) + '/spec_helper'

describe WpGenerate::Generator do
  it "should not be possible to instantiate directly" do
    lambda { WpGenerate::Generator.new }.should raise_error NotImplementedError
  end

  it "should correctly determine the cwd" do
    class BlankGen < WpGenerate::Generator
      def initialize
      end
    end

    BlankGen.new.cwd.should == Dir.pwd
    ENV['WPGEN_WORK_DIR'] = '/tmp'
    BlankGen.new.cwd.should == '/tmp'
  end
end
