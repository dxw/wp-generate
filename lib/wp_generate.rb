require 'active_support'
class WpGenerate; end
require 'wp_generate/generator'

String.send :include, ActiveSupport::CoreExtensions::String::Inflections

class WpGenerate
  def self.generate args
    generator = args.shift

    generator_path = 'wp_generate/generator/'+generator
    require generator_path

    generator_path.camelize.constantize.new(args).generate
  end
end
