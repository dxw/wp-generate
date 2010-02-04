require File.dirname(__FILE__) + '/../lib/wp_generate'
require 'spec'

class BlankGen < WpGenerate::Generator
  def initialize
  end
end

# Use Kernel.open so we can stub it
def open *args, &block
  Kernel.open *args, &block
end
