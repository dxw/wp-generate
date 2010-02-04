require File.dirname(__FILE__) + '/spec_helper'

describe WpGenerate::Generator do
  it "should not be possible to instantiate directly" do
    lambda { WpGenerate::Generator.new }.should raise_error NotImplementedError
  end
end
