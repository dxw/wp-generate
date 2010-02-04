require File.dirname(__FILE__) + '/spec_helper'

describe WpGenerate::Generator do
  it "should not be possible to instantiate directly" do
    lambda { WpGenerate::Generator.new }.should raise_error NotImplementedError
  end

  it "should correctly determine the cwd" do
    g = BlankGen.new
    g.cwd.should == Dir.pwd
    ENV['WPGEN_WORK_DIR'] = '/tmp'
    g.cwd.should == '/tmp'
  end

  it "should parse options correctly" do
    g = BlankGen.new
    g.instance_eval { @options = %w[hello there -f -c -d] }
    g.opt_parse
    g.instance_eval { @options[:force].should == true }
  end
end
