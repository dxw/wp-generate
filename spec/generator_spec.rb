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

  it "should create appropriate files from templates" do
    g = BlankGen.new
    g.instance_eval { @templates = {'abc' => 'def'}; @vars = {:name => 'the_name'}; @options = %w[-q] }
    full_path = %r[/templates/blankgen/abc$]
    output = %r[/def$]
    text = "Here is some text"

    File.should_receive(:exist?).with(full_path).and_return(true)
    File.should_receive(:exist?).with(output).and_return(false)
    File.should_receive(:directory?).with(an_instance_of(String)).and_return(true)
    f = mock
    f.should_receive(:write).with(text)
    Kernel.should_receive(:open).with(output,'w+').and_yield(f)
    f2 = mock
    f2.should_receive(:read).and_return(text)
    Kernel.should_receive(:open).with(full_path).and_return(f2)
    g.generate
  end
end
